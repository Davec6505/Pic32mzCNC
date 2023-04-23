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
;Stepper.c,23 :: 		EN_Step_PinDirY  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirY+0), 1
_SX	
;Stepper.c,24 :: 		DIR_Step_PinDirY = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirY+0), 1
_SX	
;Stepper.c,31 :: 		EN_Step_PinDirZ  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirZ+0), 1
_SX	
;Stepper.c,32 :: 		DIR_Step_PinDirZ = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirZ+0), 1
_SX	
;Stepper.c,39 :: 		EN_Step_PinDirA  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirA+0), 1
_SX	
;Stepper.c,40 :: 		DIR_Step_PinDirA = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirA+0), 1
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
BNE	R2, R0, L__EnableSteppers117
NOP	
J	L_EnableSteppers1
NOP	
L__EnableSteppers117:
;Stepper.c,76 :: 		if(i==0) EN_StepX       = 0;
SEH	R2, R4
BEQ	R2, R0, L__EnableSteppers118
NOP	
J	L_EnableSteppers3
NOP	
L__EnableSteppers118:
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
L_EnableSteppers3:
;Stepper.c,77 :: 		if(i==1) EN_StepY       = 0;
SEH	R3, R4
ORI	R2, R0, 1
BEQ	R3, R2, L__EnableSteppers119
NOP	
J	L_EnableSteppers4
NOP	
L__EnableSteppers119:
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
L_EnableSteppers4:
;Stepper.c,78 :: 		if(i==2) EN_StepZ       = 0;
SEH	R3, R4
ORI	R2, R0, 2
BEQ	R3, R2, L__EnableSteppers120
NOP	
J	L_EnableSteppers5
NOP	
L__EnableSteppers120:
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
L_EnableSteppers5:
;Stepper.c,79 :: 		if(i==3) EN_StepA       = 0;
SEH	R3, R4
ORI	R2, R0, 3
BEQ	R3, R2, L__EnableSteppers121
NOP	
J	L_EnableSteppers6
NOP	
L__EnableSteppers121:
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
BNE	R2, R0, L__EnableStepper124
NOP	
J	L_EnableStepper9
NOP	
L__EnableStepper124:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__EnableStepper126
NOP	
J	L_EnableStepper10
NOP	
L__EnableStepper126:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__EnableStepper128
NOP	
J	L_EnableStepper11
NOP	
L__EnableStepper128:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__EnableStepper130
NOP	
J	L_EnableStepper12
NOP	
L__EnableStepper130:
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
_DisableStepperInterrupt:
;Stepper.c,101 :: 		void DisableStepperInterrupt(int stepper){
;Stepper.c,102 :: 		switch(stepper){
J	L_DisableStepperInterrupt13
NOP	
;Stepper.c,103 :: 		case X:OC5IE_bit = 0; break;
L_DisableStepperInterrupt15:
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
J	L_DisableStepperInterrupt14
NOP	
;Stepper.c,104 :: 		case Y:OC2IE_bit = 0; break;
L_DisableStepperInterrupt16:
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
J	L_DisableStepperInterrupt14
NOP	
;Stepper.c,105 :: 		case Z:OC7IE_bit = 0; break;
L_DisableStepperInterrupt17:
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
J	L_DisableStepperInterrupt14
NOP	
;Stepper.c,106 :: 		case A:OC3IE_bit = 0; break;
L_DisableStepperInterrupt18:
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
J	L_DisableStepperInterrupt14
NOP	
;Stepper.c,109 :: 		}
L_DisableStepperInterrupt13:
SEH	R2, R25
BNE	R2, R0, L__DisableStepperInterrupt134
NOP	
J	L_DisableStepperInterrupt15
NOP	
L__DisableStepperInterrupt134:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__DisableStepperInterrupt136
NOP	
J	L_DisableStepperInterrupt16
NOP	
L__DisableStepperInterrupt136:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__DisableStepperInterrupt138
NOP	
J	L_DisableStepperInterrupt17
NOP	
L__DisableStepperInterrupt138:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__DisableStepperInterrupt140
NOP	
J	L_DisableStepperInterrupt18
NOP	
L__DisableStepperInterrupt140:
L_DisableStepperInterrupt14:
;Stepper.c,110 :: 		}
L_end_DisableStepperInterrupt:
JR	RA
NOP	
; end of _DisableStepperInterrupt
_GET_RunState:
;Stepper.c,115 :: 		int GET_RunState(int axis_No){
;Stepper.c,116 :: 		return STPS[axis_No].run_state;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LH	R2, 0(R2)
;Stepper.c,117 :: 		}
L_end_GET_RunState:
JR	RA
NOP	
; end of _GET_RunState
_Get_AxisStatus:
;Stepper.c,119 :: 		int Get_AxisStatus(int stepper){
;Stepper.c,120 :: 		int state = 0;
; state start address is: 16 (R4)
MOVZ	R4, R0, R0
;Stepper.c,121 :: 		switch(stepper){
J	L_Get_AxisStatus19
NOP	
; state end address is: 16 (R4)
;Stepper.c,122 :: 		case X:state = EN_StepX&1; break;
L_Get_AxisStatus21:
_LX	
EXT	R2, R2, BitPos(EN_StepX+0), 1
ANDI	R2, R2, 1
; state start address is: 8 (R2)
ANDI	R2, R2, 255
; state end address is: 8 (R2)
J	L_Get_AxisStatus20
NOP	
;Stepper.c,123 :: 		case Y:state = EN_StepY&1; break;
L_Get_AxisStatus22:
_LX	
EXT	R2, R2, BitPos(EN_StepY+0), 1
ANDI	R2, R2, 1
; state start address is: 8 (R2)
ANDI	R2, R2, 255
; state end address is: 8 (R2)
J	L_Get_AxisStatus20
NOP	
;Stepper.c,124 :: 		case Z:state = EN_StepZ&1; break;
L_Get_AxisStatus23:
_LX	
EXT	R2, R2, BitPos(EN_StepZ+0), 1
ANDI	R2, R2, 1
; state start address is: 8 (R2)
ANDI	R2, R2, 255
; state end address is: 8 (R2)
J	L_Get_AxisStatus20
NOP	
;Stepper.c,125 :: 		case A:state = EN_StepA&1; break;
L_Get_AxisStatus24:
_LX	
EXT	R2, R2, BitPos(EN_StepA+0), 1
ANDI	R2, R2, 1
; state start address is: 8 (R2)
ANDI	R2, R2, 255
; state end address is: 8 (R2)
J	L_Get_AxisStatus20
NOP	
;Stepper.c,128 :: 		}
L_Get_AxisStatus19:
; state start address is: 16 (R4)
SEH	R2, R25
BNE	R2, R0, L__Get_AxisStatus144
NOP	
J	L_Get_AxisStatus21
NOP	
L__Get_AxisStatus144:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Get_AxisStatus146
NOP	
J	L_Get_AxisStatus22
NOP	
L__Get_AxisStatus146:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Get_AxisStatus148
NOP	
J	L_Get_AxisStatus23
NOP	
L__Get_AxisStatus148:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Get_AxisStatus150
NOP	
J	L_Get_AxisStatus24
NOP	
L__Get_AxisStatus150:
; state end address is: 16 (R4)
SEH	R2, R4
L_Get_AxisStatus20:
;Stepper.c,129 :: 		return state;
; state start address is: 8 (R2)
; state end address is: 8 (R2)
;Stepper.c,130 :: 		}
L_end_Get_AxisStatus:
JR	RA
NOP	
; end of _Get_AxisStatus
_Get_Axis_IEnable_States:
;Stepper.c,134 :: 		int Get_Axis_IEnable_States(){
;Stepper.c,135 :: 		int temp = 0;
; temp start address is: 16 (R4)
MOVZ	R4, R0, R0
;Stepper.c,136 :: 		temp |= OC3IE_bit << 3;
_LX	
EXT	R2, R2, BitPos(OC3IE_bit+0), 1
ANDI	R2, R2, 255
SLL	R2, R2, 3
OR	R3, R4, R2
; temp end address is: 16 (R4)
;Stepper.c,137 :: 		temp |= OC7IE_bit << 2;
_LX	
EXT	R2, R2, BitPos(OC7IE_bit+0), 1
ANDI	R2, R2, 255
SLL	R2, R2, 2
OR	R3, R3, R2
;Stepper.c,138 :: 		temp |= OC2IE_bit << 1;
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
ANDI	R2, R2, 255
SLL	R2, R2, 1
OR	R3, R3, R2
;Stepper.c,139 :: 		temp |= OC5IE_bit << 0;
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
ANDI	R2, R2, 255
OR	R2, R3, R2
;Stepper.c,140 :: 		return temp;
;Stepper.c,141 :: 		}
L_end_Get_Axis_IEnable_States:
JR	RA
NOP	
; end of _Get_Axis_IEnable_States
_Single_Axis_Enable:
;Stepper.c,146 :: 		void Single_Axis_Enable(_axis_ axis_){
;Stepper.c,148 :: 		axis_running =0;
SH	R0, Offset(Stepper_axis_running+0)(GP)
;Stepper.c,150 :: 		switch(axis_){
J	L_Single_Axis_Enable25
NOP	
;Stepper.c,151 :: 		case X:
L_Single_Axis_Enable27:
;Stepper.c,152 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+8)(GP)
;Stepper.c,153 :: 		break;
J	L_Single_Axis_Enable26
NOP	
;Stepper.c,154 :: 		case Y:
L_Single_Axis_Enable28:
;Stepper.c,155 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+8)(GP)
;Stepper.c,156 :: 		break;
J	L_Single_Axis_Enable26
NOP	
;Stepper.c,157 :: 		case Z:
L_Single_Axis_Enable29:
;Stepper.c,158 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+8)(GP)
;Stepper.c,159 :: 		break;
J	L_Single_Axis_Enable26
NOP	
;Stepper.c,160 :: 		case A:
L_Single_Axis_Enable30:
;Stepper.c,161 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+8)(GP)
;Stepper.c,162 :: 		break;
J	L_Single_Axis_Enable26
NOP	
;Stepper.c,163 :: 		case B:
L_Single_Axis_Enable31:
;Stepper.c,164 :: 		OC6IE_bit = 1;OC6CONbits.ON = 1;
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC6CONbits+8)(GP)
;Stepper.c,165 :: 		break;
J	L_Single_Axis_Enable26
NOP	
;Stepper.c,166 :: 		case C:
L_Single_Axis_Enable32:
;Stepper.c,167 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+8)(GP)
;Stepper.c,168 :: 		break;
J	L_Single_Axis_Enable26
NOP	
;Stepper.c,169 :: 		default:
L_Single_Axis_Enable33:
;Stepper.c,170 :: 		break;
J	L_Single_Axis_Enable26
NOP	
;Stepper.c,171 :: 		}
L_Single_Axis_Enable25:
ANDI	R2, R25, 255
BNE	R2, R0, L__Single_Axis_Enable154
NOP	
J	L_Single_Axis_Enable27
NOP	
L__Single_Axis_Enable154:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Single_Axis_Enable156
NOP	
J	L_Single_Axis_Enable28
NOP	
L__Single_Axis_Enable156:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Single_Axis_Enable158
NOP	
J	L_Single_Axis_Enable29
NOP	
L__Single_Axis_Enable158:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Single_Axis_Enable160
NOP	
J	L_Single_Axis_Enable30
NOP	
L__Single_Axis_Enable160:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Single_Axis_Enable162
NOP	
J	L_Single_Axis_Enable31
NOP	
L__Single_Axis_Enable162:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Single_Axis_Enable164
NOP	
J	L_Single_Axis_Enable32
NOP	
L__Single_Axis_Enable164:
J	L_Single_Axis_Enable33
NOP	
L_Single_Axis_Enable26:
;Stepper.c,172 :: 		}
L_end_Single_Axis_Enable:
JR	RA
NOP	
; end of _Single_Axis_Enable
_StopAxis:
;Stepper.c,174 :: 		void StopAxis(int axis){
;Stepper.c,175 :: 		switch(axis){
J	L_StopAxis34
NOP	
;Stepper.c,176 :: 		case X:
L_StopAxis36:
;Stepper.c,177 :: 		OC5IE_bit = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
;Stepper.c,178 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+4)(GP)
;Stepper.c,179 :: 		break;
J	L_StopAxis35
NOP	
;Stepper.c,180 :: 		case Y:
L_StopAxis37:
;Stepper.c,181 :: 		OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
;Stepper.c,182 :: 		OC2CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+4)(GP)
;Stepper.c,183 :: 		break;
J	L_StopAxis35
NOP	
;Stepper.c,184 :: 		case Z:
L_StopAxis38:
;Stepper.c,185 :: 		OC7IE_bit = 0;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
;Stepper.c,186 :: 		OC7CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+4)(GP)
;Stepper.c,187 :: 		break;
J	L_StopAxis35
NOP	
;Stepper.c,188 :: 		case A:
L_StopAxis39:
;Stepper.c,189 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,190 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,191 :: 		break;
J	L_StopAxis35
NOP	
;Stepper.c,192 :: 		default : break;
L_StopAxis40:
J	L_StopAxis35
NOP	
;Stepper.c,193 :: 		}
L_StopAxis34:
SEH	R2, R25
BNE	R2, R0, L__StopAxis167
NOP	
J	L_StopAxis36
NOP	
L__StopAxis167:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__StopAxis169
NOP	
J	L_StopAxis37
NOP	
L__StopAxis169:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__StopAxis171
NOP	
J	L_StopAxis38
NOP	
L__StopAxis171:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__StopAxis173
NOP	
J	L_StopAxis39
NOP	
L__StopAxis173:
J	L_StopAxis40
NOP	
L_StopAxis35:
;Stepper.c,194 :: 		STPS[axis].stopAxis = 1;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LBU	R2, 0(R3)
ORI	R2, R2, 4
SB	R2, 0(R3)
;Stepper.c,195 :: 		}
L_end_StopAxis:
JR	RA
NOP	
; end of _StopAxis
_disableOCx:
;Stepper.c,198 :: 		void disableOCx(){
;Stepper.c,199 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0; //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,200 :: 		OC2IE_bit = 0;OC2CONbits.ON = 0; //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+4)(GP)
;Stepper.c,201 :: 		OC7IE_bit = 0;OC7CONbits.ON = 0; //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+4)(GP)
;Stepper.c,203 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0; //A
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,204 :: 		OC6IE_bit = 0;OC6CONbits.ON = 0; //B
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
SW	R3, Offset(OC6CONbits+4)(GP)
;Stepper.c,205 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0; //Z
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,206 :: 		}
L_end_disableOCx:
JR	RA
NOP	
; end of _disableOCx
Stepper_toggleOCx:
;Stepper.c,210 :: 		static void toggleOCx(int axis_No){
;Stepper.c,211 :: 		switch(axis_No){
J	L_Stepper_toggleOCx41
NOP	
;Stepper.c,212 :: 		case X:
L_Stepper_toggleOCx43:
;Stepper.c,213 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,214 :: 		OC5R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,215 :: 		OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
;Stepper.c,216 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,217 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,218 :: 		break;
J	L_Stepper_toggleOCx42
NOP	
;Stepper.c,219 :: 		case Y:
L_Stepper_toggleOCx44:
;Stepper.c,220 :: 		OC2IF_bit = 0;
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Stepper.c,221 :: 		OC2R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC2R+0)(GP)
;Stepper.c,222 :: 		OC2RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+88)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC2RS+0)(GP)
;Stepper.c,223 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,224 :: 		OC2CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC2CON+0)(GP)
;Stepper.c,225 :: 		break;
J	L_Stepper_toggleOCx42
NOP	
;Stepper.c,226 :: 		case Z:
L_Stepper_toggleOCx45:
;Stepper.c,227 :: 		OC7R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC7R+0)(GP)
;Stepper.c,228 :: 		OC7RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+168)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC7RS+0)(GP)
;Stepper.c,229 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,230 :: 		OC7CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC7CON+0)(GP)
;Stepper.c,231 :: 		break;
J	L_Stepper_toggleOCx42
NOP	
;Stepper.c,232 :: 		case A:
L_Stepper_toggleOCx46:
;Stepper.c,233 :: 		OC3R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,234 :: 		OC3RS  = STPS[A].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+248)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,235 :: 		TMR5   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR5+0)(GP)
;Stepper.c,236 :: 		OC3CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,237 :: 		break;
J	L_Stepper_toggleOCx42
NOP	
;Stepper.c,238 :: 		case B:
L_Stepper_toggleOCx47:
;Stepper.c,239 :: 		OC6R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC6R+0)(GP)
;Stepper.c,240 :: 		OC6RS  = STPS[B].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+328)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC6RS+0)(GP)
;Stepper.c,241 :: 		TMR3   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR3+0)(GP)
;Stepper.c,242 :: 		OC6CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC6CON+0)(GP)
;Stepper.c,243 :: 		break;
J	L_Stepper_toggleOCx42
NOP	
;Stepper.c,244 :: 		case C:
L_Stepper_toggleOCx48:
;Stepper.c,245 :: 		OC8R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,246 :: 		OC8RS  = STPS[C].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+408)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,247 :: 		TMR7   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR7+0)(GP)
;Stepper.c,248 :: 		OC8CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC8CON+0)(GP)
;Stepper.c,249 :: 		break;
J	L_Stepper_toggleOCx42
NOP	
;Stepper.c,250 :: 		default:
L_Stepper_toggleOCx49:
;Stepper.c,251 :: 		break;
J	L_Stepper_toggleOCx42
NOP	
;Stepper.c,252 :: 		}
L_Stepper_toggleOCx41:
SEH	R2, R25
BNE	R2, R0, L_Stepper_toggleOCx177
NOP	
J	L_Stepper_toggleOCx43
NOP	
L_Stepper_toggleOCx177:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_Stepper_toggleOCx179
NOP	
J	L_Stepper_toggleOCx44
NOP	
L_Stepper_toggleOCx179:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Stepper_toggleOCx181
NOP	
J	L_Stepper_toggleOCx45
NOP	
L_Stepper_toggleOCx181:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_Stepper_toggleOCx183
NOP	
J	L_Stepper_toggleOCx46
NOP	
L_Stepper_toggleOCx183:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Stepper_toggleOCx185
NOP	
J	L_Stepper_toggleOCx47
NOP	
L_Stepper_toggleOCx185:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_Stepper_toggleOCx187
NOP	
J	L_Stepper_toggleOCx48
NOP	
L_Stepper_toggleOCx187:
J	L_Stepper_toggleOCx49
NOP	
L_Stepper_toggleOCx42:
;Stepper.c,254 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of Stepper_toggleOCx
_Step_Cycle:
;Stepper.c,261 :: 		void Step_Cycle(int axis_No){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,262 :: 		toggleOCx(axis_No);
JAL	Stepper_toggleOCx+0
NOP	
;Stepper.c,264 :: 		STPS[axis_No].step_count++;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 32
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,266 :: 		STPS[axis_No].steps_abs_position += STPS[axis_No].axis_dir;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 72
ADDIU	R2, R2, 2
LH	R2, 0(R2)
LW	R3, 0(R4)
SEH	R2, R2
ADDU	R2, R3, R2
SW	R2, 0(R4)
;Stepper.c,268 :: 		}
L_end_Step_Cycle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Step_Cycle
Stepper_Pulse:
;Stepper.c,271 :: 		static int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,273 :: 		switch(STPS[axis_No].run_state) {
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SW	R2, 4(SP)
J	L_Stepper_Pulse50
NOP	
;Stepper.c,274 :: 		case STOP:
L_Stepper_Pulse52:
;Stepper.c,275 :: 		STPS[axis_No].run_state  = STOP;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,276 :: 		StopAxis(axis_No);
JAL	_StopAxis+0
NOP	
;Stepper.c,279 :: 		bit_false(SV.mode_complete,bit(axis_No));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LBU	R2, Offset(_SV+1)(GP)
AND	R2, R2, R3
SB	R2, Offset(_SV+1)(GP)
;Stepper.c,280 :: 		break;
J	L_Stepper_Pulse51
NOP	
;Stepper.c,281 :: 		case ACCEL:
L_Stepper_Pulse53:
;Stepper.c,283 :: 		AccDec(axis_No);
JAL	Stepper_AccDec+0
NOP	
;Stepper.c,284 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
SEH	R3, R25
ORI	R2, R0, 80
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
BEQ	R2, R0, L_Stepper_Pulse190
NOP	
J	L_Stepper_Pulse54
NOP	
L_Stepper_Pulse190:
;Stepper.c,285 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,287 :: 		}
L_Stepper_Pulse54:
;Stepper.c,288 :: 		if(STPS[axis_No].step_count > STPS[axis_No].max_step_lim){
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 32
LW	R3, 0(R2)
ADDIU	R2, R4, 56
LW	R2, 0(R2)
SLT	R2, R2, R3
BNE	R2, R0, L_Stepper_Pulse191
NOP	
J	L_Stepper_Pulse55
NOP	
L_Stepper_Pulse191:
;Stepper.c,289 :: 		STPS[axis_No].run_state  = RUN;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 3
SH	R2, 0(R3)
;Stepper.c,290 :: 		}
L_Stepper_Pulse55:
;Stepper.c,293 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 32
LW	R3, 0(R2)
ADDIU	R2, R4, 12
LW	R2, 0(R2)
SLT	R2, R3, R2
BEQ	R2, R0, L_Stepper_Pulse192
NOP	
J	L_Stepper_Pulse56
NOP	
L_Stepper_Pulse192:
;Stepper.c,294 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,295 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 60
SW	R0, 0(R2)
;Stepper.c,296 :: 		STPS[axis_No].run_state   = DECEL;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 2
SH	R2, 0(R3)
;Stepper.c,297 :: 		}
L_Stepper_Pulse56:
;Stepper.c,298 :: 		break;
J	L_Stepper_Pulse51
NOP	
;Stepper.c,299 :: 		case RUN:
L_Stepper_Pulse57:
;Stepper.c,300 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,303 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 32
LW	R3, 0(R2)
ADDIU	R2, R4, 12
LW	R2, 0(R2)
SLT	R2, R3, R2
BEQ	R2, R0, L_Stepper_Pulse193
NOP	
J	L_Stepper_Pulse58
NOP	
L_Stepper_Pulse193:
;Stepper.c,304 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,305 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 60
SW	R0, 0(R2)
;Stepper.c,306 :: 		STPS[axis_No].run_state =  DECEL;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 2
SH	R2, 0(R3)
;Stepper.c,307 :: 		}
L_Stepper_Pulse58:
;Stepper.c,308 :: 		break;
J	L_Stepper_Pulse51
NOP	
;Stepper.c,309 :: 		case DECEL:
L_Stepper_Pulse59:
;Stepper.c,311 :: 		AccDec(axis_No);
JAL	Stepper_AccDec+0
NOP	
;Stepper.c,313 :: 		if(STPS[axis_No].accel_count >= -1 ){
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
LW	R2, 0(R2)
SLTI	R2, R2, -1
BEQ	R2, R0, L_Stepper_Pulse194
NOP	
J	L_Stepper_Pulse60
NOP	
L_Stepper_Pulse194:
;Stepper.c,314 :: 		STPS[axis_No].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,315 :: 		}
L_Stepper_Pulse60:
;Stepper.c,316 :: 		break;
J	L_Stepper_Pulse51
NOP	
;Stepper.c,317 :: 		default:break;
L_Stepper_Pulse61:
J	L_Stepper_Pulse51
NOP	
;Stepper.c,318 :: 		}
L_Stepper_Pulse50:
LW	R4, 4(SP)
LH	R2, 0(R4)
SEH	R2, R2
BNE	R2, R0, L_Stepper_Pulse196
NOP	
J	L_Stepper_Pulse52
NOP	
L_Stepper_Pulse196:
LH	R2, 0(R4)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L_Stepper_Pulse198
NOP	
J	L_Stepper_Pulse53
NOP	
L_Stepper_Pulse198:
LH	R2, 0(R4)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L_Stepper_Pulse200
NOP	
J	L_Stepper_Pulse57
NOP	
L_Stepper_Pulse200:
LH	R2, 0(R4)
SEH	R3, R2
ORI	R2, R0, 2
BNE	R3, R2, L_Stepper_Pulse202
NOP	
J	L_Stepper_Pulse59
NOP	
L_Stepper_Pulse202:
J	L_Stepper_Pulse61
NOP	
L_Stepper_Pulse51:
;Stepper.c,319 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,320 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Stepper_Pulse
Stepper_AccDec:
;Stepper.c,324 :: 		static void AccDec(int axis_No){
;Stepper.c,325 :: 		STPS[axis_No].accel_count++;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,326 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R6, R2, R3
ADDIU	R5, R6, 44
ADDIU	R2, R6, 8
LW	R4, 0(R2)
SLL	R3, R4, 1
ADDIU	R2, R6, 60
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
;Stepper.c,327 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R5, R2, R3
ADDIU	R4, R5, 60
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
;Stepper.c,328 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 44
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,329 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of Stepper_AccDec
_StepX:
;Stepper.c,337 :: 		void StepX() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_SRS {
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
;Stepper.c,338 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,340 :: 		if(SV.Single_Dual == 0){
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 5, 1
BEQ	R2, R0, L__StepX205
NOP	
J	L_StepX62
NOP	
L__StepX205:
;Stepper.c,341 :: 		SingleStepAxis(X);
MOVZ	R25, R0, R0
JAL	Stepper_SingleStepAxis+0
NOP	
;Stepper.c,342 :: 		}else{
J	L_StepX63
NOP	
L_StepX62:
;Stepper.c,343 :: 		if(STPS[X].master = 1){
LBU	R2, Offset(_STPS+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_STPS+0)(GP)
LBU	R2, Offset(_STPS+0)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__StepX207
NOP	
J	L_StepX64
NOP	
L__StepX207:
;Stepper.c,344 :: 		if(axis_xyz == xy)
LBU	R2, Offset(_axis_xyz+0)(GP)
BEQ	R2, R0, L__StepX208
NOP	
J	L_StepX65
NOP	
L__StepX208:
;Stepper.c,345 :: 		Axis_Interpolate(X,Y);
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepX66
NOP	
L_StepX65:
;Stepper.c,346 :: 		else if(axis_xyz == xz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__StepX209
NOP	
J	L_StepX67
NOP	
L__StepX209:
;Stepper.c,347 :: 		Axis_Interpolate(X,Z);
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepX68
NOP	
L_StepX67:
;Stepper.c,348 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepX210
NOP	
J	L_StepX69
NOP	
L__StepX210:
;Stepper.c,349 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	Stepper_Axis_Interpolate+0
NOP	
L_StepX69:
L_StepX68:
L_StepX66:
;Stepper.c,350 :: 		}
L_StepX64:
;Stepper.c,351 :: 		}
L_StepX63:
;Stepper.c,352 :: 		}
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
;Stepper.c,356 :: 		void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_SRS {
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
;Stepper.c,357 :: 		OC2IF_bit = 0;
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Stepper.c,359 :: 		if(SV.Single_Dual == 0){
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 5, 1
BEQ	R2, R0, L__StepY212
NOP	
J	L_StepY70
NOP	
L__StepY212:
;Stepper.c,360 :: 		SingleStepAxis(Y);
ORI	R25, R0, 1
JAL	Stepper_SingleStepAxis+0
NOP	
;Stepper.c,361 :: 		}else {
J	L_StepY71
NOP	
L_StepY70:
;Stepper.c,362 :: 		if(STPS[Y].master = 1){
LBU	R2, Offset(_STPS+80)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_STPS+80)(GP)
LBU	R2, Offset(_STPS+80)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__StepY214
NOP	
J	L_StepY72
NOP	
L__StepY214:
;Stepper.c,363 :: 		if(axis_xyz == xy )
LBU	R2, Offset(_axis_xyz+0)(GP)
BEQ	R2, R0, L__StepY215
NOP	
J	L_StepY73
NOP	
L__StepY215:
;Stepper.c,364 :: 		Axis_Interpolate(X,Y);
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepY74
NOP	
L_StepY73:
;Stepper.c,365 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepY216
NOP	
J	L_StepY75
NOP	
L__StepY216:
;Stepper.c,366 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepY76
NOP	
L_StepY75:
;Stepper.c,367 :: 		else if(axis_xyz == ya)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__StepY217
NOP	
J	L_StepY77
NOP	
L__StepY217:
;Stepper.c,368 :: 		Axis_Interpolate(Y,A);
ORI	R26, R0, 3
ORI	R25, R0, 1
JAL	Stepper_Axis_Interpolate+0
NOP	
L_StepY77:
L_StepY76:
L_StepY74:
;Stepper.c,369 :: 		}
L_StepY72:
;Stepper.c,370 :: 		}
L_StepY71:
;Stepper.c,371 :: 		}
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
;Stepper.c,374 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_SRS {
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
;Stepper.c,375 :: 		OC7IF_bit = 0;
LUI	R2, BitMask(OC7IF_bit+0)
ORI	R2, R2, BitMask(OC7IF_bit+0)
_SX	
;Stepper.c,377 :: 		if(SV.Single_Dual == 0){
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 5, 1
BEQ	R2, R0, L__StepZ219
NOP	
J	L_StepZ78
NOP	
L__StepZ219:
;Stepper.c,378 :: 		SingleStepAxis(Z);
ORI	R25, R0, 2
JAL	Stepper_SingleStepAxis+0
NOP	
;Stepper.c,379 :: 		}else{
J	L_StepZ79
NOP	
L_StepZ78:
;Stepper.c,380 :: 		if(STPS[Z].master = 1){
LBU	R2, Offset(_STPS+160)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_STPS+160)(GP)
LBU	R2, Offset(_STPS+160)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__StepZ221
NOP	
J	L_StepZ80
NOP	
L__StepZ221:
;Stepper.c,381 :: 		if(axis_xyz == xz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__StepZ222
NOP	
J	L_StepZ81
NOP	
L__StepZ222:
;Stepper.c,382 :: 		Axis_Interpolate(X,Z);
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepZ82
NOP	
L_StepZ81:
;Stepper.c,383 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepZ223
NOP	
J	L_StepZ83
NOP	
L__StepZ223:
;Stepper.c,384 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepZ84
NOP	
L_StepZ83:
;Stepper.c,385 :: 		else if(axis_xyz == za)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__StepZ224
NOP	
J	L_StepZ85
NOP	
L__StepZ224:
;Stepper.c,386 :: 		Axis_Interpolate(Z,A);
ORI	R26, R0, 3
ORI	R25, R0, 2
JAL	Stepper_Axis_Interpolate+0
NOP	
L_StepZ85:
L_StepZ84:
L_StepZ82:
;Stepper.c,388 :: 		}
L_StepZ80:
;Stepper.c,389 :: 		}
L_StepZ79:
;Stepper.c,391 :: 		}
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
;Stepper.c,394 :: 		void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_SRS {
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
;Stepper.c,395 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,397 :: 		if(SV.Single_Dual == 0){
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 5, 1
BEQ	R2, R0, L__StepA226
NOP	
J	L_StepA86
NOP	
L__StepA226:
;Stepper.c,398 :: 		SingleStepAxis(A);
ORI	R25, R0, 3
JAL	Stepper_SingleStepAxis+0
NOP	
;Stepper.c,399 :: 		}else{
J	L_StepA87
NOP	
L_StepA86:
;Stepper.c,400 :: 		if(STPS[A].master = 1){
LBU	R2, Offset(_STPS+240)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_STPS+240)(GP)
LBU	R2, Offset(_STPS+240)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__StepA228
NOP	
J	L_StepA88
NOP	
L__StepA228:
;Stepper.c,401 :: 		if(axis_xyz == xa)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__StepA229
NOP	
J	L_StepA89
NOP	
L__StepA229:
;Stepper.c,402 :: 		Axis_Interpolate(X,A);
ORI	R26, R0, 3
MOVZ	R25, R0, R0
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepA90
NOP	
L_StepA89:
;Stepper.c,403 :: 		else if(axis_xyz == ya)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__StepA230
NOP	
J	L_StepA91
NOP	
L__StepA230:
;Stepper.c,404 :: 		Axis_Interpolate(Y,A);
ORI	R26, R0, 3
ORI	R25, R0, 1
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepA92
NOP	
L_StepA91:
;Stepper.c,405 :: 		else if(axis_xyz == za)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__StepA231
NOP	
J	L_StepA93
NOP	
L__StepA231:
;Stepper.c,406 :: 		Axis_Interpolate(Z,A);
ORI	R26, R0, 3
ORI	R25, R0, 2
JAL	Stepper_Axis_Interpolate+0
NOP	
L_StepA93:
L_StepA92:
L_StepA90:
;Stepper.c,407 :: 		}
L_StepA88:
;Stepper.c,408 :: 		}
L_StepA87:
;Stepper.c,409 :: 		}
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
Stepper_SingleStepAxis:
;Stepper.c,416 :: 		static void SingleStepAxis(int axis){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,417 :: 		Step_Cycle(axis);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,418 :: 		Pulse(axis);
JAL	Stepper_Pulse+0
NOP	
;Stepper.c,419 :: 		}
L_end_SingleStepAxis:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Stepper_SingleStepAxis
_Start_Interpolation:
;Stepper.c,426 :: 		void Start_Interpolation(int axisA,int axisB){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,427 :: 		Axis_Interpolate(axisA,axisB);
JAL	Stepper_Axis_Interpolate+0
NOP	
;Stepper.c,428 :: 		}
L_end_Start_Interpolation:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Start_Interpolation
Stepper_Axis_Interpolate:
;Stepper.c,430 :: 		static void Axis_Interpolate(int axisA,int axisB){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,433 :: 		cnt++;
LH	R2, Offset(Stepper_Axis_Interpolate_cnt_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Stepper_Axis_Interpolate_cnt_L0+0)(GP)
;Stepper.c,434 :: 		if(cnt > 5){
SEH	R2, R2
SLTI	R2, R2, 6
BEQ	R2, R0, L_Stepper_Axis_Interpolate235
NOP	
J	L_Stepper_Axis_Interpolate94
NOP	
L_Stepper_Axis_Interpolate235:
;Stepper.c,435 :: 		LED2=!LED2;
_LX	
EXT	R2, R2, BitPos(LED2+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Stepper.c,436 :: 		cnt = 0;
SH	R0, Offset(Stepper_Axis_Interpolate_cnt_L0+0)(GP)
;Stepper.c,437 :: 		}
L_Stepper_Axis_Interpolate94:
;Stepper.c,439 :: 		if(SV.dA >= SV.dB){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L_Stepper_Axis_Interpolate236
NOP	
J	L_Stepper_Axis_Interpolate95
NOP	
L_Stepper_Axis_Interpolate236:
;Stepper.c,443 :: 		if(STPS[axisA].step_count < STPS[axisA].dist)
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 32
LW	R3, 0(R2)
ADDIU	R2, R4, 36
LW	R2, 0(R2)
SLT	R2, R3, R2
BNE	R2, R0, L_Stepper_Axis_Interpolate237
NOP	
J	L_Stepper_Axis_Interpolate96
NOP	
L_Stepper_Axis_Interpolate237:
;Stepper.c,444 :: 		Step_Cycle(axisA);
JAL	_Step_Cycle+0
NOP	
J	L_Stepper_Axis_Interpolate97
NOP	
L_Stepper_Axis_Interpolate96:
;Stepper.c,446 :: 		if(SV.cir)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L_Stepper_Axis_Interpolate239
NOP	
J	L_Stepper_Axis_Interpolate98
NOP	
L_Stepper_Axis_Interpolate239:
;Stepper.c,447 :: 		StopAxis(axisA);
JAL	_StopAxis+0
NOP	
L_Stepper_Axis_Interpolate98:
;Stepper.c,448 :: 		}
L_Stepper_Axis_Interpolate97:
;Stepper.c,450 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L_Stepper_Axis_Interpolate240
NOP	
J	L_Stepper_Axis_Interpolate99
NOP	
L_Stepper_Axis_Interpolate240:
;Stepper.c,451 :: 		Pulse(axisA);
JAL	Stepper_Pulse+0
NOP	
L_Stepper_Axis_Interpolate99:
;Stepper.c,453 :: 		if(SV.dif < 0){
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L_Stepper_Axis_Interpolate241
NOP	
J	L_Stepper_Axis_Interpolate100
NOP	
L_Stepper_Axis_Interpolate241:
;Stepper.c,454 :: 		SV.dif += BresIncVal(SV.dB);//2*SV.dy;//
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+16)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,455 :: 		}else{
J	L_Stepper_Axis_Interpolate101
NOP	
L_Stepper_Axis_Interpolate100:
;Stepper.c,456 :: 		Step_Cycle(axisB);
SH	R25, 4(SP)
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
LH	R25, 4(SP)
;Stepper.c,457 :: 		SV.dif += BresDiffVal(SV.dB,SV.dA);//2 * (SV.dy - SV.dx);//
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+16)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,458 :: 		}
L_Stepper_Axis_Interpolate101:
;Stepper.c,461 :: 		if(STPS[axisA].run_state == STOP | STPS[axisA].step_count >= STPS[axisA].dist){
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 4
LH	R2, 0(R2)
SEH	R2, R2
XORI	R5, R2, 0
SLTIU	R5, R5, 1
ADDIU	R4, R3, 32
ADDIU	R2, R3, 36
LW	R3, 0(R2)
LW	R2, 0(R4)
SLT	R2, R2, R3
XORI	R2, R2, 1
OR	R2, R5, R2
BNE	R2, R0, L_Stepper_Axis_Interpolate245
NOP	
J	L_Stepper_Axis_Interpolate102
NOP	
L_Stepper_Axis_Interpolate245:
;Stepper.c,462 :: 		StopAxis(axisB);
SH	R25, 4(SP)
SEH	R25, R26
JAL	_StopAxis+0
NOP	
LH	R25, 4(SP)
;Stepper.c,463 :: 		STPS[axisA].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,464 :: 		STPS[axisB].run_state = STOP;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,465 :: 		SV.mode_complete = 0;
SB	R0, Offset(_SV+1)(GP)
;Stepper.c,466 :: 		}
L_Stepper_Axis_Interpolate102:
;Stepper.c,468 :: 		}else{
J	L_Stepper_Axis_Interpolate103
NOP	
L_Stepper_Axis_Interpolate95:
;Stepper.c,472 :: 		if(STPS[axisB].step_count < STPS[axisB].dist)
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 32
LW	R3, 0(R2)
ADDIU	R2, R4, 36
LW	R2, 0(R2)
SLT	R2, R3, R2
BNE	R2, R0, L_Stepper_Axis_Interpolate246
NOP	
J	L_Stepper_Axis_Interpolate104
NOP	
L_Stepper_Axis_Interpolate246:
;Stepper.c,473 :: 		Step_Cycle(axisB);
SH	R25, 4(SP)
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
LH	R25, 4(SP)
J	L_Stepper_Axis_Interpolate105
NOP	
L_Stepper_Axis_Interpolate104:
;Stepper.c,475 :: 		if(SV.cir)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L_Stepper_Axis_Interpolate248
NOP	
J	L_Stepper_Axis_Interpolate106
NOP	
L_Stepper_Axis_Interpolate248:
;Stepper.c,476 :: 		StopAxis(axisB);
SH	R25, 4(SP)
SEH	R25, R26
JAL	_StopAxis+0
NOP	
LH	R25, 4(SP)
L_Stepper_Axis_Interpolate106:
;Stepper.c,477 :: 		}
L_Stepper_Axis_Interpolate105:
;Stepper.c,479 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L_Stepper_Axis_Interpolate249
NOP	
J	L_Stepper_Axis_Interpolate107
NOP	
L_Stepper_Axis_Interpolate249:
;Stepper.c,480 :: 		Pulse(axisB);
SH	R25, 4(SP)
SEH	R25, R26
JAL	Stepper_Pulse+0
NOP	
LH	R25, 4(SP)
L_Stepper_Axis_Interpolate107:
;Stepper.c,483 :: 		if(SV.dif < 0){
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L_Stepper_Axis_Interpolate250
NOP	
J	L_Stepper_Axis_Interpolate108
NOP	
L_Stepper_Axis_Interpolate250:
;Stepper.c,484 :: 		SV.dif += BresIncVal(SV.dA);//2 * SV.dx;//
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+16)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,485 :: 		}else{
J	L_Stepper_Axis_Interpolate109
NOP	
L_Stepper_Axis_Interpolate108:
;Stepper.c,486 :: 		Step_Cycle(axisA);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,487 :: 		SV.dif += BresDiffVal(SV.dA,SV.dB);//2 * (SV.dx - SV.dy);//
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+16)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,488 :: 		}
L_Stepper_Axis_Interpolate109:
;Stepper.c,490 :: 		if(STPS[axisB].run_state == STOP | STPS[axisB].step_count >= STPS[axisB].dist){
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 4
LH	R2, 0(R2)
SEH	R2, R2
XORI	R5, R2, 0
SLTIU	R5, R5, 1
ADDIU	R4, R3, 32
ADDIU	R2, R3, 36
LW	R3, 0(R2)
LW	R2, 0(R4)
SLT	R2, R2, R3
XORI	R2, R2, 1
OR	R2, R5, R2
BNE	R2, R0, L_Stepper_Axis_Interpolate254
NOP	
J	L_Stepper_Axis_Interpolate110
NOP	
L_Stepper_Axis_Interpolate254:
;Stepper.c,491 :: 		StopAxis(axisA);
JAL	_StopAxis+0
NOP	
;Stepper.c,492 :: 		STPS[axisA].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,493 :: 		STPS[axisB].run_state = STOP;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,494 :: 		SV.mode_complete = 0;
SB	R0, Offset(_SV+1)(GP)
;Stepper.c,495 :: 		}
L_Stepper_Axis_Interpolate110:
;Stepper.c,496 :: 		}
L_Stepper_Axis_Interpolate103:
;Stepper.c,497 :: 		}
L_end_Axis_Interpolate:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Stepper_Axis_Interpolate
