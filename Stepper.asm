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
ADDIU	R2, R2, 4
LH	R2, 0(R2)
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
;Stepper.c,140 :: 		axis_running =0;
SH	R0, Offset(Stepper_axis_running+0)(GP)
;Stepper.c,142 :: 		switch(axis_){
J	L_Single_Axis_Enable19
NOP	
;Stepper.c,143 :: 		case X:
L_Single_Axis_Enable21:
;Stepper.c,144 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+8)(GP)
;Stepper.c,145 :: 		break;
J	L_Single_Axis_Enable20
NOP	
;Stepper.c,146 :: 		case Y:
L_Single_Axis_Enable22:
;Stepper.c,147 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+8)(GP)
;Stepper.c,148 :: 		break;
J	L_Single_Axis_Enable20
NOP	
;Stepper.c,149 :: 		case Z:
L_Single_Axis_Enable23:
;Stepper.c,150 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+8)(GP)
;Stepper.c,151 :: 		break;
J	L_Single_Axis_Enable20
NOP	
;Stepper.c,152 :: 		case A:
L_Single_Axis_Enable24:
;Stepper.c,153 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+8)(GP)
;Stepper.c,154 :: 		break;
J	L_Single_Axis_Enable20
NOP	
;Stepper.c,155 :: 		case B:
L_Single_Axis_Enable25:
;Stepper.c,156 :: 		OC6IE_bit = 1;OC6CONbits.ON = 1;
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC6CONbits+8)(GP)
;Stepper.c,157 :: 		break;
J	L_Single_Axis_Enable20
NOP	
;Stepper.c,158 :: 		case C:
L_Single_Axis_Enable26:
;Stepper.c,159 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+8)(GP)
;Stepper.c,160 :: 		break;
J	L_Single_Axis_Enable20
NOP	
;Stepper.c,161 :: 		default:
L_Single_Axis_Enable27:
;Stepper.c,162 :: 		break;
J	L_Single_Axis_Enable20
NOP	
;Stepper.c,163 :: 		}
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
;Stepper.c,164 :: 		}
L_end_Single_Axis_Enable:
JR	RA
NOP	
; end of _Single_Axis_Enable
_StopAxis:
;Stepper.c,166 :: 		void StopAxis(int axis){
;Stepper.c,167 :: 		switch(axis){
J	L_StopAxis28
NOP	
;Stepper.c,168 :: 		case X:
L_StopAxis30:
;Stepper.c,169 :: 		OC5IE_bit = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
;Stepper.c,170 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+4)(GP)
;Stepper.c,171 :: 		break;
J	L_StopAxis29
NOP	
;Stepper.c,172 :: 		case Y:
L_StopAxis31:
;Stepper.c,173 :: 		OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
;Stepper.c,174 :: 		OC2CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+4)(GP)
;Stepper.c,175 :: 		break;
J	L_StopAxis29
NOP	
;Stepper.c,176 :: 		case Z:
L_StopAxis32:
;Stepper.c,177 :: 		OC7IE_bit = 0;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
;Stepper.c,178 :: 		OC7CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+4)(GP)
;Stepper.c,179 :: 		break;
J	L_StopAxis29
NOP	
;Stepper.c,180 :: 		case A:
L_StopAxis33:
;Stepper.c,181 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,182 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,183 :: 		break;
J	L_StopAxis29
NOP	
;Stepper.c,184 :: 		default : break;
L_StopAxis34:
J	L_StopAxis29
NOP	
;Stepper.c,185 :: 		}
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
;Stepper.c,186 :: 		STPS[axis].stopAxis = 1;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 16
SB	R2, 0(R3)
;Stepper.c,187 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+4)(GP)
;Stepper.c,188 :: 		}
L_end_StopAxis:
JR	RA
NOP	
; end of _StopAxis
_disableOCx:
;Stepper.c,191 :: 		void disableOCx(){
;Stepper.c,192 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0; //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,193 :: 		OC2IE_bit = 0;OC2CONbits.ON = 0; //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+4)(GP)
;Stepper.c,194 :: 		OC7IE_bit = 0;OC7CONbits.ON = 0; //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+4)(GP)
;Stepper.c,196 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0; //A
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,197 :: 		OC6IE_bit = 0;OC6CONbits.ON = 0; //B
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
SW	R3, Offset(OC6CONbits+4)(GP)
;Stepper.c,198 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0; //Z
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,199 :: 		}
L_end_disableOCx:
JR	RA
NOP	
; end of _disableOCx
_toggleOCx:
;Stepper.c,203 :: 		void toggleOCx(int axis_No){
;Stepper.c,204 :: 		switch(axis_No){
J	L_toggleOCx35
NOP	
;Stepper.c,205 :: 		case X:
L_toggleOCx37:
;Stepper.c,206 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,207 :: 		OC5R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,208 :: 		OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+12)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
;Stepper.c,209 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,210 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,211 :: 		break;
J	L_toggleOCx36
NOP	
;Stepper.c,212 :: 		case Y:
L_toggleOCx38:
;Stepper.c,213 :: 		OC2IF_bit = 0;
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Stepper.c,214 :: 		OC2R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC2R+0)(GP)
;Stepper.c,215 :: 		OC2RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+112)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC2RS+0)(GP)
;Stepper.c,216 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,217 :: 		OC2CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC2CON+0)(GP)
;Stepper.c,218 :: 		break;
J	L_toggleOCx36
NOP	
;Stepper.c,219 :: 		case Z:
L_toggleOCx39:
;Stepper.c,220 :: 		OC7R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC7R+0)(GP)
;Stepper.c,221 :: 		OC7RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+212)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC7RS+0)(GP)
;Stepper.c,222 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,223 :: 		OC7CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC7CON+0)(GP)
;Stepper.c,224 :: 		break;
J	L_toggleOCx36
NOP	
;Stepper.c,225 :: 		case A:
L_toggleOCx40:
;Stepper.c,226 :: 		OC3R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,227 :: 		OC3RS  = STPS[A].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+312)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,228 :: 		TMR5   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR5+0)(GP)
;Stepper.c,229 :: 		OC3CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,230 :: 		break;
J	L_toggleOCx36
NOP	
;Stepper.c,231 :: 		case B:
L_toggleOCx41:
;Stepper.c,232 :: 		OC6R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC6R+0)(GP)
;Stepper.c,233 :: 		OC6RS  = STPS[B].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+412)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC6RS+0)(GP)
;Stepper.c,234 :: 		TMR3   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR3+0)(GP)
;Stepper.c,235 :: 		OC6CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC6CON+0)(GP)
;Stepper.c,236 :: 		break;
J	L_toggleOCx36
NOP	
;Stepper.c,237 :: 		case C:
L_toggleOCx42:
;Stepper.c,238 :: 		OC8R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,239 :: 		OC8RS  = STPS[C].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+512)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,240 :: 		TMR7   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR7+0)(GP)
;Stepper.c,241 :: 		OC8CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC8CON+0)(GP)
;Stepper.c,242 :: 		break;
J	L_toggleOCx36
NOP	
;Stepper.c,243 :: 		default:
L_toggleOCx43:
;Stepper.c,244 :: 		break;
J	L_toggleOCx36
NOP	
;Stepper.c,245 :: 		}
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
;Stepper.c,247 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of _toggleOCx
_Step_Cycle:
;Stepper.c,254 :: 		void Step_Cycle(int axis_No){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,256 :: 		STPS[axis_No].step_count++;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 44
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,258 :: 		STPS[axis_No].steps_abs_position += STPS[axis_No].axis_dir;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 84
ADDIU	R2, R2, 2
LH	R2, 0(R2)
LW	R3, 0(R4)
SEH	R2, R2
ADDU	R2, R3, R2
SW	R2, 0(R4)
;Stepper.c,259 :: 		toggleOCx(axis_No);
JAL	_toggleOCx+0
NOP	
;Stepper.c,261 :: 		}
L_end_Step_Cycle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Step_Cycle
Stepper_Pulse:
;Stepper.c,264 :: 		static int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,270 :: 		switch(STPS[axis_No].run_state) {
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SW	R2, 4(SP)
J	L_Stepper_Pulse44
NOP	
;Stepper.c,271 :: 		case STOP:
L_Stepper_Pulse46:
;Stepper.c,272 :: 		STPS[axis_No].run_state  = STOP;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,274 :: 		break;
J	L_Stepper_Pulse45
NOP	
;Stepper.c,276 :: 		case ACCEL:
L_Stepper_Pulse47:
;Stepper.c,278 :: 		AccDec(axis_No);
JAL	Stepper_AccDec+0
NOP	
;Stepper.c,279 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 12
LW	R3, 0(R2)
ADDIU	R2, R4, 24
LW	R2, 0(R2)
SLT	R2, R2, R3
BEQ	R2, R0, L_Stepper_Pulse175
NOP	
J	L_Stepper_Pulse48
NOP	
L_Stepper_Pulse175:
;Stepper.c,280 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 12
ADDIU	R2, R2, 24
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,282 :: 		}
L_Stepper_Pulse48:
;Stepper.c,283 :: 		if(STPS[axis_No].step_count > STPS[axis_No].max_step_lim){
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 44
LW	R3, 0(R2)
ADDIU	R2, R4, 68
LW	R2, 0(R2)
SLT	R2, R2, R3
BNE	R2, R0, L_Stepper_Pulse176
NOP	
J	L_Stepper_Pulse49
NOP	
L_Stepper_Pulse176:
;Stepper.c,284 :: 		STPS[axis_No].run_state  = RUN;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 3
SH	R2, 0(R3)
;Stepper.c,285 :: 		}
L_Stepper_Pulse49:
;Stepper.c,288 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 44
LW	R3, 0(R2)
ADDIU	R2, R4, 16
LW	R2, 0(R2)
SLT	R2, R3, R2
BEQ	R2, R0, L_Stepper_Pulse177
NOP	
J	L_Stepper_Pulse50
NOP	
L_Stepper_Pulse177:
;Stepper.c,289 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 28
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,290 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 72
SW	R0, 0(R2)
;Stepper.c,291 :: 		STPS[axis_No].run_state   = DECEL;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 2
SH	R2, 0(R3)
;Stepper.c,292 :: 		}
L_Stepper_Pulse50:
;Stepper.c,293 :: 		break;
J	L_Stepper_Pulse45
NOP	
;Stepper.c,295 :: 		case RUN:
L_Stepper_Pulse51:
;Stepper.c,296 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 12
ADDIU	R2, R2, 24
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,300 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 44
LW	R3, 0(R2)
ADDIU	R2, R4, 16
LW	R2, 0(R2)
SLT	R2, R3, R2
BEQ	R2, R0, L_Stepper_Pulse178
NOP	
J	L_Stepper_Pulse52
NOP	
L_Stepper_Pulse178:
;Stepper.c,301 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 28
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,302 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 72
SW	R0, 0(R2)
;Stepper.c,303 :: 		STPS[axis_No].run_state   =  DECEL;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 2
SH	R2, 0(R3)
;Stepper.c,304 :: 		}
L_Stepper_Pulse52:
;Stepper.c,305 :: 		break;
J	L_Stepper_Pulse45
NOP	
;Stepper.c,307 :: 		case DECEL:
L_Stepper_Pulse53:
;Stepper.c,309 :: 		AccDec(axis_No);
JAL	Stepper_AccDec+0
NOP	
;Stepper.c,312 :: 		if(STPS[axis_No].accel_count > -1 ){
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 28
LW	R2, 0(R2)
SLTI	R2, R2, 0
BEQ	R2, R0, L_Stepper_Pulse179
NOP	
J	L_Stepper_Pulse54
NOP	
L_Stepper_Pulse179:
;Stepper.c,313 :: 		STPS[axis_No].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,314 :: 		}
L_Stepper_Pulse54:
;Stepper.c,315 :: 		break;
J	L_Stepper_Pulse45
NOP	
;Stepper.c,316 :: 		default:break;
L_Stepper_Pulse55:
J	L_Stepper_Pulse45
NOP	
;Stepper.c,317 :: 		}
L_Stepper_Pulse44:
LW	R4, 4(SP)
LH	R2, 0(R4)
SEH	R2, R2
BNE	R2, R0, L_Stepper_Pulse181
NOP	
J	L_Stepper_Pulse46
NOP	
L_Stepper_Pulse181:
LH	R2, 0(R4)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L_Stepper_Pulse183
NOP	
J	L_Stepper_Pulse47
NOP	
L_Stepper_Pulse183:
LH	R2, 0(R4)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L_Stepper_Pulse185
NOP	
J	L_Stepper_Pulse51
NOP	
L_Stepper_Pulse185:
LH	R2, 0(R4)
SEH	R3, R2
ORI	R2, R0, 2
BNE	R3, R2, L_Stepper_Pulse187
NOP	
J	L_Stepper_Pulse53
NOP	
L_Stepper_Pulse187:
J	L_Stepper_Pulse55
NOP	
L_Stepper_Pulse45:
;Stepper.c,318 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,319 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Stepper_Pulse
Stepper_AccDec:
;Stepper.c,323 :: 		static void AccDec(int axis_No){
;Stepper.c,324 :: 		STPS[axis_No].accel_count++;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 28
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,325 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R6, R2, R3
ADDIU	R5, R6, 56
ADDIU	R2, R6, 12
LW	R4, 0(R2)
SLL	R3, R4, 1
ADDIU	R2, R6, 72
LW	R2, 0(R2)
ADDU	R3, R3, R2
ADDIU	R2, R6, 28
LW	R2, 0(R2)
SLL	R2, R2, 2
ADDIU	R2, R2, 1
DIV	R3, R2
MFLO	R2
SUBU	R2, R4, R2
SW	R2, 0(R5)
;Stepper.c,326 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R5, R2, R3
ADDIU	R4, R5, 72
ADDIU	R2, R5, 12
LW	R2, 0(R2)
SLL	R3, R2, 1
LW	R2, 0(R4)
ADDU	R3, R3, R2
ADDIU	R2, R5, 28
LW	R2, 0(R2)
SLL	R2, R2, 2
ADDIU	R2, R2, 1
DIV	R3, R2
MFHI	R2
SW	R2, 0(R4)
;Stepper.c,327 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 12
ADDIU	R2, R2, 56
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,328 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of Stepper_AccDec
_StepX:
;Stepper.c,336 :: 		void StepX() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_SRS {
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
;Stepper.c,337 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,339 :: 		if(SV.Single_Dual == 0){
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepX190
NOP	
J	L_StepX56
NOP	
L__StepX190:
;Stepper.c,340 :: 		SingleStepAxis(X);
MOVZ	R25, R0, R0
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,341 :: 		}else{
J	L_StepX57
NOP	
L_StepX56:
;Stepper.c,342 :: 		if(STPS[X].master = 1){
LBU	R2, Offset(_STPS+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_STPS+0)(GP)
LBU	R2, Offset(_STPS+0)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__StepX192
NOP	
J	L_StepX58
NOP	
L__StepX192:
;Stepper.c,343 :: 		if(axis_xyz == xy)
LBU	R2, Offset(_axis_xyz+0)(GP)
BEQ	R2, R0, L__StepX193
NOP	
J	L_StepX59
NOP	
L__StepX193:
;Stepper.c,344 :: 		Axis_Interpolate(X,Y);
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepX60
NOP	
L_StepX59:
;Stepper.c,345 :: 		else if(axis_xyz == xz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__StepX194
NOP	
J	L_StepX61
NOP	
L__StepX194:
;Stepper.c,346 :: 		Axis_Interpolate(X,Z);
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepX62
NOP	
L_StepX61:
;Stepper.c,347 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepX195
NOP	
J	L_StepX63
NOP	
L__StepX195:
;Stepper.c,348 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
L_StepX63:
L_StepX62:
L_StepX60:
;Stepper.c,349 :: 		}
L_StepX58:
;Stepper.c,350 :: 		}
L_StepX57:
;Stepper.c,351 :: 		}
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
;Stepper.c,355 :: 		void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_SRS {
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
;Stepper.c,356 :: 		OC2IF_bit = 0;
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Stepper.c,358 :: 		if(SV.Single_Dual == 0){
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepY197
NOP	
J	L_StepY64
NOP	
L__StepY197:
;Stepper.c,359 :: 		SingleStepAxis(Y);
ORI	R25, R0, 1
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,360 :: 		}else {
J	L_StepY65
NOP	
L_StepY64:
;Stepper.c,361 :: 		if(STPS[Y].master = 1){
LBU	R2, Offset(_STPS+100)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_STPS+100)(GP)
LBU	R2, Offset(_STPS+100)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__StepY199
NOP	
J	L_StepY66
NOP	
L__StepY199:
;Stepper.c,362 :: 		if(axis_xyz == xy )
LBU	R2, Offset(_axis_xyz+0)(GP)
BEQ	R2, R0, L__StepY200
NOP	
J	L_StepY67
NOP	
L__StepY200:
;Stepper.c,363 :: 		Axis_Interpolate(X,Y);
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepY68
NOP	
L_StepY67:
;Stepper.c,364 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepY201
NOP	
J	L_StepY69
NOP	
L__StepY201:
;Stepper.c,365 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
J	L_StepY70
NOP	
L_StepY69:
;Stepper.c,366 :: 		else if(axis_xyz == ya)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__StepY202
NOP	
J	L_StepY71
NOP	
L__StepY202:
;Stepper.c,367 :: 		Axis_Interpolate(Y,A);
ORI	R26, R0, 3
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
L_StepY71:
L_StepY70:
L_StepY68:
;Stepper.c,368 :: 		}
L_StepY66:
;Stepper.c,369 :: 		}
L_StepY65:
;Stepper.c,370 :: 		}
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
;Stepper.c,373 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_SRS {
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
;Stepper.c,374 :: 		OC7IF_bit = 0;
LUI	R2, BitMask(OC7IF_bit+0)
ORI	R2, R2, BitMask(OC7IF_bit+0)
_SX	
;Stepper.c,376 :: 		if(SV.Single_Dual == 0){
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepZ204
NOP	
J	L_StepZ72
NOP	
L__StepZ204:
;Stepper.c,377 :: 		SingleStepAxis(Z);
ORI	R25, R0, 2
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,378 :: 		}else{
J	L_StepZ73
NOP	
L_StepZ72:
;Stepper.c,379 :: 		if(STPS[Z].master = 1){
LBU	R2, Offset(_STPS+200)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_STPS+200)(GP)
LBU	R2, Offset(_STPS+200)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__StepZ206
NOP	
J	L_StepZ74
NOP	
L__StepZ206:
;Stepper.c,380 :: 		if(axis_xyz == xz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__StepZ207
NOP	
J	L_StepZ75
NOP	
L__StepZ207:
;Stepper.c,381 :: 		Axis_Interpolate(X,Z);
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepZ76
NOP	
L_StepZ75:
;Stepper.c,382 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepZ208
NOP	
J	L_StepZ77
NOP	
L__StepZ208:
;Stepper.c,383 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
J	L_StepZ78
NOP	
L_StepZ77:
;Stepper.c,384 :: 		else if(axis_xyz == za)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__StepZ209
NOP	
J	L_StepZ79
NOP	
L__StepZ209:
;Stepper.c,385 :: 		Axis_Interpolate(Z,A);
ORI	R26, R0, 3
ORI	R25, R0, 2
JAL	_Axis_Interpolate+0
NOP	
L_StepZ79:
L_StepZ78:
L_StepZ76:
;Stepper.c,387 :: 		}
L_StepZ74:
;Stepper.c,388 :: 		}
L_StepZ73:
;Stepper.c,390 :: 		}
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
;Stepper.c,393 :: 		void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_SRS {
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
;Stepper.c,394 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,396 :: 		if(SV.Single_Dual == 0){
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepA211
NOP	
J	L_StepA80
NOP	
L__StepA211:
;Stepper.c,397 :: 		SingleStepAxis(A);
ORI	R25, R0, 3
JAL	_SingleStepAxis+0
NOP	
;Stepper.c,398 :: 		}else{
J	L_StepA81
NOP	
L_StepA80:
;Stepper.c,399 :: 		if(STPS[A].master = 1){
LBU	R2, Offset(_STPS+300)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_STPS+300)(GP)
LBU	R2, Offset(_STPS+300)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__StepA213
NOP	
J	L_StepA82
NOP	
L__StepA213:
;Stepper.c,400 :: 		if(axis_xyz == xa)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__StepA214
NOP	
J	L_StepA83
NOP	
L__StepA214:
;Stepper.c,401 :: 		Axis_Interpolate(X,A);
ORI	R26, R0, 3
MOVZ	R25, R0, R0
JAL	_Axis_Interpolate+0
NOP	
J	L_StepA84
NOP	
L_StepA83:
;Stepper.c,402 :: 		else if(axis_xyz == ya)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__StepA215
NOP	
J	L_StepA85
NOP	
L__StepA215:
;Stepper.c,403 :: 		Axis_Interpolate(Y,A);
ORI	R26, R0, 3
ORI	R25, R0, 1
JAL	_Axis_Interpolate+0
NOP	
J	L_StepA86
NOP	
L_StepA85:
;Stepper.c,404 :: 		else if(axis_xyz == za)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__StepA216
NOP	
J	L_StepA87
NOP	
L__StepA216:
;Stepper.c,405 :: 		Axis_Interpolate(Z,A);
ORI	R26, R0, 3
ORI	R25, R0, 2
JAL	_Axis_Interpolate+0
NOP	
L_StepA87:
L_StepA86:
L_StepA84:
;Stepper.c,406 :: 		}
L_StepA82:
;Stepper.c,407 :: 		}
L_StepA81:
;Stepper.c,408 :: 		}
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
;Stepper.c,415 :: 		void SingleStepAxis(int axis){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,416 :: 		if(STPS[axis].step_count >= STPS[axis].dist){
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 44
LW	R3, 0(R2)
ADDIU	R2, R4, 48
LW	R2, 0(R2)
SLT	R2, R3, R2
BEQ	R2, R0, L__SingleStepAxis218
NOP	
J	L_SingleStepAxis88
NOP	
L__SingleStepAxis218:
;Stepper.c,417 :: 		StopAxis(axis);
JAL	_StopAxis+0
NOP	
;Stepper.c,418 :: 		return;
J	L_end_SingleStepAxis
NOP	
;Stepper.c,419 :: 		}
L_SingleStepAxis88:
;Stepper.c,421 :: 		Step_Cycle(axis);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,422 :: 		Pulse(axis);
JAL	Stepper_Pulse+0
NOP	
;Stepper.c,424 :: 		}
L_end_SingleStepAxis:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _SingleStepAxis
_Axis_Interpolate:
;Stepper.c,431 :: 		void Axis_Interpolate(int axisA,int axisB){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Stepper.c,434 :: 		cnt++;
SW	R25, 4(SP)
LH	R2, Offset(Axis_Interpolate_cnt_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Axis_Interpolate_cnt_L0+0)(GP)
;Stepper.c,435 :: 		if(cnt > 5){
SEH	R2, R2
SLTI	R2, R2, 6
BEQ	R2, R0, L__Axis_Interpolate220
NOP	
J	L_Axis_Interpolate90
NOP	
L__Axis_Interpolate220:
;Stepper.c,436 :: 		LED2=!LED2;
_LX	
EXT	R2, R2, BitPos(LED2+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Stepper.c,437 :: 		cnt = 0;
SH	R0, Offset(Axis_Interpolate_cnt_L0+0)(GP)
;Stepper.c,438 :: 		}
L_Axis_Interpolate90:
;Stepper.c,440 :: 		if(SV.dA >= SV.dB){
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__Axis_Interpolate221
NOP	
J	L_Axis_Interpolate91
NOP	
L__Axis_Interpolate221:
;Stepper.c,442 :: 		if(STPS[axisA].step_count > SV.dA){
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
LW	R3, 0(R2)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__Axis_Interpolate222
NOP	
J	L_Axis_Interpolate92
NOP	
L__Axis_Interpolate222:
;Stepper.c,443 :: 		StopAxis(axisA);
JAL	_StopAxis+0
NOP	
;Stepper.c,444 :: 		axis_running = 2;
ORI	R2, R0, 2
SH	R2, Offset(Stepper_axis_running+0)(GP)
;Stepper.c,445 :: 		}
L_Axis_Interpolate92:
;Stepper.c,447 :: 		if(STPS[axisB].step_count > SV.dB){
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
LW	R3, 0(R2)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__Axis_Interpolate223
NOP	
J	L_Axis_Interpolate93
NOP	
L__Axis_Interpolate223:
;Stepper.c,448 :: 		StopAxis(axisB);
SH	R25, 8(SP)
SEH	R25, R26
JAL	_StopAxis+0
NOP	
LH	R25, 8(SP)
;Stepper.c,449 :: 		axis_running = 1;
ORI	R2, R0, 1
SH	R2, Offset(Stepper_axis_running+0)(GP)
;Stepper.c,450 :: 		}
L_Axis_Interpolate93:
;Stepper.c,451 :: 		if(axis_running >= 2)return;
LH	R2, Offset(Stepper_axis_running+0)(GP)
SLTI	R2, R2, 2
BEQ	R2, R0, L__Axis_Interpolate224
NOP	
J	L_Axis_Interpolate94
NOP	
L__Axis_Interpolate224:
J	L_end_Axis_Interpolate
NOP	
L_Axis_Interpolate94:
;Stepper.c,453 :: 		Step_Cycle(axisA);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,454 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__Axis_Interpolate225
NOP	
J	L_Axis_Interpolate95
NOP	
L__Axis_Interpolate225:
;Stepper.c,455 :: 		Pulse(axisA);
JAL	Stepper_Pulse+0
NOP	
L_Axis_Interpolate95:
;Stepper.c,457 :: 		if(SV.dif < 0){
LW	R2, Offset(_SV+8)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Axis_Interpolate226
NOP	
J	L_Axis_Interpolate96
NOP	
L__Axis_Interpolate226:
;Stepper.c,458 :: 		SV.dif += BresIncVal(SV.dB);//2*SV.dy;//
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+8)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+8)(GP)
;Stepper.c,459 :: 		}else{
J	L_Axis_Interpolate97
NOP	
L_Axis_Interpolate96:
;Stepper.c,460 :: 		SV.dif += BresDiffVal(SV.dB,SV.dA);//2 * (SV.dy - SV.dx);//
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+8)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+8)(GP)
;Stepper.c,461 :: 		Step_Cycle(axisB);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Stepper.c,462 :: 		}
L_Axis_Interpolate97:
;Stepper.c,463 :: 		}else{
J	L_Axis_Interpolate98
NOP	
L_Axis_Interpolate91:
;Stepper.c,465 :: 		if(STPS[axisB].step_count > SV.dB){
SEH	R3, R26
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
LW	R3, 0(R2)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__Axis_Interpolate227
NOP	
J	L_Axis_Interpolate99
NOP	
L__Axis_Interpolate227:
;Stepper.c,466 :: 		StopAxis(axisB);
SH	R25, 8(SP)
SEH	R25, R26
JAL	_StopAxis+0
NOP	
LH	R25, 8(SP)
;Stepper.c,467 :: 		axis_running = 2;
ORI	R2, R0, 2
SH	R2, Offset(Stepper_axis_running+0)(GP)
;Stepper.c,468 :: 		}
L_Axis_Interpolate99:
;Stepper.c,470 :: 		if(STPS[axisA].step_count > SV.dA){
SEH	R3, R25
ORI	R2, R0, 100
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
LW	R3, 0(R2)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__Axis_Interpolate228
NOP	
J	L_Axis_Interpolate100
NOP	
L__Axis_Interpolate228:
;Stepper.c,471 :: 		StopAxis(axisA);
JAL	_StopAxis+0
NOP	
;Stepper.c,472 :: 		axis_running = 1;
ORI	R2, R0, 1
SH	R2, Offset(Stepper_axis_running+0)(GP)
;Stepper.c,473 :: 		}
L_Axis_Interpolate100:
;Stepper.c,474 :: 		if(axis_running >= 2)return;
LH	R2, Offset(Stepper_axis_running+0)(GP)
SLTI	R2, R2, 2
BEQ	R2, R0, L__Axis_Interpolate229
NOP	
J	L_Axis_Interpolate101
NOP	
L__Axis_Interpolate229:
J	L_end_Axis_Interpolate
NOP	
L_Axis_Interpolate101:
;Stepper.c,476 :: 		Step_Cycle(axisB);
SH	R25, 8(SP)
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
LH	R25, 8(SP)
;Stepper.c,477 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+2)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L__Axis_Interpolate230
NOP	
J	L_Axis_Interpolate102
NOP	
L__Axis_Interpolate230:
;Stepper.c,478 :: 		Pulse(axisB);
SH	R25, 8(SP)
SEH	R25, R26
JAL	Stepper_Pulse+0
NOP	
LH	R25, 8(SP)
L_Axis_Interpolate102:
;Stepper.c,480 :: 		if(SV.dif < 0){
LW	R2, Offset(_SV+8)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Axis_Interpolate231
NOP	
J	L_Axis_Interpolate103
NOP	
L__Axis_Interpolate231:
;Stepper.c,481 :: 		SV.dif += BresIncVal(SV.dA);//2 * SV.dx;//
LW	R2, Offset(_SV+12)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+8)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+8)(GP)
;Stepper.c,482 :: 		}else{
J	L_Axis_Interpolate104
NOP	
L_Axis_Interpolate103:
;Stepper.c,483 :: 		SV.dif += BresDiffVal(SV.dA,SV.dB);//2 * (SV.dx - SV.dy);//
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+8)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+8)(GP)
;Stepper.c,484 :: 		Step_Cycle(axisA);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,485 :: 		}
L_Axis_Interpolate104:
;Stepper.c,486 :: 		}
L_Axis_Interpolate98:
;Stepper.c,487 :: 		}
L_end_Axis_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Axis_Interpolate
