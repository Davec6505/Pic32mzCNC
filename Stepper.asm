_SetPinMode:
;Stepper.c,12 :: 		void SetPinMode(){
;Stepper.c,15 :: 		EN_Step_PinDirX  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirX+0), 1
_SX	
;Stepper.c,16 :: 		DIR_Step_PinDirX = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirX+0), 1
_SX	
;Stepper.c,19 :: 		PLS_Step_PinDirX = 0;
_LX	
INS	R2, R0, BitPos(PLS_Step_PinDirX+0), 1
_SX	
;Stepper.c,23 :: 		EN_Step_PinDirY  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirY+0), 1
_SX	
;Stepper.c,24 :: 		DIR_Step_PinDirY = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirY+0), 1
_SX	
;Stepper.c,27 :: 		PLS_Step_PinDirY = 0;
_LX	
INS	R2, R0, BitPos(PLS_Step_PinDirY+0), 1
_SX	
;Stepper.c,31 :: 		EN_Step_PinDirZ  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirZ+0), 1
_SX	
;Stepper.c,32 :: 		DIR_Step_PinDirZ = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirZ+0), 1
_SX	
;Stepper.c,35 :: 		PLS_Step_PinDirZ = 0;
_LX	
INS	R2, R0, BitPos(PLS_Step_PinDirZ+0), 1
_SX	
;Stepper.c,39 :: 		EN_Step_PinDirA  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirA+0), 1
_SX	
;Stepper.c,40 :: 		DIR_Step_PinDirA = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirA+0), 1
_SX	
;Stepper.c,43 :: 		PLS_Step_PinDirA = 0;
_LX	
INS	R2, R0, BitPos(PLS_Step_PinDirA+0), 1
_SX	
;Stepper.c,46 :: 		}
L_end_SetPinMode:
JR	RA
NOP	
; end of _SetPinMode
_EnStepperX:
;Stepper.c,50 :: 		void EnStepperX(){
;Stepper.c,53 :: 		EN_StepX       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
;Stepper.c,54 :: 		}
L_end_EnStepperX:
JR	RA
NOP	
; end of _EnStepperX
_EnStepperY:
;Stepper.c,56 :: 		void EnStepperY(){
;Stepper.c,59 :: 		EN_StepY       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
;Stepper.c,60 :: 		}
L_end_EnStepperY:
JR	RA
NOP	
; end of _EnStepperY
_EnStepperZ:
;Stepper.c,61 :: 		void EnStepperZ(){
;Stepper.c,64 :: 		EN_StepZ       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
;Stepper.c,65 :: 		}
L_end_EnStepperZ:
JR	RA
NOP	
; end of _EnStepperZ
_EnStepperA:
;Stepper.c,66 :: 		void EnStepperA(){
;Stepper.c,69 :: 		EN_StepA       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepA+0), 1
_SX	
;Stepper.c,70 :: 		}
L_end_EnStepperA:
JR	RA
NOP	
; end of _EnStepperA
_EnableSteppers:
;Stepper.c,73 :: 		void EnableSteppers(int steppers){
;Stepper.c,75 :: 		for(i=0;i<steppers;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_EnableSteppers0:
; i start address is: 16 (R4)
SEH	R3, R4
SEH	R2, R25
SLT	R2, R3, R2
BNE	R2, R0, L__EnableSteppers39
NOP	
J	L_EnableSteppers1
NOP	
L__EnableSteppers39:
;Stepper.c,76 :: 		if(i==0) EN_StepX       = 0;
SEH	R2, R4
BEQ	R2, R0, L__EnableSteppers40
NOP	
J	L_EnableSteppers3
NOP	
L__EnableSteppers40:
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
L_EnableSteppers3:
;Stepper.c,77 :: 		if(i==1) EN_StepY       = 0;
SEH	R3, R4
ORI	R2, R0, 1
BEQ	R3, R2, L__EnableSteppers41
NOP	
J	L_EnableSteppers4
NOP	
L__EnableSteppers41:
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
L_EnableSteppers4:
;Stepper.c,78 :: 		if(i==2) EN_StepZ       = 0;
SEH	R3, R4
ORI	R2, R0, 2
BEQ	R3, R2, L__EnableSteppers42
NOP	
J	L_EnableSteppers5
NOP	
L__EnableSteppers42:
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
L_EnableSteppers5:
;Stepper.c,79 :: 		if(i==3) EN_StepA       = 0;
SEH	R3, R4
ORI	R2, R0, 3
BEQ	R3, R2, L__EnableSteppers43
NOP	
J	L_EnableSteppers6
NOP	
L__EnableSteppers43:
_LX	
INS	R2, R0, BitPos(EN_StepA+0), 1
_SX	
L_EnableSteppers6:
;Stepper.c,75 :: 		for(i=0;i<steppers;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,80 :: 		}
; i end address is: 16 (R4)
J	L_EnableSteppers0
NOP	
L_EnableSteppers1:
;Stepper.c,81 :: 		}
L_end_EnableSteppers:
JR	RA
NOP	
; end of _EnableSteppers
_EnableStepper:
;Stepper.c,83 :: 		void EnableStepper(int stepper){
;Stepper.c,84 :: 		switch(stepper){
J	L_EnableStepper7
NOP	
;Stepper.c,85 :: 		case X:EN_StepX = 0; break;
L_EnableStepper9:
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
J	L_EnableStepper8
NOP	
;Stepper.c,86 :: 		case Y:EN_StepY = 0; break;
L_EnableStepper10:
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
J	L_EnableStepper8
NOP	
;Stepper.c,87 :: 		case Z:EN_StepZ = 0; break;
L_EnableStepper11:
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
J	L_EnableStepper8
NOP	
;Stepper.c,88 :: 		case A:EN_StepA = 0; break;
L_EnableStepper12:
_LX	
INS	R2, R0, BitPos(EN_StepA+0), 1
_SX	
J	L_EnableStepper8
NOP	
;Stepper.c,91 :: 		}
L_EnableStepper7:
SEH	R2, R25
BNE	R2, R0, L__EnableStepper46
NOP	
J	L_EnableStepper9
NOP	
L__EnableStepper46:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__EnableStepper48
NOP	
J	L_EnableStepper10
NOP	
L__EnableStepper48:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__EnableStepper50
NOP	
J	L_EnableStepper11
NOP	
L__EnableStepper50:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__EnableStepper52
NOP	
J	L_EnableStepper12
NOP	
L__EnableStepper52:
L_EnableStepper8:
;Stepper.c,92 :: 		}
L_end_EnableStepper:
JR	RA
NOP	
; end of _EnableStepper
_DisableStepper:
;Stepper.c,94 :: 		void DisableStepper(){
;Stepper.c,95 :: 		EN_StepX      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepX+0)
_SX	
;Stepper.c,96 :: 		EN_StepY      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepY+0)
_SX	
;Stepper.c,97 :: 		EN_StepZ      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepZ+0)
_SX	
;Stepper.c,98 :: 		EN_StepA      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepA+0)
_SX	
;Stepper.c,99 :: 		}
L_end_DisableStepper:
JR	RA
NOP	
; end of _DisableStepper
_DisableSpindleInterrupt:
;Stepper.c,101 :: 		void DisableSpindleInterrupt(int stepper){
;Stepper.c,102 :: 		OC8IE_bit = 0;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
;Stepper.c,103 :: 		OC8CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+4)(GP)
;Stepper.c,104 :: 		}
L_end_DisableSpindleInterrupt:
JR	RA
NOP	
; end of _DisableSpindleInterrupt
_GET_RunState:
;Stepper.c,109 :: 		int GET_RunState(int axis_No){
;Stepper.c,110 :: 		return STPS[axis_No].run_state;
SEH	R3, R25
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LH	R2, 0(R2)
;Stepper.c,111 :: 		}
L_end_GET_RunState:
JR	RA
NOP	
; end of _GET_RunState
_Get_AxisStatus:
;Stepper.c,113 :: 		int Get_AxisStatus(int stepper){
;Stepper.c,114 :: 		int state = 0;
; state start address is: 16 (R4)
MOVZ	R4, R0, R0
;Stepper.c,115 :: 		switch(stepper){
J	L_Get_AxisStatus13
NOP	
; state end address is: 16 (R4)
;Stepper.c,116 :: 		case X:state = EN_StepX&1; break;
L_Get_AxisStatus15:
_LX	
EXT	R2, R2, BitPos(EN_StepX+0), 1
ANDI	R2, R2, 1
; state start address is: 8 (R2)
ANDI	R2, R2, 255
; state end address is: 8 (R2)
J	L_Get_AxisStatus14
NOP	
;Stepper.c,117 :: 		case Y:state = EN_StepY&1; break;
L_Get_AxisStatus16:
_LX	
EXT	R2, R2, BitPos(EN_StepY+0), 1
ANDI	R2, R2, 1
; state start address is: 8 (R2)
ANDI	R2, R2, 255
; state end address is: 8 (R2)
J	L_Get_AxisStatus14
NOP	
;Stepper.c,118 :: 		case Z:state = EN_StepZ&1; break;
L_Get_AxisStatus17:
_LX	
EXT	R2, R2, BitPos(EN_StepZ+0), 1
ANDI	R2, R2, 1
; state start address is: 8 (R2)
ANDI	R2, R2, 255
; state end address is: 8 (R2)
J	L_Get_AxisStatus14
NOP	
;Stepper.c,119 :: 		case A:state = EN_StepA&1; break;
L_Get_AxisStatus18:
_LX	
EXT	R2, R2, BitPos(EN_StepA+0), 1
ANDI	R2, R2, 1
; state start address is: 8 (R2)
ANDI	R2, R2, 255
; state end address is: 8 (R2)
J	L_Get_AxisStatus14
NOP	
;Stepper.c,122 :: 		}
L_Get_AxisStatus13:
; state start address is: 16 (R4)
SEH	R2, R25
BNE	R2, R0, L__Get_AxisStatus58
NOP	
J	L_Get_AxisStatus15
NOP	
L__Get_AxisStatus58:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Get_AxisStatus60
NOP	
J	L_Get_AxisStatus16
NOP	
L__Get_AxisStatus60:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Get_AxisStatus62
NOP	
J	L_Get_AxisStatus17
NOP	
L__Get_AxisStatus62:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Get_AxisStatus64
NOP	
J	L_Get_AxisStatus18
NOP	
L__Get_AxisStatus64:
; state end address is: 16 (R4)
SEH	R2, R4
L_Get_AxisStatus14:
;Stepper.c,123 :: 		return state;
; state start address is: 8 (R2)
; state end address is: 8 (R2)
;Stepper.c,124 :: 		}
L_end_Get_AxisStatus:
JR	RA
NOP	
; end of _Get_AxisStatus
_Get_Axis_IEnable_States:
;Stepper.c,128 :: 		int Get_Axis_IEnable_States(){
;Stepper.c,129 :: 		int temp = 0;
; temp start address is: 16 (R4)
MOVZ	R4, R0, R0
;Stepper.c,130 :: 		temp |= EN_StepX << 3;
_LX	
EXT	R2, R2, BitPos(EN_StepX+0), 1
ANDI	R2, R2, 255
SLL	R2, R2, 3
OR	R3, R4, R2
; temp end address is: 16 (R4)
;Stepper.c,131 :: 		temp |= EN_StepY << 2;
_LX	
EXT	R2, R2, BitPos(EN_StepY+0), 1
ANDI	R2, R2, 255
SLL	R2, R2, 2
OR	R3, R3, R2
;Stepper.c,132 :: 		temp |= EN_StepZ << 1;
_LX	
EXT	R2, R2, BitPos(EN_StepZ+0), 1
ANDI	R2, R2, 255
SLL	R2, R2, 1
OR	R3, R3, R2
;Stepper.c,133 :: 		temp |= EN_StepA << 0;
_LX	
EXT	R2, R2, BitPos(EN_StepA+0), 1
ANDI	R2, R2, 255
OR	R2, R3, R2
;Stepper.c,134 :: 		return temp;
;Stepper.c,135 :: 		}
L_end_Get_Axis_IEnable_States:
JR	RA
NOP	
; end of _Get_Axis_IEnable_States
_Single_Axis_Enable:
;Stepper.c,140 :: 		void Single_Axis_Enable(_axis_ axis_){
;Stepper.c,142 :: 		axis_running =0;
SH	R0, Offset(Stepper_axis_running+0)(GP)
;Stepper.c,144 :: 		switch(axis_){
J	L_Single_Axis_Enable19
NOP	
;Stepper.c,145 :: 		case X:
L_Single_Axis_Enable21:
;Stepper.c,146 :: 		EN_StepX = 0;
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
;Stepper.c,147 :: 		break;
J	L_Single_Axis_Enable20
NOP	
;Stepper.c,148 :: 		case Y:
L_Single_Axis_Enable22:
;Stepper.c,149 :: 		EN_StepY = 0;
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
;Stepper.c,150 :: 		break;
J	L_Single_Axis_Enable20
NOP	
;Stepper.c,151 :: 		case Z:
L_Single_Axis_Enable23:
;Stepper.c,152 :: 		EN_StepZ = 0;
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
;Stepper.c,153 :: 		break;
J	L_Single_Axis_Enable20
NOP	
;Stepper.c,154 :: 		case A:
L_Single_Axis_Enable24:
;Stepper.c,155 :: 		EN_StepA = 0;
_LX	
INS	R2, R0, BitPos(EN_StepA+0), 1
_SX	
;Stepper.c,156 :: 		break;
J	L_Single_Axis_Enable20
NOP	
;Stepper.c,164 :: 		default:
L_Single_Axis_Enable25:
;Stepper.c,165 :: 		break;
J	L_Single_Axis_Enable20
NOP	
;Stepper.c,166 :: 		}
L_Single_Axis_Enable19:
ANDI	R2, R25, 255
BNE	R2, R0, L__Single_Axis_Enable68
NOP	
J	L_Single_Axis_Enable21
NOP	
L__Single_Axis_Enable68:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Single_Axis_Enable70
NOP	
J	L_Single_Axis_Enable22
NOP	
L__Single_Axis_Enable70:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Single_Axis_Enable72
NOP	
J	L_Single_Axis_Enable23
NOP	
L__Single_Axis_Enable72:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Single_Axis_Enable74
NOP	
J	L_Single_Axis_Enable24
NOP	
L__Single_Axis_Enable74:
J	L_Single_Axis_Enable25
NOP	
L_Single_Axis_Enable20:
;Stepper.c,167 :: 		}
L_end_Single_Axis_Enable:
JR	RA
NOP	
; end of _Single_Axis_Enable
_StopAxis:
;Stepper.c,169 :: 		void StopAxis(int axis){
;Stepper.c,170 :: 		switch(axis){
J	L_StopAxis26
NOP	
;Stepper.c,171 :: 		case X:
L_StopAxis28:
;Stepper.c,172 :: 		EN_StepX = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepX+0)
_SX	
;Stepper.c,173 :: 		break;
J	L_StopAxis27
NOP	
;Stepper.c,174 :: 		case Y:
L_StopAxis29:
;Stepper.c,175 :: 		EN_StepY = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepY+0)
_SX	
;Stepper.c,176 :: 		break;
J	L_StopAxis27
NOP	
;Stepper.c,177 :: 		case Z:
L_StopAxis30:
;Stepper.c,178 :: 		EN_StepZ = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepZ+0)
_SX	
;Stepper.c,179 :: 		break;
J	L_StopAxis27
NOP	
;Stepper.c,180 :: 		case A:
L_StopAxis31:
;Stepper.c,181 :: 		EN_StepA = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepA+0)
_SX	
;Stepper.c,182 :: 		break;
J	L_StopAxis27
NOP	
;Stepper.c,183 :: 		default : break;
L_StopAxis32:
J	L_StopAxis27
NOP	
;Stepper.c,184 :: 		}
L_StopAxis26:
SEH	R2, R25
BNE	R2, R0, L__StopAxis77
NOP	
J	L_StopAxis28
NOP	
L__StopAxis77:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__StopAxis79
NOP	
J	L_StopAxis29
NOP	
L__StopAxis79:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__StopAxis81
NOP	
J	L_StopAxis30
NOP	
L__StopAxis81:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__StopAxis83
NOP	
J	L_StopAxis31
NOP	
L__StopAxis83:
J	L_StopAxis32
NOP	
L_StopAxis27:
;Stepper.c,185 :: 		STPS[axis].stopAxis = 1;
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
;Stepper.c,186 :: 		}
L_end_StopAxis:
JR	RA
NOP	
; end of _StopAxis
_disableSpindleOCx:
;Stepper.c,189 :: 		void disableSpindleOCx(){
;Stepper.c,190 :: 		OC7IE_bit = 0;OC7CONbits.ON = 0; //Spindle
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+4)(GP)
;Stepper.c,191 :: 		}
L_end_disableSpindleOCx:
JR	RA
NOP	
; end of _disableSpindleOCx
