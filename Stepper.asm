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
;Stepper.c,72 :: 		void EnableSteppers(int steppers){
;Stepper.c,74 :: 		for(i=0;i<steppers;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_EnableSteppers0:
; i start address is: 16 (R4)
SEH	R3, R4
SEH	R2, R25
SLT	R2, R3, R2
BNE	R2, R0, L__EnableSteppers118
NOP	
J	L_EnableSteppers1
NOP	
L__EnableSteppers118:
;Stepper.c,75 :: 		if(i==0) EN_StepX       = 0;
SEH	R2, R4
BEQ	R2, R0, L__EnableSteppers119
NOP	
J	L_EnableSteppers3
NOP	
L__EnableSteppers119:
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
L_EnableSteppers3:
;Stepper.c,76 :: 		if(i==1) EN_StepY       = 0;
SEH	R3, R4
ORI	R2, R0, 1
BEQ	R3, R2, L__EnableSteppers120
NOP	
J	L_EnableSteppers4
NOP	
L__EnableSteppers120:
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
L_EnableSteppers4:
;Stepper.c,77 :: 		if(i==2) EN_StepZ       = 0;
SEH	R3, R4
ORI	R2, R0, 2
BEQ	R3, R2, L__EnableSteppers121
NOP	
J	L_EnableSteppers5
NOP	
L__EnableSteppers121:
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
L_EnableSteppers5:
;Stepper.c,78 :: 		if(i==3) EN_StepA       = 0;
SEH	R3, R4
ORI	R2, R0, 3
BEQ	R3, R2, L__EnableSteppers122
NOP	
J	L_EnableSteppers6
NOP	
L__EnableSteppers122:
_LX	
INS	R2, R0, BitPos(EN_StepA+0), 1
_SX	
L_EnableSteppers6:
;Stepper.c,74 :: 		for(i=0;i<steppers;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,79 :: 		}
; i end address is: 16 (R4)
J	L_EnableSteppers0
NOP	
L_EnableSteppers1:
;Stepper.c,80 :: 		}
L_end_EnableSteppers:
JR	RA
NOP	
; end of _EnableSteppers
_EnableStepper:
;Stepper.c,82 :: 		void EnableStepper(int stepper){
;Stepper.c,83 :: 		switch(stepper){
J	L_EnableStepper7
NOP	
;Stepper.c,84 :: 		case X:EN_StepX = 0; break;
L_EnableStepper9:
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
J	L_EnableStepper8
NOP	
;Stepper.c,85 :: 		case Y:EN_StepY = 0; break;
L_EnableStepper10:
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
J	L_EnableStepper8
NOP	
;Stepper.c,86 :: 		case Z:EN_StepZ = 0; break;
L_EnableStepper11:
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
J	L_EnableStepper8
NOP	
;Stepper.c,87 :: 		case A:EN_StepA = 0; break;
L_EnableStepper12:
_LX	
INS	R2, R0, BitPos(EN_StepA+0), 1
_SX	
J	L_EnableStepper8
NOP	
;Stepper.c,90 :: 		}
L_EnableStepper7:
SEH	R2, R25
BNE	R2, R0, L__EnableStepper125
NOP	
J	L_EnableStepper9
NOP	
L__EnableStepper125:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__EnableStepper127
NOP	
J	L_EnableStepper10
NOP	
L__EnableStepper127:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__EnableStepper129
NOP	
J	L_EnableStepper11
NOP	
L__EnableStepper129:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__EnableStepper131
NOP	
J	L_EnableStepper12
NOP	
L__EnableStepper131:
L_EnableStepper8:
;Stepper.c,91 :: 		}
L_end_EnableStepper:
JR	RA
NOP	
; end of _EnableStepper
_DisableStepper:
;Stepper.c,93 :: 		void DisableStepper(){
;Stepper.c,94 :: 		EN_StepX      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepX+0)
_SX	
;Stepper.c,95 :: 		EN_StepY      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepY+0)
_SX	
;Stepper.c,96 :: 		EN_StepZ      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepZ+0)
_SX	
;Stepper.c,97 :: 		EN_StepA      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepA+0)
_SX	
;Stepper.c,98 :: 		}
L_end_DisableStepper:
JR	RA
NOP	
; end of _DisableStepper
_DisableStepperInterrupt:
;Stepper.c,100 :: 		void DisableStepperInterrupt(int stepper){
;Stepper.c,101 :: 		switch(stepper){
J	L_DisableStepperInterrupt13
NOP	
;Stepper.c,102 :: 		case X:OC5IE_bit = 0; break;
L_DisableStepperInterrupt15:
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
J	L_DisableStepperInterrupt14
NOP	
;Stepper.c,103 :: 		case Y:OC2IE_bit = 0; break;
L_DisableStepperInterrupt16:
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
J	L_DisableStepperInterrupt14
NOP	
;Stepper.c,104 :: 		case Z:OC7IE_bit = 0; break;
L_DisableStepperInterrupt17:
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
J	L_DisableStepperInterrupt14
NOP	
;Stepper.c,105 :: 		case A:OC3IE_bit = 0; break;
L_DisableStepperInterrupt18:
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
J	L_DisableStepperInterrupt14
NOP	
;Stepper.c,108 :: 		}
L_DisableStepperInterrupt13:
SEH	R2, R25
BNE	R2, R0, L__DisableStepperInterrupt135
NOP	
J	L_DisableStepperInterrupt15
NOP	
L__DisableStepperInterrupt135:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__DisableStepperInterrupt137
NOP	
J	L_DisableStepperInterrupt16
NOP	
L__DisableStepperInterrupt137:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__DisableStepperInterrupt139
NOP	
J	L_DisableStepperInterrupt17
NOP	
L__DisableStepperInterrupt139:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__DisableStepperInterrupt141
NOP	
J	L_DisableStepperInterrupt18
NOP	
L__DisableStepperInterrupt141:
L_DisableStepperInterrupt14:
;Stepper.c,109 :: 		}
L_end_DisableStepperInterrupt:
JR	RA
NOP	
; end of _DisableStepperInterrupt
_GET_RunState:
;Stepper.c,114 :: 		int GET_RunState(int axis_No){
;Stepper.c,115 :: 		return STPS[axis_No].run_state;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LH	R2, 0(R2)
;Stepper.c,116 :: 		}
L_end_GET_RunState:
JR	RA
NOP	
; end of _GET_RunState
_Get_AxisStatus:
;Stepper.c,118 :: 		int Get_AxisStatus(int stepper){
;Stepper.c,119 :: 		int state = 0;
; state start address is: 16 (R4)
MOVZ	R4, R0, R0
;Stepper.c,120 :: 		switch(stepper){
J	L_Get_AxisStatus19
NOP	
; state end address is: 16 (R4)
;Stepper.c,121 :: 		case X:state = EN_StepX&1; break;
L_Get_AxisStatus21:
_LX	
EXT	R2, R2, BitPos(EN_StepX+0), 1
ANDI	R2, R2, 1
; state start address is: 8 (R2)
ANDI	R2, R2, 255
; state end address is: 8 (R2)
J	L_Get_AxisStatus20
NOP	
;Stepper.c,122 :: 		case Y:state = EN_StepY&1; break;
L_Get_AxisStatus22:
_LX	
EXT	R2, R2, BitPos(EN_StepY+0), 1
ANDI	R2, R2, 1
; state start address is: 8 (R2)
ANDI	R2, R2, 255
; state end address is: 8 (R2)
J	L_Get_AxisStatus20
NOP	
;Stepper.c,123 :: 		case Z:state = EN_StepZ&1; break;
L_Get_AxisStatus23:
_LX	
EXT	R2, R2, BitPos(EN_StepZ+0), 1
ANDI	R2, R2, 1
; state start address is: 8 (R2)
ANDI	R2, R2, 255
; state end address is: 8 (R2)
J	L_Get_AxisStatus20
NOP	
;Stepper.c,124 :: 		case A:state = EN_StepA&1; break;
L_Get_AxisStatus24:
_LX	
EXT	R2, R2, BitPos(EN_StepA+0), 1
ANDI	R2, R2, 1
; state start address is: 8 (R2)
ANDI	R2, R2, 255
; state end address is: 8 (R2)
J	L_Get_AxisStatus20
NOP	
;Stepper.c,127 :: 		}
L_Get_AxisStatus19:
; state start address is: 16 (R4)
SEH	R2, R25
BNE	R2, R0, L__Get_AxisStatus145
NOP	
J	L_Get_AxisStatus21
NOP	
L__Get_AxisStatus145:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Get_AxisStatus147
NOP	
J	L_Get_AxisStatus22
NOP	
L__Get_AxisStatus147:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Get_AxisStatus149
NOP	
J	L_Get_AxisStatus23
NOP	
L__Get_AxisStatus149:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Get_AxisStatus151
NOP	
J	L_Get_AxisStatus24
NOP	
L__Get_AxisStatus151:
; state end address is: 16 (R4)
SEH	R2, R4
L_Get_AxisStatus20:
;Stepper.c,128 :: 		return state;
; state start address is: 8 (R2)
; state end address is: 8 (R2)
;Stepper.c,129 :: 		}
L_end_Get_AxisStatus:
JR	RA
NOP	
; end of _Get_AxisStatus
_Get_Axis_IEnable_States:
;Stepper.c,133 :: 		int Get_Axis_IEnable_States(){
;Stepper.c,134 :: 		int temp = 0;
; temp start address is: 16 (R4)
MOVZ	R4, R0, R0
;Stepper.c,135 :: 		temp |= OC3IE_bit << 3;
_LX	
EXT	R2, R2, BitPos(OC3IE_bit+0), 1
ANDI	R2, R2, 255
SLL	R2, R2, 3
OR	R3, R4, R2
; temp end address is: 16 (R4)
;Stepper.c,136 :: 		temp |= OC7IE_bit << 2;
_LX	
EXT	R2, R2, BitPos(OC7IE_bit+0), 1
ANDI	R2, R2, 255
SLL	R2, R2, 2
OR	R3, R3, R2
;Stepper.c,137 :: 		temp |= OC2IE_bit << 1;
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
ANDI	R2, R2, 255
SLL	R2, R2, 1
OR	R3, R3, R2
;Stepper.c,138 :: 		temp |= OC5IE_bit << 0;
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
ANDI	R2, R2, 255
OR	R2, R3, R2
;Stepper.c,139 :: 		return temp;
;Stepper.c,140 :: 		}
L_end_Get_Axis_IEnable_States:
JR	RA
NOP	
; end of _Get_Axis_IEnable_States
_Single_Axis_Enable:
;Stepper.c,145 :: 		void Single_Axis_Enable(_axis_ axis_){
;Stepper.c,147 :: 		axis_running =0;
SH	R0, Offset(Stepper_axis_running+0)(GP)
;Stepper.c,149 :: 		switch(axis_){
J	L_Single_Axis_Enable25
NOP	
;Stepper.c,150 :: 		case X:
L_Single_Axis_Enable27:
;Stepper.c,151 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+8)(GP)
;Stepper.c,152 :: 		break;
J	L_Single_Axis_Enable26
NOP	
;Stepper.c,153 :: 		case Y:
L_Single_Axis_Enable28:
;Stepper.c,154 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+8)(GP)
;Stepper.c,155 :: 		break;
J	L_Single_Axis_Enable26
NOP	
;Stepper.c,156 :: 		case Z:
L_Single_Axis_Enable29:
;Stepper.c,157 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+8)(GP)
;Stepper.c,158 :: 		break;
J	L_Single_Axis_Enable26
NOP	
;Stepper.c,159 :: 		case A:
L_Single_Axis_Enable30:
;Stepper.c,160 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+8)(GP)
;Stepper.c,161 :: 		break;
J	L_Single_Axis_Enable26
NOP	
;Stepper.c,162 :: 		case B:
L_Single_Axis_Enable31:
;Stepper.c,163 :: 		OC6IE_bit = 1;OC6CONbits.ON = 1;
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC6CONbits+8)(GP)
;Stepper.c,164 :: 		break;
J	L_Single_Axis_Enable26
NOP	
;Stepper.c,165 :: 		case C:
L_Single_Axis_Enable32:
;Stepper.c,166 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+8)(GP)
;Stepper.c,167 :: 		break;
J	L_Single_Axis_Enable26
NOP	
;Stepper.c,168 :: 		default:
L_Single_Axis_Enable33:
;Stepper.c,169 :: 		break;
J	L_Single_Axis_Enable26
NOP	
;Stepper.c,170 :: 		}
L_Single_Axis_Enable25:
ANDI	R2, R25, 255
BNE	R2, R0, L__Single_Axis_Enable155
NOP	
J	L_Single_Axis_Enable27
NOP	
L__Single_Axis_Enable155:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Single_Axis_Enable157
NOP	
J	L_Single_Axis_Enable28
NOP	
L__Single_Axis_Enable157:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Single_Axis_Enable159
NOP	
J	L_Single_Axis_Enable29
NOP	
L__Single_Axis_Enable159:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Single_Axis_Enable161
NOP	
J	L_Single_Axis_Enable30
NOP	
L__Single_Axis_Enable161:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Single_Axis_Enable163
NOP	
J	L_Single_Axis_Enable31
NOP	
L__Single_Axis_Enable163:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Single_Axis_Enable165
NOP	
J	L_Single_Axis_Enable32
NOP	
L__Single_Axis_Enable165:
J	L_Single_Axis_Enable33
NOP	
L_Single_Axis_Enable26:
;Stepper.c,171 :: 		}
L_end_Single_Axis_Enable:
JR	RA
NOP	
; end of _Single_Axis_Enable
_StopAxis:
;Stepper.c,173 :: 		void StopAxis(int axis){
;Stepper.c,174 :: 		switch(axis){
J	L_StopAxis34
NOP	
;Stepper.c,175 :: 		case X:
L_StopAxis36:
;Stepper.c,176 :: 		OC5IE_bit = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
;Stepper.c,177 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+4)(GP)
;Stepper.c,178 :: 		break;
J	L_StopAxis35
NOP	
;Stepper.c,179 :: 		case Y:
L_StopAxis37:
;Stepper.c,180 :: 		OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
;Stepper.c,181 :: 		OC2CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+4)(GP)
;Stepper.c,182 :: 		break;
J	L_StopAxis35
NOP	
;Stepper.c,183 :: 		case Z:
L_StopAxis38:
;Stepper.c,184 :: 		OC7IE_bit = 0;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
;Stepper.c,185 :: 		OC7CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+4)(GP)
;Stepper.c,186 :: 		break;
J	L_StopAxis35
NOP	
;Stepper.c,187 :: 		case A:
L_StopAxis39:
;Stepper.c,188 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,189 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,190 :: 		break;
J	L_StopAxis35
NOP	
;Stepper.c,191 :: 		default : break;
L_StopAxis40:
J	L_StopAxis35
NOP	
;Stepper.c,192 :: 		}
L_StopAxis34:
SEH	R2, R25
BNE	R2, R0, L__StopAxis168
NOP	
J	L_StopAxis36
NOP	
L__StopAxis168:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__StopAxis170
NOP	
J	L_StopAxis37
NOP	
L__StopAxis170:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__StopAxis172
NOP	
J	L_StopAxis38
NOP	
L__StopAxis172:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__StopAxis174
NOP	
J	L_StopAxis39
NOP	
L__StopAxis174:
J	L_StopAxis40
NOP	
L_StopAxis35:
;Stepper.c,193 :: 		STPS[axis].stopAxis = 1;
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
;Stepper.c,194 :: 		}
L_end_StopAxis:
JR	RA
NOP	
; end of _StopAxis
_disableOCx:
;Stepper.c,197 :: 		void disableOCx(){
;Stepper.c,198 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0; //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,199 :: 		OC2IE_bit = 0;OC2CONbits.ON = 0; //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+4)(GP)
;Stepper.c,200 :: 		OC7IE_bit = 0;OC7CONbits.ON = 0; //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+4)(GP)
;Stepper.c,202 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0; //A
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,203 :: 		OC6IE_bit = 0;OC6CONbits.ON = 0; //B
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
SW	R3, Offset(OC6CONbits+4)(GP)
;Stepper.c,204 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0; //Z
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,205 :: 		}
L_end_disableOCx:
JR	RA
NOP	
; end of _disableOCx
Stepper_toggleOCx:
;Stepper.c,209 :: 		static void toggleOCx(int axis_No){
;Stepper.c,210 :: 		switch(axis_No){
J	L_Stepper_toggleOCx41
NOP	
;Stepper.c,211 :: 		case X:
L_Stepper_toggleOCx43:
;Stepper.c,212 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,213 :: 		OC5R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,214 :: 		OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
;Stepper.c,215 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,216 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,217 :: 		break;
J	L_Stepper_toggleOCx42
NOP	
;Stepper.c,218 :: 		case Y:
L_Stepper_toggleOCx44:
;Stepper.c,219 :: 		OC2IF_bit = 0;
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Stepper.c,220 :: 		OC2R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC2R+0)(GP)
;Stepper.c,221 :: 		OC2RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+88)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC2RS+0)(GP)
;Stepper.c,222 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,223 :: 		OC2CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC2CON+0)(GP)
;Stepper.c,224 :: 		break;
J	L_Stepper_toggleOCx42
NOP	
;Stepper.c,225 :: 		case Z:
L_Stepper_toggleOCx45:
;Stepper.c,226 :: 		OC7R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC7R+0)(GP)
;Stepper.c,227 :: 		OC7RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+168)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC7RS+0)(GP)
;Stepper.c,228 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,229 :: 		OC7CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC7CON+0)(GP)
;Stepper.c,230 :: 		break;
J	L_Stepper_toggleOCx42
NOP	
;Stepper.c,231 :: 		case A:
L_Stepper_toggleOCx46:
;Stepper.c,232 :: 		OC3R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,233 :: 		OC3RS  = STPS[A].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+248)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,234 :: 		TMR5   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR5+0)(GP)
;Stepper.c,235 :: 		OC3CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,236 :: 		break;
J	L_Stepper_toggleOCx42
NOP	
;Stepper.c,237 :: 		case B:
L_Stepper_toggleOCx47:
;Stepper.c,238 :: 		OC6R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC6R+0)(GP)
;Stepper.c,239 :: 		OC6RS  = STPS[B].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+328)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC6RS+0)(GP)
;Stepper.c,240 :: 		TMR3   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR3+0)(GP)
;Stepper.c,241 :: 		OC6CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC6CON+0)(GP)
;Stepper.c,242 :: 		break;
J	L_Stepper_toggleOCx42
NOP	
;Stepper.c,243 :: 		case C:
L_Stepper_toggleOCx48:
;Stepper.c,244 :: 		OC8R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,245 :: 		OC8RS  = STPS[C].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+408)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,246 :: 		TMR7   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR7+0)(GP)
;Stepper.c,247 :: 		OC8CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC8CON+0)(GP)
;Stepper.c,248 :: 		break;
J	L_Stepper_toggleOCx42
NOP	
;Stepper.c,249 :: 		default:
L_Stepper_toggleOCx49:
;Stepper.c,250 :: 		break;
J	L_Stepper_toggleOCx42
NOP	
;Stepper.c,251 :: 		}
L_Stepper_toggleOCx41:
SEH	R2, R25
BNE	R2, R0, L_Stepper_toggleOCx178
NOP	
J	L_Stepper_toggleOCx43
NOP	
L_Stepper_toggleOCx178:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_Stepper_toggleOCx180
NOP	
J	L_Stepper_toggleOCx44
NOP	
L_Stepper_toggleOCx180:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Stepper_toggleOCx182
NOP	
J	L_Stepper_toggleOCx45
NOP	
L_Stepper_toggleOCx182:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_Stepper_toggleOCx184
NOP	
J	L_Stepper_toggleOCx46
NOP	
L_Stepper_toggleOCx184:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Stepper_toggleOCx186
NOP	
J	L_Stepper_toggleOCx47
NOP	
L_Stepper_toggleOCx186:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_Stepper_toggleOCx188
NOP	
J	L_Stepper_toggleOCx48
NOP	
L_Stepper_toggleOCx188:
J	L_Stepper_toggleOCx49
NOP	
L_Stepper_toggleOCx42:
;Stepper.c,253 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of Stepper_toggleOCx
_Step_Cycle:
;Stepper.c,260 :: 		void Step_Cycle(int axis_No){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,261 :: 		toggleOCx(axis_No);
JAL	Stepper_toggleOCx+0
NOP	
;Stepper.c,263 :: 		STPS[axis_No].step_count++;
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
;Stepper.c,265 :: 		STPS[axis_No].steps_abs_position += STPS[axis_No].axis_dir;
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
;Stepper.c,267 :: 		}
L_end_Step_Cycle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Step_Cycle
Stepper_Pulse:
;Stepper.c,270 :: 		static int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,272 :: 		switch(STPS[axis_No].run_state) {
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
;Stepper.c,273 :: 		case STOP:
L_Stepper_Pulse52:
;Stepper.c,274 :: 		STPS[axis_No].run_state  = STOP;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,275 :: 		StopAxis(axis_No);
JAL	_StopAxis+0
NOP	
;Stepper.c,276 :: 		bit_true(SV.mode_complete,bit(axis_No));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R3, R2, R3
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 6, 2
OR	R2, R2, R3
ANDI	R3, R2, 255
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R3, 6, 2
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,277 :: 		break;
J	L_Stepper_Pulse51
NOP	
;Stepper.c,278 :: 		case ACCEL:
L_Stepper_Pulse53:
;Stepper.c,280 :: 		AccDec(axis_No);
JAL	Stepper_AccDec+0
NOP	
;Stepper.c,281 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
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
BEQ	R2, R0, L_Stepper_Pulse191
NOP	
J	L_Stepper_Pulse54
NOP	
L_Stepper_Pulse191:
;Stepper.c,282 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,284 :: 		}
L_Stepper_Pulse54:
;Stepper.c,285 :: 		if(STPS[axis_No].step_count > STPS[axis_No].max_step_lim){
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
BNE	R2, R0, L_Stepper_Pulse192
NOP	
J	L_Stepper_Pulse55
NOP	
L_Stepper_Pulse192:
;Stepper.c,286 :: 		STPS[axis_No].run_state  = RUN;
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
;Stepper.c,287 :: 		}
L_Stepper_Pulse55:
;Stepper.c,290 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
J	L_Stepper_Pulse56
NOP	
L_Stepper_Pulse193:
;Stepper.c,291 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
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
;Stepper.c,292 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 60
SW	R0, 0(R2)
;Stepper.c,293 :: 		STPS[axis_No].run_state   = DECEL;
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
;Stepper.c,294 :: 		}
L_Stepper_Pulse56:
;Stepper.c,295 :: 		break;
J	L_Stepper_Pulse51
NOP	
;Stepper.c,296 :: 		case RUN:
L_Stepper_Pulse57:
;Stepper.c,297 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,300 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
BEQ	R2, R0, L_Stepper_Pulse194
NOP	
J	L_Stepper_Pulse58
NOP	
L_Stepper_Pulse194:
;Stepper.c,301 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
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
;Stepper.c,302 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 60
SW	R0, 0(R2)
;Stepper.c,303 :: 		STPS[axis_No].run_state =  DECEL;
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
;Stepper.c,304 :: 		}
L_Stepper_Pulse58:
;Stepper.c,305 :: 		break;
J	L_Stepper_Pulse51
NOP	
;Stepper.c,306 :: 		case DECEL:
L_Stepper_Pulse59:
;Stepper.c,308 :: 		AccDec(axis_No);
JAL	Stepper_AccDec+0
NOP	
;Stepper.c,310 :: 		if(STPS[axis_No].accel_count >= -1 ){
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
BEQ	R2, R0, L_Stepper_Pulse195
NOP	
J	L_Stepper_Pulse60
NOP	
L_Stepper_Pulse195:
;Stepper.c,311 :: 		STPS[axis_No].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,312 :: 		}
L_Stepper_Pulse60:
;Stepper.c,313 :: 		break;
J	L_Stepper_Pulse51
NOP	
;Stepper.c,314 :: 		default:break;
L_Stepper_Pulse61:
J	L_Stepper_Pulse51
NOP	
;Stepper.c,315 :: 		}
L_Stepper_Pulse50:
LW	R4, 4(SP)
LH	R2, 0(R4)
SEH	R2, R2
BNE	R2, R0, L_Stepper_Pulse197
NOP	
J	L_Stepper_Pulse52
NOP	
L_Stepper_Pulse197:
LH	R2, 0(R4)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L_Stepper_Pulse199
NOP	
J	L_Stepper_Pulse53
NOP	
L_Stepper_Pulse199:
LH	R2, 0(R4)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L_Stepper_Pulse201
NOP	
J	L_Stepper_Pulse57
NOP	
L_Stepper_Pulse201:
LH	R2, 0(R4)
SEH	R3, R2
ORI	R2, R0, 2
BNE	R3, R2, L_Stepper_Pulse203
NOP	
J	L_Stepper_Pulse59
NOP	
L_Stepper_Pulse203:
J	L_Stepper_Pulse61
NOP	
L_Stepper_Pulse51:
;Stepper.c,316 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,317 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Stepper_Pulse
Stepper_AccDec:
;Stepper.c,321 :: 		static void AccDec(int axis_No){
;Stepper.c,322 :: 		STPS[axis_No].accel_count++;
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
;Stepper.c,323 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
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
;Stepper.c,324 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
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
;Stepper.c,325 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
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
;Stepper.c,326 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of Stepper_AccDec
_StepX:
;Stepper.c,334 :: 		void StepX() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_SRS {
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
;Stepper.c,335 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,337 :: 		if(SV.Single_Dual == 0){
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 5, 1
BEQ	R2, R0, L__StepX206
NOP	
J	L_StepX62
NOP	
L__StepX206:
;Stepper.c,338 :: 		SingleStepAxis(X);
MOVZ	R25, R0, R0
JAL	Stepper_SingleStepAxis+0
NOP	
;Stepper.c,339 :: 		}else{
J	L_StepX63
NOP	
L_StepX62:
;Stepper.c,340 :: 		if(STPS[X].master = 1){
LBU	R2, Offset(_STPS+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_STPS+0)(GP)
LBU	R2, Offset(_STPS+0)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__StepX208
NOP	
J	L_StepX64
NOP	
L__StepX208:
;Stepper.c,341 :: 		if(axis_xyz == xy)
LBU	R2, Offset(_axis_xyz+0)(GP)
BEQ	R2, R0, L__StepX209
NOP	
J	L_StepX65
NOP	
L__StepX209:
;Stepper.c,342 :: 		Axis_Interpolate(X,Y);
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepX66
NOP	
L_StepX65:
;Stepper.c,343 :: 		else if(axis_xyz == xz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__StepX210
NOP	
J	L_StepX67
NOP	
L__StepX210:
;Stepper.c,344 :: 		Axis_Interpolate(X,Z);
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepX68
NOP	
L_StepX67:
;Stepper.c,345 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepX211
NOP	
J	L_StepX69
NOP	
L__StepX211:
;Stepper.c,346 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	Stepper_Axis_Interpolate+0
NOP	
L_StepX69:
L_StepX68:
L_StepX66:
;Stepper.c,347 :: 		}
L_StepX64:
;Stepper.c,348 :: 		}
L_StepX63:
;Stepper.c,349 :: 		}
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
;Stepper.c,353 :: 		void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_SRS {
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
;Stepper.c,354 :: 		OC2IF_bit = 0;
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Stepper.c,356 :: 		if(SV.Single_Dual == 0){
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 5, 1
BEQ	R2, R0, L__StepY213
NOP	
J	L_StepY70
NOP	
L__StepY213:
;Stepper.c,357 :: 		SingleStepAxis(Y);
ORI	R25, R0, 1
JAL	Stepper_SingleStepAxis+0
NOP	
;Stepper.c,358 :: 		}else {
J	L_StepY71
NOP	
L_StepY70:
;Stepper.c,359 :: 		if(STPS[Y].master = 1){
LBU	R2, Offset(_STPS+80)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_STPS+80)(GP)
LBU	R2, Offset(_STPS+80)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__StepY215
NOP	
J	L_StepY72
NOP	
L__StepY215:
;Stepper.c,360 :: 		if(axis_xyz == xy )
LBU	R2, Offset(_axis_xyz+0)(GP)
BEQ	R2, R0, L__StepY216
NOP	
J	L_StepY73
NOP	
L__StepY216:
;Stepper.c,361 :: 		Axis_Interpolate(X,Y);
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepY74
NOP	
L_StepY73:
;Stepper.c,362 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepY217
NOP	
J	L_StepY75
NOP	
L__StepY217:
;Stepper.c,363 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepY76
NOP	
L_StepY75:
;Stepper.c,364 :: 		else if(axis_xyz == ya)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__StepY218
NOP	
J	L_StepY77
NOP	
L__StepY218:
;Stepper.c,365 :: 		Axis_Interpolate(Y,A);
ORI	R26, R0, 3
ORI	R25, R0, 1
JAL	Stepper_Axis_Interpolate+0
NOP	
L_StepY77:
L_StepY76:
L_StepY74:
;Stepper.c,366 :: 		}
L_StepY72:
;Stepper.c,367 :: 		}
L_StepY71:
;Stepper.c,368 :: 		}
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
;Stepper.c,371 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_SRS {
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
;Stepper.c,372 :: 		OC7IF_bit = 0;
LUI	R2, BitMask(OC7IF_bit+0)
ORI	R2, R2, BitMask(OC7IF_bit+0)
_SX	
;Stepper.c,374 :: 		if(SV.Single_Dual == 0){
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 5, 1
BEQ	R2, R0, L__StepZ220
NOP	
J	L_StepZ78
NOP	
L__StepZ220:
;Stepper.c,375 :: 		SingleStepAxis(Z);
ORI	R25, R0, 2
JAL	Stepper_SingleStepAxis+0
NOP	
;Stepper.c,376 :: 		}else{
J	L_StepZ79
NOP	
L_StepZ78:
;Stepper.c,377 :: 		if(STPS[Z].master = 1){
LBU	R2, Offset(_STPS+160)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_STPS+160)(GP)
LBU	R2, Offset(_STPS+160)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__StepZ222
NOP	
J	L_StepZ80
NOP	
L__StepZ222:
;Stepper.c,378 :: 		if(axis_xyz == xz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__StepZ223
NOP	
J	L_StepZ81
NOP	
L__StepZ223:
;Stepper.c,379 :: 		Axis_Interpolate(X,Z);
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepZ82
NOP	
L_StepZ81:
;Stepper.c,380 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepZ224
NOP	
J	L_StepZ83
NOP	
L__StepZ224:
;Stepper.c,381 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepZ84
NOP	
L_StepZ83:
;Stepper.c,382 :: 		else if(axis_xyz == za)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__StepZ225
NOP	
J	L_StepZ85
NOP	
L__StepZ225:
;Stepper.c,383 :: 		Axis_Interpolate(Z,A);
ORI	R26, R0, 3
ORI	R25, R0, 2
JAL	Stepper_Axis_Interpolate+0
NOP	
L_StepZ85:
L_StepZ84:
L_StepZ82:
;Stepper.c,385 :: 		}
L_StepZ80:
;Stepper.c,386 :: 		}
L_StepZ79:
;Stepper.c,388 :: 		}
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
;Stepper.c,391 :: 		void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_SRS {
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
;Stepper.c,392 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,394 :: 		if(SV.Single_Dual == 0){
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 5, 1
BEQ	R2, R0, L__StepA227
NOP	
J	L_StepA86
NOP	
L__StepA227:
;Stepper.c,395 :: 		SingleStepAxis(A);
ORI	R25, R0, 3
JAL	Stepper_SingleStepAxis+0
NOP	
;Stepper.c,396 :: 		}else{
J	L_StepA87
NOP	
L_StepA86:
;Stepper.c,397 :: 		if(STPS[A].master = 1){
LBU	R2, Offset(_STPS+240)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_STPS+240)(GP)
LBU	R2, Offset(_STPS+240)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__StepA229
NOP	
J	L_StepA88
NOP	
L__StepA229:
;Stepper.c,398 :: 		if(axis_xyz == xa)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__StepA230
NOP	
J	L_StepA89
NOP	
L__StepA230:
;Stepper.c,399 :: 		Axis_Interpolate(X,A);
ORI	R26, R0, 3
MOVZ	R25, R0, R0
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepA90
NOP	
L_StepA89:
;Stepper.c,400 :: 		else if(axis_xyz == ya)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__StepA231
NOP	
J	L_StepA91
NOP	
L__StepA231:
;Stepper.c,401 :: 		Axis_Interpolate(Y,A);
ORI	R26, R0, 3
ORI	R25, R0, 1
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepA92
NOP	
L_StepA91:
;Stepper.c,402 :: 		else if(axis_xyz == za)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__StepA232
NOP	
J	L_StepA93
NOP	
L__StepA232:
;Stepper.c,403 :: 		Axis_Interpolate(Z,A);
ORI	R26, R0, 3
ORI	R25, R0, 2
JAL	Stepper_Axis_Interpolate+0
NOP	
L_StepA93:
L_StepA92:
L_StepA90:
;Stepper.c,404 :: 		}
L_StepA88:
;Stepper.c,405 :: 		}
L_StepA87:
;Stepper.c,406 :: 		}
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
;Stepper.c,413 :: 		static void SingleStepAxis(int axis){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,414 :: 		if(bit_istrue(SV.mode_complete,axis))return;
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 6, 2
ANDI	R2, R2, 255
AND	R2, R2, R25
SEH	R2, R2
BNE	R2, R0, L_Stepper_SingleStepAxis235
NOP	
J	L_Stepper_SingleStepAxis94
NOP	
L_Stepper_SingleStepAxis235:
J	L_end_SingleStepAxis
NOP	
L_Stepper_SingleStepAxis94:
;Stepper.c,415 :: 		Step_Cycle(axis);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,416 :: 		Pulse(axis);
JAL	Stepper_Pulse+0
NOP	
;Stepper.c,417 :: 		}
L_end_SingleStepAxis:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Stepper_SingleStepAxis
_Start_Interpolation:
;Stepper.c,424 :: 		void Start_Interpolation(int axisA,int axisB){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,425 :: 		Axis_Interpolate(axisA,axisB);
JAL	Stepper_Axis_Interpolate+0
NOP	
;Stepper.c,426 :: 		}
L_end_Start_Interpolation:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Start_Interpolation
Stepper_Axis_Interpolate:
;Stepper.c,428 :: 		static void Axis_Interpolate(int axisA,int axisB){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,431 :: 		cnt++;
LH	R2, Offset(Stepper_Axis_Interpolate_cnt_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Stepper_Axis_Interpolate_cnt_L0+0)(GP)
;Stepper.c,432 :: 		if(cnt > 5){
SEH	R2, R2
SLTI	R2, R2, 6
BEQ	R2, R0, L_Stepper_Axis_Interpolate238
NOP	
J	L_Stepper_Axis_Interpolate95
NOP	
L_Stepper_Axis_Interpolate238:
;Stepper.c,433 :: 		LED2=!LED2;
_LX	
EXT	R2, R2, BitPos(LED2+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Stepper.c,434 :: 		cnt = 0;
SH	R0, Offset(Stepper_Axis_Interpolate_cnt_L0+0)(GP)
;Stepper.c,435 :: 		}
L_Stepper_Axis_Interpolate95:
;Stepper.c,437 :: 		if(SV.dA >= SV.dB){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L_Stepper_Axis_Interpolate239
NOP	
J	L_Stepper_Axis_Interpolate96
NOP	
L_Stepper_Axis_Interpolate239:
;Stepper.c,441 :: 		if(STPS[axisA].step_count < STPS[axisA].dist)
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
BNE	R2, R0, L_Stepper_Axis_Interpolate240
NOP	
J	L_Stepper_Axis_Interpolate97
NOP	
L_Stepper_Axis_Interpolate240:
;Stepper.c,442 :: 		Step_Cycle(axisA);
JAL	_Step_Cycle+0
NOP	
J	L_Stepper_Axis_Interpolate98
NOP	
L_Stepper_Axis_Interpolate97:
;Stepper.c,444 :: 		if(SV.cir)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L_Stepper_Axis_Interpolate242
NOP	
J	L_Stepper_Axis_Interpolate99
NOP	
L_Stepper_Axis_Interpolate242:
;Stepper.c,445 :: 		StopAxis(axisA);
JAL	_StopAxis+0
NOP	
L_Stepper_Axis_Interpolate99:
;Stepper.c,446 :: 		}
L_Stepper_Axis_Interpolate98:
;Stepper.c,448 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L_Stepper_Axis_Interpolate243
NOP	
J	L_Stepper_Axis_Interpolate100
NOP	
L_Stepper_Axis_Interpolate243:
;Stepper.c,449 :: 		Pulse(axisA);
JAL	Stepper_Pulse+0
NOP	
L_Stepper_Axis_Interpolate100:
;Stepper.c,451 :: 		if(SV.dif < 0){
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L_Stepper_Axis_Interpolate244
NOP	
J	L_Stepper_Axis_Interpolate101
NOP	
L_Stepper_Axis_Interpolate244:
;Stepper.c,452 :: 		SV.dif += BresIncVal(SV.dB);//2*SV.dy;//
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+16)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,453 :: 		}else{
J	L_Stepper_Axis_Interpolate102
NOP	
L_Stepper_Axis_Interpolate101:
;Stepper.c,454 :: 		Step_Cycle(axisB);
SH	R25, 4(SP)
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
LH	R25, 4(SP)
;Stepper.c,455 :: 		SV.dif += BresDiffVal(SV.dB,SV.dA);//2 * (SV.dy - SV.dx);//
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+16)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,456 :: 		}
L_Stepper_Axis_Interpolate102:
;Stepper.c,459 :: 		if(STPS[axisA].run_state == STOP | STPS[axisA].step_count >= STPS[axisA].dist){
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
BNE	R2, R0, L_Stepper_Axis_Interpolate248
NOP	
J	L_Stepper_Axis_Interpolate103
NOP	
L_Stepper_Axis_Interpolate248:
;Stepper.c,460 :: 		StopAxis(axisB);
SH	R25, 4(SP)
SEH	R25, R26
JAL	_StopAxis+0
NOP	
LH	R25, 4(SP)
;Stepper.c,461 :: 		STPS[axisA].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,462 :: 		STPS[axisB].run_state = STOP;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,463 :: 		}
L_Stepper_Axis_Interpolate103:
;Stepper.c,465 :: 		}else{
J	L_Stepper_Axis_Interpolate104
NOP	
L_Stepper_Axis_Interpolate96:
;Stepper.c,469 :: 		if(STPS[axisB].step_count < STPS[axisB].dist)
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
BNE	R2, R0, L_Stepper_Axis_Interpolate249
NOP	
J	L_Stepper_Axis_Interpolate105
NOP	
L_Stepper_Axis_Interpolate249:
;Stepper.c,470 :: 		Step_Cycle(axisB);
SH	R25, 4(SP)
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
LH	R25, 4(SP)
J	L_Stepper_Axis_Interpolate106
NOP	
L_Stepper_Axis_Interpolate105:
;Stepper.c,472 :: 		if(SV.cir)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L_Stepper_Axis_Interpolate251
NOP	
J	L_Stepper_Axis_Interpolate107
NOP	
L_Stepper_Axis_Interpolate251:
;Stepper.c,473 :: 		StopAxis(axisB);
SH	R25, 4(SP)
SEH	R25, R26
JAL	_StopAxis+0
NOP	
LH	R25, 4(SP)
L_Stepper_Axis_Interpolate107:
;Stepper.c,474 :: 		}
L_Stepper_Axis_Interpolate106:
;Stepper.c,476 :: 		if(!SV.cir)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 4, 1
BEQ	R2, R0, L_Stepper_Axis_Interpolate252
NOP	
J	L_Stepper_Axis_Interpolate108
NOP	
L_Stepper_Axis_Interpolate252:
;Stepper.c,477 :: 		Pulse(axisB);
SH	R25, 4(SP)
SEH	R25, R26
JAL	Stepper_Pulse+0
NOP	
LH	R25, 4(SP)
L_Stepper_Axis_Interpolate108:
;Stepper.c,480 :: 		if(SV.dif < 0){
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L_Stepper_Axis_Interpolate253
NOP	
J	L_Stepper_Axis_Interpolate109
NOP	
L_Stepper_Axis_Interpolate253:
;Stepper.c,481 :: 		SV.dif += BresIncVal(SV.dA);//2 * SV.dx;//
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+16)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,482 :: 		}else{
J	L_Stepper_Axis_Interpolate110
NOP	
L_Stepper_Axis_Interpolate109:
;Stepper.c,483 :: 		Step_Cycle(axisA);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,484 :: 		SV.dif += BresDiffVal(SV.dA,SV.dB);//2 * (SV.dx - SV.dy);//
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+16)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,485 :: 		}
L_Stepper_Axis_Interpolate110:
;Stepper.c,487 :: 		if(STPS[axisB].run_state == STOP | STPS[axisB].step_count >= STPS[axisB].dist){
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
BNE	R2, R0, L_Stepper_Axis_Interpolate257
NOP	
J	L_Stepper_Axis_Interpolate111
NOP	
L_Stepper_Axis_Interpolate257:
;Stepper.c,488 :: 		StopAxis(axisA);
JAL	_StopAxis+0
NOP	
;Stepper.c,489 :: 		STPS[axisA].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,490 :: 		STPS[axisB].run_state = STOP;
SEH	R3, R26
ORI	R2, R0, 80
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,491 :: 		}
L_Stepper_Axis_Interpolate111:
;Stepper.c,492 :: 		}
L_Stepper_Axis_Interpolate104:
;Stepper.c,493 :: 		}
L_end_Axis_Interpolate:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Stepper_Axis_Interpolate
