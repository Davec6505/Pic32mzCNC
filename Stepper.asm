_SetPinMode:
;Stepper.c,16 :: 		void SetPinMode(){
;Stepper.c,19 :: 		EN_Step_PinDirX  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirX+0), 1
_SX	
;Stepper.c,20 :: 		DIR_Step_PinDirX = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirX+0), 1
_SX	
;Stepper.c,27 :: 		EN_Step_PinDirY  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirY+0), 1
_SX	
;Stepper.c,28 :: 		DIR_Step_PinDirY = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirY+0), 1
_SX	
;Stepper.c,35 :: 		EN_Step_PinDirZ  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirZ+0), 1
_SX	
;Stepper.c,36 :: 		DIR_Step_PinDirZ = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirZ+0), 1
_SX	
;Stepper.c,43 :: 		EN_Step_PinDirA  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirA+0), 1
_SX	
;Stepper.c,44 :: 		DIR_Step_PinDirA = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirA+0), 1
_SX	
;Stepper.c,50 :: 		}
L_end_SetPinMode:
JR	RA
NOP	
; end of _SetPinMode
_EnStepperX:
;Stepper.c,54 :: 		void EnStepperX(){
;Stepper.c,57 :: 		EN_StepX       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
;Stepper.c,58 :: 		}
L_end_EnStepperX:
JR	RA
NOP	
; end of _EnStepperX
_EnStepperY:
;Stepper.c,60 :: 		void EnStepperY(){
;Stepper.c,63 :: 		EN_StepY       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
;Stepper.c,64 :: 		}
L_end_EnStepperY:
JR	RA
NOP	
; end of _EnStepperY
_EnStepperZ:
;Stepper.c,65 :: 		void EnStepperZ(){
;Stepper.c,68 :: 		EN_StepZ       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
;Stepper.c,69 :: 		}
L_end_EnStepperZ:
JR	RA
NOP	
; end of _EnStepperZ
_EnStepperA:
;Stepper.c,70 :: 		void EnStepperA(){
;Stepper.c,73 :: 		EN_StepA       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepA+0), 1
_SX	
;Stepper.c,74 :: 		}
L_end_EnStepperA:
JR	RA
NOP	
; end of _EnStepperA
_EnableSteppers:
;Stepper.c,76 :: 		void EnableSteppers(int steppers){
;Stepper.c,78 :: 		for(i=0;i<steppers;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_EnableSteppers0:
; i start address is: 16 (R4)
SEH	R3, R4
SEH	R2, R25
SLT	R2, R3, R2
BNE	R2, R0, L__EnableSteppers111
NOP	
J	L_EnableSteppers1
NOP	
L__EnableSteppers111:
;Stepper.c,79 :: 		if(i==0) EN_StepX       = 0;
SEH	R2, R4
BEQ	R2, R0, L__EnableSteppers112
NOP	
J	L_EnableSteppers3
NOP	
L__EnableSteppers112:
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
L_EnableSteppers3:
;Stepper.c,80 :: 		if(i==1) EN_StepY       = 0;
SEH	R3, R4
ORI	R2, R0, 1
BEQ	R3, R2, L__EnableSteppers113
NOP	
J	L_EnableSteppers4
NOP	
L__EnableSteppers113:
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
L_EnableSteppers4:
;Stepper.c,81 :: 		if(i==2) EN_StepZ       = 0;
SEH	R3, R4
ORI	R2, R0, 2
BEQ	R3, R2, L__EnableSteppers114
NOP	
J	L_EnableSteppers5
NOP	
L__EnableSteppers114:
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
L_EnableSteppers5:
;Stepper.c,82 :: 		if(i==3) EN_StepA       = 0;
SEH	R3, R4
ORI	R2, R0, 3
BEQ	R3, R2, L__EnableSteppers115
NOP	
J	L_EnableSteppers6
NOP	
L__EnableSteppers115:
_LX	
INS	R2, R0, BitPos(EN_StepA+0), 1
_SX	
L_EnableSteppers6:
;Stepper.c,78 :: 		for(i=0;i<steppers;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,83 :: 		}
; i end address is: 16 (R4)
J	L_EnableSteppers0
NOP	
L_EnableSteppers1:
;Stepper.c,84 :: 		}
L_end_EnableSteppers:
JR	RA
NOP	
; end of _EnableSteppers
_EnableStepper:
;Stepper.c,86 :: 		void EnableStepper(int stepper){
;Stepper.c,87 :: 		switch(stepper){
J	L_EnableStepper7
NOP	
;Stepper.c,88 :: 		case X:EN_StepX = 0; break;
L_EnableStepper9:
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
J	L_EnableStepper8
NOP	
;Stepper.c,89 :: 		case Y:EN_StepY = 0; break;
L_EnableStepper10:
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
J	L_EnableStepper8
NOP	
;Stepper.c,90 :: 		case Z:EN_StepZ = 0; break;
L_EnableStepper11:
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
J	L_EnableStepper8
NOP	
;Stepper.c,91 :: 		case A:EN_StepA = 0; break;
L_EnableStepper12:
_LX	
INS	R2, R0, BitPos(EN_StepA+0), 1
_SX	
J	L_EnableStepper8
NOP	
;Stepper.c,94 :: 		}
L_EnableStepper7:
SEH	R2, R25
BNE	R2, R0, L__EnableStepper118
NOP	
J	L_EnableStepper9
NOP	
L__EnableStepper118:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__EnableStepper120
NOP	
J	L_EnableStepper10
NOP	
L__EnableStepper120:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__EnableStepper122
NOP	
J	L_EnableStepper11
NOP	
L__EnableStepper122:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__EnableStepper124
NOP	
J	L_EnableStepper12
NOP	
L__EnableStepper124:
L_EnableStepper8:
;Stepper.c,95 :: 		}
L_end_EnableStepper:
JR	RA
NOP	
; end of _EnableStepper
_DisableStepper:
;Stepper.c,97 :: 		void DisableStepper(){
;Stepper.c,98 :: 		EN_StepX      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepX+0)
_SX	
;Stepper.c,99 :: 		EN_StepY      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepY+0)
_SX	
;Stepper.c,100 :: 		EN_StepZ      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepZ+0)
_SX	
;Stepper.c,101 :: 		EN_StepA      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepA+0)
_SX	
;Stepper.c,102 :: 		}
L_end_DisableStepper:
JR	RA
NOP	
; end of _DisableStepper
_GET_RunState:
;Stepper.c,107 :: 		int GET_RunState(int axis_No){
;Stepper.c,108 :: 		return STPS[axis_No].run_state;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
;Stepper.c,109 :: 		}
L_end_GET_RunState:
JR	RA
NOP	
; end of _GET_RunState
_Get_AxisStatus:
;Stepper.c,111 :: 		int Get_AxisStatus(int stepper){
;Stepper.c,112 :: 		int state = 0;
; state start address is: 16 (R4)
MOVZ	R4, R0, R0
;Stepper.c,113 :: 		switch(stepper){
J	L_Get_AxisStatus13
NOP	
; state end address is: 16 (R4)
;Stepper.c,114 :: 		case X:state = EN_StepX&1; break;
L_Get_AxisStatus15:
_LX	
EXT	R2, R2, BitPos(EN_StepX+0), 1
ANDI	R2, R2, 1
; state start address is: 8 (R2)
ANDI	R2, R2, 255
; state end address is: 8 (R2)
J	L_Get_AxisStatus14
NOP	
;Stepper.c,115 :: 		case Y:state = EN_StepY&1; break;
L_Get_AxisStatus16:
_LX	
EXT	R2, R2, BitPos(EN_StepY+0), 1
ANDI	R2, R2, 1
; state start address is: 8 (R2)
ANDI	R2, R2, 255
; state end address is: 8 (R2)
J	L_Get_AxisStatus14
NOP	
;Stepper.c,116 :: 		case Z:state = EN_StepZ&1; break;
L_Get_AxisStatus17:
_LX	
EXT	R2, R2, BitPos(EN_StepZ+0), 1
ANDI	R2, R2, 1
; state start address is: 8 (R2)
ANDI	R2, R2, 255
; state end address is: 8 (R2)
J	L_Get_AxisStatus14
NOP	
;Stepper.c,117 :: 		case A:state = EN_StepA&1; break;
L_Get_AxisStatus18:
_LX	
EXT	R2, R2, BitPos(EN_StepA+0), 1
ANDI	R2, R2, 1
; state start address is: 8 (R2)
ANDI	R2, R2, 255
; state end address is: 8 (R2)
J	L_Get_AxisStatus14
NOP	
;Stepper.c,120 :: 		}
L_Get_AxisStatus13:
; state start address is: 16 (R4)
SEH	R2, R25
BNE	R2, R0, L__Get_AxisStatus129
NOP	
J	L_Get_AxisStatus15
NOP	
L__Get_AxisStatus129:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Get_AxisStatus131
NOP	
J	L_Get_AxisStatus16
NOP	
L__Get_AxisStatus131:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Get_AxisStatus133
NOP	
J	L_Get_AxisStatus17
NOP	
L__Get_AxisStatus133:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Get_AxisStatus135
NOP	
J	L_Get_AxisStatus18
NOP	
L__Get_AxisStatus135:
; state end address is: 16 (R4)
SEH	R2, R4
L_Get_AxisStatus14:
;Stepper.c,121 :: 		return state;
; state start address is: 8 (R2)
; state end address is: 8 (R2)
;Stepper.c,122 :: 		}
L_end_Get_AxisStatus:
JR	RA
NOP	
; end of _Get_AxisStatus
_Get_Axis_Enable_States:
;Stepper.c,126 :: 		int Get_Axis_Enable_States(){
;Stepper.c,127 :: 		int temp = 0;
; temp start address is: 16 (R4)
MOVZ	R4, R0, R0
;Stepper.c,128 :: 		temp |= OC3IE_bit << 3;
_LX	
EXT	R2, R2, BitPos(OC3IE_bit+0), 1
ANDI	R2, R2, 255
SLL	R2, R2, 3
OR	R3, R4, R2
; temp end address is: 16 (R4)
;Stepper.c,129 :: 		temp |= OC7IE_bit << 2;
_LX	
EXT	R2, R2, BitPos(OC7IE_bit+0), 1
ANDI	R2, R2, 255
SLL	R2, R2, 2
OR	R3, R3, R2
;Stepper.c,130 :: 		temp |= OC2IE_bit << 1;
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
ANDI	R2, R2, 255
SLL	R2, R2, 1
OR	R3, R3, R2
;Stepper.c,131 :: 		temp |= OC3IE_bit << 0;
_LX	
EXT	R2, R2, BitPos(OC3IE_bit+0), 1
ANDI	R2, R2, 255
OR	R2, R3, R2
;Stepper.c,132 :: 		return temp;
;Stepper.c,133 :: 		}
L_end_Get_Axis_Enable_States:
JR	RA
NOP	
; end of _Get_Axis_Enable_States
_Single_Axis_Enable:
;Stepper.c,138 :: 		void Single_Axis_Enable(_axis_ axis_){
;Stepper.c,139 :: 		switch(axis_){
J	L_Single_Axis_Enable19
NOP	
;Stepper.c,140 :: 		case X:
L_Single_Axis_Enable21:
;Stepper.c,141 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+8)(GP)
;Stepper.c,142 :: 		break;
J	L_Single_Axis_Enable20
NOP	
;Stepper.c,143 :: 		case Y:
L_Single_Axis_Enable22:
;Stepper.c,144 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+8)(GP)
;Stepper.c,145 :: 		break;
J	L_Single_Axis_Enable20
NOP	
;Stepper.c,146 :: 		case Z:
L_Single_Axis_Enable23:
;Stepper.c,147 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+8)(GP)
;Stepper.c,148 :: 		break;
J	L_Single_Axis_Enable20
NOP	
;Stepper.c,149 :: 		case A:
L_Single_Axis_Enable24:
;Stepper.c,150 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+8)(GP)
;Stepper.c,151 :: 		break;
J	L_Single_Axis_Enable20
NOP	
;Stepper.c,152 :: 		case B:
L_Single_Axis_Enable25:
;Stepper.c,153 :: 		OC6IE_bit = 1;OC6CONbits.ON = 1;
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC6CONbits+8)(GP)
;Stepper.c,154 :: 		break;
J	L_Single_Axis_Enable20
NOP	
;Stepper.c,155 :: 		case C:
L_Single_Axis_Enable26:
;Stepper.c,156 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+8)(GP)
;Stepper.c,157 :: 		break;
J	L_Single_Axis_Enable20
NOP	
;Stepper.c,158 :: 		default:
L_Single_Axis_Enable27:
;Stepper.c,159 :: 		break;
J	L_Single_Axis_Enable20
NOP	
;Stepper.c,160 :: 		}
L_Single_Axis_Enable19:
ANDI	R2, R25, 255
BNE	R2, R0, L__Single_Axis_Enable139
NOP	
J	L_Single_Axis_Enable21
NOP	
L__Single_Axis_Enable139:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Single_Axis_Enable141
NOP	
J	L_Single_Axis_Enable22
NOP	
L__Single_Axis_Enable141:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Single_Axis_Enable143
NOP	
J	L_Single_Axis_Enable23
NOP	
L__Single_Axis_Enable143:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Single_Axis_Enable145
NOP	
J	L_Single_Axis_Enable24
NOP	
L__Single_Axis_Enable145:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Single_Axis_Enable147
NOP	
J	L_Single_Axis_Enable25
NOP	
L__Single_Axis_Enable147:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Single_Axis_Enable149
NOP	
J	L_Single_Axis_Enable26
NOP	
L__Single_Axis_Enable149:
J	L_Single_Axis_Enable27
NOP	
L_Single_Axis_Enable20:
;Stepper.c,161 :: 		}
L_end_Single_Axis_Enable:
JR	RA
NOP	
; end of _Single_Axis_Enable
_StopAxis:
;Stepper.c,163 :: 		void StopAxis(int axis){
;Stepper.c,164 :: 		switch(axis){
J	L_StopAxis28
NOP	
;Stepper.c,165 :: 		case X:
L_StopAxis30:
;Stepper.c,166 :: 		OC5IE_bit = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
;Stepper.c,167 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+4)(GP)
;Stepper.c,168 :: 		break;
J	L_StopAxis29
NOP	
;Stepper.c,169 :: 		case Y:
L_StopAxis31:
;Stepper.c,170 :: 		OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
;Stepper.c,171 :: 		OC2CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+4)(GP)
;Stepper.c,172 :: 		break;
J	L_StopAxis29
NOP	
;Stepper.c,173 :: 		case Z:
L_StopAxis32:
;Stepper.c,174 :: 		OC7IE_bit = 0;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
;Stepper.c,175 :: 		OC7CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+4)(GP)
;Stepper.c,176 :: 		break;
J	L_StopAxis29
NOP	
;Stepper.c,177 :: 		case A:
L_StopAxis33:
;Stepper.c,178 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,179 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,180 :: 		break;
J	L_StopAxis29
NOP	
;Stepper.c,181 :: 		default : break;
L_StopAxis34:
J	L_StopAxis29
NOP	
;Stepper.c,182 :: 		}
L_StopAxis28:
SEH	R2, R25
BNE	R2, R0, L__StopAxis152
NOP	
J	L_StopAxis30
NOP	
L__StopAxis152:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__StopAxis154
NOP	
J	L_StopAxis31
NOP	
L__StopAxis154:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__StopAxis156
NOP	
J	L_StopAxis32
NOP	
L__StopAxis156:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__StopAxis158
NOP	
J	L_StopAxis33
NOP	
L__StopAxis158:
J	L_StopAxis34
NOP	
L_StopAxis29:
;Stepper.c,183 :: 		STPS[axis].stopAxis = 1;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
ORI	R2, R2, 8
SB	R2, 0(R3)
;Stepper.c,184 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+4)(GP)
;Stepper.c,185 :: 		}
L_end_StopAxis:
JR	RA
NOP	
; end of _StopAxis
_disableOCx:
;Stepper.c,188 :: 		void disableOCx(){
;Stepper.c,189 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0; //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,190 :: 		OC2IE_bit = 0;OC2CONbits.ON = 0; //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+4)(GP)
;Stepper.c,191 :: 		OC7IE_bit = 0;OC7CONbits.ON = 0; //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+4)(GP)
;Stepper.c,193 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0; //A
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,194 :: 		OC6IE_bit = 0;OC6CONbits.ON = 0; //B
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
SW	R3, Offset(OC6CONbits+4)(GP)
;Stepper.c,195 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0; //Z
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,196 :: 		}
L_end_disableOCx:
JR	RA
NOP	
; end of _disableOCx
_toggleOCx:
;Stepper.c,200 :: 		void toggleOCx(int axis_No){
;Stepper.c,201 :: 		switch(axis_No){
J	L_toggleOCx35
NOP	
;Stepper.c,202 :: 		case X:
L_toggleOCx37:
;Stepper.c,203 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,204 :: 		OC5R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,205 :: 		OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
;Stepper.c,206 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,207 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,208 :: 		break;
J	L_toggleOCx36
NOP	
;Stepper.c,209 :: 		case Y:
L_toggleOCx38:
;Stepper.c,210 :: 		OC2IF_bit = 0;
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Stepper.c,211 :: 		OC2R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC2R+0)(GP)
;Stepper.c,212 :: 		OC2RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+108)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC2RS+0)(GP)
;Stepper.c,213 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,214 :: 		OC2CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC2CON+0)(GP)
;Stepper.c,215 :: 		break;
J	L_toggleOCx36
NOP	
;Stepper.c,216 :: 		case Z:
L_toggleOCx39:
;Stepper.c,217 :: 		OC7R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC7R+0)(GP)
;Stepper.c,218 :: 		OC7RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+208)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC7RS+0)(GP)
;Stepper.c,219 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,220 :: 		OC7CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC7CON+0)(GP)
;Stepper.c,221 :: 		break;
J	L_toggleOCx36
NOP	
;Stepper.c,222 :: 		case A:
L_toggleOCx40:
;Stepper.c,223 :: 		OC3R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,224 :: 		OC3RS  = STPS[A].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+308)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,225 :: 		TMR5   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR5+0)(GP)
;Stepper.c,226 :: 		OC3CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,227 :: 		break;
J	L_toggleOCx36
NOP	
;Stepper.c,228 :: 		case B:
L_toggleOCx41:
;Stepper.c,229 :: 		OC6R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC6R+0)(GP)
;Stepper.c,230 :: 		OC6RS  = STPS[B].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+408)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC6RS+0)(GP)
;Stepper.c,231 :: 		TMR3   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR3+0)(GP)
;Stepper.c,232 :: 		OC6CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC6CON+0)(GP)
;Stepper.c,233 :: 		break;
J	L_toggleOCx36
NOP	
;Stepper.c,234 :: 		case C:
L_toggleOCx42:
;Stepper.c,235 :: 		OC8R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,236 :: 		OC8RS  = STPS[C].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+508)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,237 :: 		TMR7   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR7+0)(GP)
;Stepper.c,238 :: 		OC8CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC8CON+0)(GP)
;Stepper.c,239 :: 		break;
J	L_toggleOCx36
NOP	
;Stepper.c,240 :: 		default:
L_toggleOCx43:
;Stepper.c,241 :: 		break;
J	L_toggleOCx36
NOP	
;Stepper.c,242 :: 		}
L_toggleOCx35:
SEH	R2, R25
BNE	R2, R0, L__toggleOCx162
NOP	
J	L_toggleOCx37
NOP	
L__toggleOCx162:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx164
NOP	
J	L_toggleOCx38
NOP	
L__toggleOCx164:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__toggleOCx166
NOP	
J	L_toggleOCx39
NOP	
L__toggleOCx166:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__toggleOCx168
NOP	
J	L_toggleOCx40
NOP	
L__toggleOCx168:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__toggleOCx170
NOP	
J	L_toggleOCx41
NOP	
L__toggleOCx170:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__toggleOCx172
NOP	
J	L_toggleOCx42
NOP	
L__toggleOCx172:
J	L_toggleOCx43
NOP	
L_toggleOCx36:
;Stepper.c,244 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of _toggleOCx
_Step_Cycle:
;Stepper.c,251 :: 		void Step_Cycle(int axis_No){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,253 :: 		STPS[axis_No].step_count++;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 40
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,255 :: 		STPS[axis_No].steps_abs_position += STPS[axis_No].axis_dir;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 80
ADDIU	R2, R2, 96
LH	R2, 0(R2)
LW	R3, 0(R4)
SEH	R2, R2
ADDU	R2, R3, R2
SW	R2, 0(R4)
;Stepper.c,256 :: 		toggleOCx(axis_No);
JAL	_toggleOCx+0
NOP	
;Stepper.c,258 :: 		}
L_end_Step_Cycle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Step_Cycle
_Pulse:
;Stepper.c,261 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,267 :: 		switch(STPS[axis_No].run_state) {
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
SW	R2, 4(SP)
J	L_Pulse44
NOP	
;Stepper.c,268 :: 		case STOP:
L_Pulse46:
;Stepper.c,269 :: 		STPS[axis_No].run_state  = STOP;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
SH	R0, 0(R2)
;Stepper.c,271 :: 		break;
J	L_Pulse45
NOP	
;Stepper.c,273 :: 		case ACCEL:
L_Pulse47:
;Stepper.c,275 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,276 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 8
LW	R3, 0(R2)
ADDIU	R2, R4, 20
LW	R2, 0(R2)
SLT	R2, R2, R3
BEQ	R2, R0, L__Pulse175
NOP	
J	L_Pulse48
NOP	
L__Pulse175:
;Stepper.c,277 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,279 :: 		}
L_Pulse48:
;Stepper.c,280 :: 		if(STPS[axis_No].step_count > STPS[axis_No].max_step_lim){
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 40
LW	R3, 0(R2)
ADDIU	R2, R4, 64
LW	R2, 0(R2)
SLT	R2, R2, R3
BNE	R2, R0, L__Pulse176
NOP	
J	L_Pulse49
NOP	
L__Pulse176:
;Stepper.c,281 :: 		STPS[axis_No].run_state  = RUN;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 6
ORI	R2, R0, 3
SH	R2, 0(R3)
;Stepper.c,282 :: 		}
L_Pulse49:
;Stepper.c,285 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 40
LW	R3, 0(R2)
ADDIU	R2, R4, 12
LW	R2, 0(R2)
SLT	R2, R3, R2
BEQ	R2, R0, L__Pulse177
NOP	
J	L_Pulse50
NOP	
L__Pulse177:
;Stepper.c,286 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,287 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
SW	R0, 0(R2)
;Stepper.c,288 :: 		STPS[axis_No].run_state   = DECEL;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 6
ORI	R2, R0, 2
SH	R2, 0(R3)
;Stepper.c,289 :: 		}
L_Pulse50:
;Stepper.c,290 :: 		break;
J	L_Pulse45
NOP	
;Stepper.c,292 :: 		case RUN:
L_Pulse51:
;Stepper.c,293 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,297 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 40
LW	R3, 0(R2)
ADDIU	R2, R4, 12
LW	R2, 0(R2)
SLT	R2, R3, R2
BEQ	R2, R0, L__Pulse178
NOP	
J	L_Pulse52
NOP	
L__Pulse178:
;Stepper.c,298 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,299 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 68
SW	R0, 0(R2)
;Stepper.c,300 :: 		STPS[axis_No].run_state   =  DECEL;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 6
ORI	R2, R0, 2
SH	R2, 0(R3)
;Stepper.c,301 :: 		}
L_Pulse52:
;Stepper.c,302 :: 		break;
J	L_Pulse45
NOP	
;Stepper.c,304 :: 		case DECEL:
L_Pulse53:
;Stepper.c,306 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,309 :: 		if(STPS[axis_No].accel_count > -1 ){
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
LW	R2, 0(R2)
SLTI	R2, R2, 0
BEQ	R2, R0, L__Pulse179
NOP	
J	L_Pulse54
NOP	
L__Pulse179:
;Stepper.c,310 :: 		STPS[axis_No].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
SH	R0, 0(R2)
;Stepper.c,311 :: 		}
L_Pulse54:
;Stepper.c,312 :: 		break;
J	L_Pulse45
NOP	
;Stepper.c,313 :: 		default:break;
L_Pulse55:
J	L_Pulse45
NOP	
;Stepper.c,314 :: 		}
L_Pulse44:
LW	R4, 4(SP)
LHU	R2, 0(R4)
ANDI	R2, R2, 65535
BNE	R2, R0, L__Pulse181
NOP	
J	L_Pulse46
NOP	
L__Pulse181:
LHU	R2, 0(R4)
ANDI	R3, R2, 65535
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse183
NOP	
J	L_Pulse47
NOP	
L__Pulse183:
LHU	R2, 0(R4)
ANDI	R3, R2, 65535
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse185
NOP	
J	L_Pulse51
NOP	
L__Pulse185:
LHU	R2, 0(R4)
ANDI	R3, R2, 65535
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse187
NOP	
J	L_Pulse53
NOP	
L__Pulse187:
J	L_Pulse55
NOP	
L_Pulse45:
;Stepper.c,315 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,316 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Pulse
_AccDec:
;Stepper.c,320 :: 		void AccDec(int axis_No){
;Stepper.c,321 :: 		STPS[axis_No].accel_count++;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,322 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R6, R2, R3
ADDIU	R5, R6, 52
ADDIU	R2, R6, 8
LW	R4, 0(R2)
SLL	R3, R4, 1
ADDIU	R2, R6, 68
LW	R2, 0(R2)
ADDU	R3, R3, R2
ADDIU	R2, R6, 24
LW	R2, 0(R2)
SLL	R2, R2, 2
ADDIU	R2, R2, 1
DIV	R3, R2
MFLO	R2
SUBU	R2, R4, R2
SW	R2, 0(R5)
;Stepper.c,323 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R5, R2, R3
ADDIU	R4, R5, 68
ADDIU	R2, R5, 8
LW	R2, 0(R2)
SLL	R3, R2, 1
LW	R2, 0(R4)
ADDU	R3, R3, R2
ADDIU	R2, R5, 24
LW	R2, 0(R2)
SLL	R2, R2, 2
ADDIU	R2, R2, 1
DIV	R3, R2
MFHI	R2
SW	R2, 0(R4)
;Stepper.c,324 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 52
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,325 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of _AccDec
_StepX:
;Stepper.c,333 :: 		void StepX() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 3072
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,334 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,336 :: 		if(SV.Single_Dual == 0){
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepX190
NOP	
J	L_StepX56
NOP	
L__StepX190:
;Stepper.c,337 :: 		SingleStepAxis(X);
MOVZ	R25, R0, R0
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,338 :: 		}else{
J	L_StepX57
NOP	
L_StepX56:
;Stepper.c,339 :: 		if(STPS[X].master = 1){
LBU	R2, Offset(_STPS+4)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+4)(GP)
LBU	R2, Offset(_STPS+4)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepX192
NOP	
J	L_StepX58
NOP	
L__StepX192:
;Stepper.c,340 :: 		if(axis_xyz == xy)
LBU	R2, Offset(_axis_xyz+0)(GP)
BEQ	R2, R0, L__StepX193
NOP	
J	L_StepX59
NOP	
L__StepX193:
;Stepper.c,341 :: 		Axis_Interpolate(X,Y);
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepX60
NOP	
L_StepX59:
;Stepper.c,342 :: 		else if(axis_xyz == xz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__StepX194
NOP	
J	L_StepX61
NOP	
L__StepX194:
;Stepper.c,343 :: 		Axis_Interpolate(X,Z);
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepX62
NOP	
L_StepX61:
;Stepper.c,344 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepX195
NOP	
J	L_StepX63
NOP	
L__StepX195:
;Stepper.c,345 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
L_StepX63:
L_StepX62:
L_StepX60:
;Stepper.c,346 :: 		}
L_StepX58:
;Stepper.c,347 :: 		}
L_StepX57:
;Stepper.c,348 :: 		}
L_end_StepX:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _StepX
_StepY:
;Stepper.c,352 :: 		void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 3072
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,353 :: 		OC2IF_bit = 0;
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Stepper.c,355 :: 		if(SV.Single_Dual == 0){
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepY197
NOP	
J	L_StepY64
NOP	
L__StepY197:
;Stepper.c,356 :: 		SingleStepAxis(Y);
ORI	R25, R0, 1
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,357 :: 		}else {
J	L_StepY65
NOP	
L_StepY64:
;Stepper.c,358 :: 		if(STPS[Y].master = 1){
LBU	R2, Offset(_STPS+104)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+104)(GP)
LBU	R2, Offset(_STPS+104)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepY199
NOP	
J	L_StepY66
NOP	
L__StepY199:
;Stepper.c,359 :: 		if(axis_xyz == xy )
LBU	R2, Offset(_axis_xyz+0)(GP)
BEQ	R2, R0, L__StepY200
NOP	
J	L_StepY67
NOP	
L__StepY200:
;Stepper.c,360 :: 		Axis_Interpolate(X,Y);
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepY68
NOP	
L_StepY67:
;Stepper.c,361 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepY201
NOP	
J	L_StepY69
NOP	
L__StepY201:
;Stepper.c,362 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
J	L_StepY70
NOP	
L_StepY69:
;Stepper.c,363 :: 		else if(axis_xyz == ya)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__StepY202
NOP	
J	L_StepY71
NOP	
L__StepY202:
;Stepper.c,364 :: 		Axis_Interpolate(Y,A);
ORI	R26, R0, 3
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
L_StepY71:
L_StepY70:
L_StepY68:
;Stepper.c,365 :: 		}
L_StepY66:
;Stepper.c,366 :: 		}
L_StepY65:
;Stepper.c,367 :: 		}
L_end_StepY:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _StepY
_StepZ:
;Stepper.c,370 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 3072
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,371 :: 		OC7IF_bit = 0;
LUI	R2, BitMask(OC7IF_bit+0)
ORI	R2, R2, BitMask(OC7IF_bit+0)
_SX	
;Stepper.c,373 :: 		if(SV.Single_Dual == 0){
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepZ204
NOP	
J	L_StepZ72
NOP	
L__StepZ204:
;Stepper.c,374 :: 		SingleStepAxis(Z);
ORI	R25, R0, 2
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,375 :: 		}else{
J	L_StepZ73
NOP	
L_StepZ72:
;Stepper.c,376 :: 		if(STPS[Z].master = 1){
LBU	R2, Offset(_STPS+204)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+204)(GP)
LBU	R2, Offset(_STPS+204)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepZ206
NOP	
J	L_StepZ74
NOP	
L__StepZ206:
;Stepper.c,377 :: 		if(axis_xyz == xz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__StepZ207
NOP	
J	L_StepZ75
NOP	
L__StepZ207:
;Stepper.c,378 :: 		Axis_Interpolate(X,Z);
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepZ76
NOP	
L_StepZ75:
;Stepper.c,379 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepZ208
NOP	
J	L_StepZ77
NOP	
L__StepZ208:
;Stepper.c,380 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
J	L_StepZ78
NOP	
L_StepZ77:
;Stepper.c,381 :: 		else if(axis_xyz == za)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__StepZ209
NOP	
J	L_StepZ79
NOP	
L__StepZ209:
;Stepper.c,382 :: 		Axis_Interpolate(Z,A);
ORI	R26, R0, 3
ORI	R25, R0, 2
JAL	_Axis_Interpolate+0
NOP	
L_StepZ79:
L_StepZ78:
L_StepZ76:
;Stepper.c,384 :: 		}
L_StepZ74:
;Stepper.c,385 :: 		}
L_StepZ73:
;Stepper.c,387 :: 		}
L_end_StepZ:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _StepZ
_StepA:
;Stepper.c,390 :: 		void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 3072
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,391 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,393 :: 		if(SV.Single_Dual == 0){
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepA211
NOP	
J	L_StepA80
NOP	
L__StepA211:
;Stepper.c,394 :: 		SingleStepAxis(A);
ORI	R25, R0, 3
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,395 :: 		}else{
J	L_StepA81
NOP	
L_StepA80:
;Stepper.c,396 :: 		if(STPS[A].master = 1){
LBU	R2, Offset(_STPS+304)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+304)(GP)
LBU	R2, Offset(_STPS+304)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepA213
NOP	
J	L_StepA82
NOP	
L__StepA213:
;Stepper.c,397 :: 		if(axis_xyz == xa)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__StepA214
NOP	
J	L_StepA83
NOP	
L__StepA214:
;Stepper.c,398 :: 		Axis_Interpolate(X,A);
ORI	R26, R0, 3
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepA84
NOP	
L_StepA83:
;Stepper.c,399 :: 		else if(axis_xyz == ya)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__StepA215
NOP	
J	L_StepA85
NOP	
L__StepA215:
;Stepper.c,400 :: 		Axis_Interpolate(Y,A);
ORI	R26, R0, 3
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
J	L_StepA86
NOP	
L_StepA85:
;Stepper.c,401 :: 		else if(axis_xyz == za)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__StepA216
NOP	
J	L_StepA87
NOP	
L__StepA216:
;Stepper.c,402 :: 		Axis_Interpolate(Z,A);
ORI	R26, R0, 3
ORI	R25, R0, 2
JAL	_Axis_Interpolate+0
NOP	
L_StepA87:
L_StepA86:
L_StepA84:
;Stepper.c,403 :: 		}
L_StepA82:
;Stepper.c,404 :: 		}
L_StepA81:
;Stepper.c,405 :: 		}
L_end_StepA:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _StepA
_SingleStepAxis:
;Stepper.c,412 :: 		void SingleStepAxis(int axis){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,413 :: 		if(STPS[axis].step_count >= STPS[axis].dist){
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 40
LW	R3, 0(R2)
ADDIU	R2, R4, 44
LW	R2, 0(R2)
SLT	R2, R3, R2
BEQ	R2, R0, L__SingleStepAxis218
NOP	
J	L_SingleStepAxis88
NOP	
L__SingleStepAxis218:
;Stepper.c,414 :: 		StopAxis(axis);
JAL	_StopAxis+0
NOP	
;Stepper.c,415 :: 		return;
J	L_end_SingleStepAxis
NOP	
;Stepper.c,416 :: 		}
L_SingleStepAxis88:
;Stepper.c,418 :: 		Step_Cycle(axis);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,419 :: 		Pulse(axis);
JAL	_Pulse+0
NOP	
;Stepper.c,421 :: 		}
L_end_SingleStepAxis:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _SingleStepAxis
_Axis_Interpolate:
;Stepper.c,428 :: 		void Axis_Interpolate(int axisA,int axisB){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Stepper.c,430 :: 		cnt++;
SW	R25, 4(SP)
LH	R2, Offset(Axis_Interpolate_cnt_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Axis_Interpolate_cnt_L0+0)(GP)
;Stepper.c,431 :: 		if(cnt > 5){
SEH	R2, R2
SLTI	R2, R2, 6
BEQ	R2, R0, L__Axis_Interpolate220
NOP	
J	L_Axis_Interpolate90
NOP	
L__Axis_Interpolate220:
;Stepper.c,432 :: 		LED2=!LED2;
_LX	
EXT	R2, R2, BitPos(LED2+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Stepper.c,433 :: 		cnt = 0;
SH	R0, Offset(Axis_Interpolate_cnt_L0+0)(GP)
;Stepper.c,434 :: 		}
L_Axis_Interpolate90:
;Stepper.c,435 :: 		if((STPS[axisA].step_count > SV.dA)||(STPS[axisB].step_count > SV.dB)){
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
LW	R3, 0(R2)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__Axis_Interpolate221
NOP	
J	L__Axis_Interpolate104
NOP	
L__Axis_Interpolate221:
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 40
LW	R3, 0(R2)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__Axis_Interpolate222
NOP	
J	L__Axis_Interpolate103
NOP	
L__Axis_Interpolate222:
J	L_Axis_Interpolate93
NOP	
L__Axis_Interpolate104:
L__Axis_Interpolate103:
;Stepper.c,436 :: 		StopAxis(axisA);
JAL	_StopAxis+0
NOP	
;Stepper.c,437 :: 		StopAxis(axisB);
SEH	R25, R26
JAL	_StopAxis+0
NOP	
;Stepper.c,438 :: 		return;
J	L_end_Axis_Interpolate
NOP	
;Stepper.c,439 :: 		}
L_Axis_Interpolate93:
;Stepper.c,441 :: 		if(SV.dA >= SV.dB){
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__Axis_Interpolate223
NOP	
J	L_Axis_Interpolate94
NOP	
L__Axis_Interpolate223:
;Stepper.c,442 :: 		Step_Cycle(axisA);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,443 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__Axis_Interpolate224
NOP	
J	L_Axis_Interpolate95
NOP	
L__Axis_Interpolate224:
;Stepper.c,444 :: 		Pulse(axisA);
JAL	_Pulse+0
NOP	
L_Axis_Interpolate95:
;Stepper.c,445 :: 		if(SV.dif < 0){
LW	R2, Offset(_SV+8)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Axis_Interpolate225
NOP	
J	L_Axis_Interpolate96
NOP	
L__Axis_Interpolate225:
;Stepper.c,446 :: 		SV.dif += BresIncVal(SV.dB);//2*SV.dy;//
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+8)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+8)(GP)
;Stepper.c,447 :: 		}else{
J	L_Axis_Interpolate97
NOP	
L_Axis_Interpolate96:
;Stepper.c,448 :: 		SV.dif += BresDiffVal(SV.dB,SV.dA);//2 * (SV.dy - SV.dx);//
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+8)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+8)(GP)
;Stepper.c,449 :: 		Step_Cycle(axisB);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Stepper.c,450 :: 		}
L_Axis_Interpolate97:
;Stepper.c,451 :: 		}else{
J	L_Axis_Interpolate98
NOP	
L_Axis_Interpolate94:
;Stepper.c,452 :: 		Step_Cycle(axisB);
SH	R25, 8(SP)
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
LH	R25, 8(SP)
;Stepper.c,453 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__Axis_Interpolate226
NOP	
J	L_Axis_Interpolate99
NOP	
L__Axis_Interpolate226:
;Stepper.c,454 :: 		Pulse(axisB);
SH	R25, 8(SP)
SEH	R25, R26
JAL	_Pulse+0
NOP	
LH	R25, 8(SP)
L_Axis_Interpolate99:
;Stepper.c,455 :: 		if(SV.dif < 0){
LW	R2, Offset(_SV+8)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Axis_Interpolate227
NOP	
J	L_Axis_Interpolate100
NOP	
L__Axis_Interpolate227:
;Stepper.c,456 :: 		SV.dif += BresIncVal(SV.dA);//2 * SV.dx;//
LW	R2, Offset(_SV+12)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+8)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+8)(GP)
;Stepper.c,457 :: 		}else{
J	L_Axis_Interpolate101
NOP	
L_Axis_Interpolate100:
;Stepper.c,458 :: 		SV.dif += BresDiffVal(SV.dA,SV.dB);//2 * (SV.dx - SV.dy);//
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+8)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+8)(GP)
;Stepper.c,459 :: 		Step_Cycle(axisA);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,460 :: 		}
L_Axis_Interpolate101:
;Stepper.c,461 :: 		}
L_Axis_Interpolate98:
;Stepper.c,462 :: 		}
L_end_Axis_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Axis_Interpolate
