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
BNE	R2, R0, L__EnableSteppers130
NOP	
J	L_EnableSteppers1
NOP	
L__EnableSteppers130:
;Stepper.c,76 :: 		if(i==0) EN_StepX       = 0;
SEH	R2, R4
BEQ	R2, R0, L__EnableSteppers131
NOP	
J	L_EnableSteppers3
NOP	
L__EnableSteppers131:
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
L_EnableSteppers3:
;Stepper.c,77 :: 		if(i==1) EN_StepY       = 0;
SEH	R3, R4
ORI	R2, R0, 1
BEQ	R3, R2, L__EnableSteppers132
NOP	
J	L_EnableSteppers4
NOP	
L__EnableSteppers132:
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
L_EnableSteppers4:
;Stepper.c,78 :: 		if(i==2) EN_StepZ       = 0;
SEH	R3, R4
ORI	R2, R0, 2
BEQ	R3, R2, L__EnableSteppers133
NOP	
J	L_EnableSteppers5
NOP	
L__EnableSteppers133:
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
L_EnableSteppers5:
;Stepper.c,79 :: 		if(i==3) EN_StepA       = 0;
SEH	R3, R4
ORI	R2, R0, 3
BEQ	R3, R2, L__EnableSteppers134
NOP	
J	L_EnableSteppers6
NOP	
L__EnableSteppers134:
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
BNE	R2, R0, L__EnableStepper137
NOP	
J	L_EnableStepper9
NOP	
L__EnableStepper137:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__EnableStepper139
NOP	
J	L_EnableStepper10
NOP	
L__EnableStepper139:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__EnableStepper141
NOP	
J	L_EnableStepper11
NOP	
L__EnableStepper141:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__EnableStepper143
NOP	
J	L_EnableStepper12
NOP	
L__EnableStepper143:
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
BNE	R2, R0, L__DisableStepperInterrupt147
NOP	
J	L_DisableStepperInterrupt15
NOP	
L__DisableStepperInterrupt147:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__DisableStepperInterrupt149
NOP	
J	L_DisableStepperInterrupt16
NOP	
L__DisableStepperInterrupt149:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__DisableStepperInterrupt151
NOP	
J	L_DisableStepperInterrupt17
NOP	
L__DisableStepperInterrupt151:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__DisableStepperInterrupt153
NOP	
J	L_DisableStepperInterrupt18
NOP	
L__DisableStepperInterrupt153:
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
ORI	R2, R0, 68
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
BNE	R2, R0, L__Get_AxisStatus157
NOP	
J	L_Get_AxisStatus21
NOP	
L__Get_AxisStatus157:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Get_AxisStatus159
NOP	
J	L_Get_AxisStatus22
NOP	
L__Get_AxisStatus159:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Get_AxisStatus161
NOP	
J	L_Get_AxisStatus23
NOP	
L__Get_AxisStatus161:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Get_AxisStatus163
NOP	
J	L_Get_AxisStatus24
NOP	
L__Get_AxisStatus163:
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
;Stepper.c,136 :: 		temp  = OC3IE_bit << 3;
_LX	
EXT	R2, R2, BitPos(OC3IE_bit+0), 1
ANDI	R2, R2, 255
SLL	R3, R2, 3
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
_Get_Axis_Run_States:
;Stepper.c,143 :: 		int Get_Axis_Run_States(){
;Stepper.c,144 :: 		int i,temp = 0;
; temp start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,145 :: 		for(i=0;i<NoOfAxis;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; temp end address is: 20 (R5)
; i end address is: 16 (R4)
L_Get_Axis_Run_States25:
; i start address is: 16 (R4)
; temp start address is: 20 (R5)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L__Get_Axis_Run_States166
NOP	
J	L_Get_Axis_Run_States26
NOP	
L__Get_Axis_Run_States166:
;Stepper.c,146 :: 		temp |= STPS[i].run_state;
SEH	R3, R4
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LH	R2, 0(R2)
OR	R2, R5, R2
; temp end address is: 20 (R5)
;Stepper.c,147 :: 		temp = (temp<< i);
SEH	R3, R2
SEH	R2, R4
SLLV	R2, R3, R2
; temp start address is: 20 (R5)
SEH	R5, R2
;Stepper.c,145 :: 		for(i=0;i<NoOfAxis;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,148 :: 		}
; i end address is: 16 (R4)
J	L_Get_Axis_Run_States25
NOP	
L_Get_Axis_Run_States26:
;Stepper.c,149 :: 		return temp;
SEH	R2, R5
; temp end address is: 20 (R5)
;Stepper.c,150 :: 		}
L_end_Get_Axis_Run_States:
JR	RA
NOP	
; end of _Get_Axis_Run_States
_Single_Axis_Enable:
;Stepper.c,155 :: 		void Single_Axis_Enable(_axis_ axis_){
;Stepper.c,157 :: 		axis_running =0;
SH	R0, Offset(Stepper_axis_running+0)(GP)
;Stepper.c,159 :: 		switch(axis_){
J	L_Single_Axis_Enable28
NOP	
;Stepper.c,160 :: 		case X:
L_Single_Axis_Enable30:
;Stepper.c,161 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+8)(GP)
;Stepper.c,162 :: 		break;
J	L_Single_Axis_Enable29
NOP	
;Stepper.c,163 :: 		case Y:
L_Single_Axis_Enable31:
;Stepper.c,164 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+8)(GP)
;Stepper.c,165 :: 		break;
J	L_Single_Axis_Enable29
NOP	
;Stepper.c,166 :: 		case Z:
L_Single_Axis_Enable32:
;Stepper.c,167 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+8)(GP)
;Stepper.c,168 :: 		break;
J	L_Single_Axis_Enable29
NOP	
;Stepper.c,169 :: 		case A:
L_Single_Axis_Enable33:
;Stepper.c,170 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+8)(GP)
;Stepper.c,171 :: 		break;
J	L_Single_Axis_Enable29
NOP	
;Stepper.c,172 :: 		case B:
L_Single_Axis_Enable34:
;Stepper.c,173 :: 		OC6IE_bit = 1;OC6CONbits.ON = 1;
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC6CONbits+8)(GP)
;Stepper.c,174 :: 		break;
J	L_Single_Axis_Enable29
NOP	
;Stepper.c,175 :: 		case C:
L_Single_Axis_Enable35:
;Stepper.c,176 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+8)(GP)
;Stepper.c,177 :: 		break;
J	L_Single_Axis_Enable29
NOP	
;Stepper.c,178 :: 		default:
L_Single_Axis_Enable36:
;Stepper.c,179 :: 		break;
J	L_Single_Axis_Enable29
NOP	
;Stepper.c,180 :: 		}
L_Single_Axis_Enable28:
ANDI	R2, R25, 255
BNE	R2, R0, L__Single_Axis_Enable169
NOP	
J	L_Single_Axis_Enable30
NOP	
L__Single_Axis_Enable169:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Single_Axis_Enable171
NOP	
J	L_Single_Axis_Enable31
NOP	
L__Single_Axis_Enable171:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Single_Axis_Enable173
NOP	
J	L_Single_Axis_Enable32
NOP	
L__Single_Axis_Enable173:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Single_Axis_Enable175
NOP	
J	L_Single_Axis_Enable33
NOP	
L__Single_Axis_Enable175:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Single_Axis_Enable177
NOP	
J	L_Single_Axis_Enable34
NOP	
L__Single_Axis_Enable177:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Single_Axis_Enable179
NOP	
J	L_Single_Axis_Enable35
NOP	
L__Single_Axis_Enable179:
J	L_Single_Axis_Enable36
NOP	
L_Single_Axis_Enable29:
;Stepper.c,181 :: 		}
L_end_Single_Axis_Enable:
JR	RA
NOP	
; end of _Single_Axis_Enable
_StopAxis:
;Stepper.c,183 :: 		void StopAxis(int axis){
;Stepper.c,185 :: 		switch(axis){
J	L_StopAxis37
NOP	
;Stepper.c,186 :: 		case X:
L_StopAxis39:
;Stepper.c,187 :: 		OC5IE_bit = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
;Stepper.c,188 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+4)(GP)
;Stepper.c,190 :: 		break;
J	L_StopAxis38
NOP	
;Stepper.c,191 :: 		case Y:
L_StopAxis40:
;Stepper.c,192 :: 		OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
;Stepper.c,193 :: 		OC2CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+4)(GP)
;Stepper.c,194 :: 		break;
J	L_StopAxis38
NOP	
;Stepper.c,195 :: 		case Z:
L_StopAxis41:
;Stepper.c,196 :: 		OC7IE_bit = 0;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
;Stepper.c,197 :: 		OC7CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+4)(GP)
;Stepper.c,198 :: 		break;
J	L_StopAxis38
NOP	
;Stepper.c,199 :: 		case A:
L_StopAxis42:
;Stepper.c,200 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,201 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,202 :: 		break;
J	L_StopAxis38
NOP	
;Stepper.c,203 :: 		default : break;
L_StopAxis43:
J	L_StopAxis38
NOP	
;Stepper.c,204 :: 		}
L_StopAxis37:
SEH	R2, R25
BNE	R2, R0, L__StopAxis182
NOP	
J	L_StopAxis39
NOP	
L__StopAxis182:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__StopAxis184
NOP	
J	L_StopAxis40
NOP	
L__StopAxis184:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__StopAxis186
NOP	
J	L_StopAxis41
NOP	
L__StopAxis186:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__StopAxis188
NOP	
J	L_StopAxis42
NOP	
L__StopAxis188:
J	L_StopAxis43
NOP	
L_StopAxis38:
;Stepper.c,205 :: 		STPS[axis].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,207 :: 		bit_false(SV.mode_complete,bit(axis));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LH	R2, Offset(_SV+2)(GP)
AND	R2, R2, R3
SH	R2, Offset(_SV+2)(GP)
;Stepper.c,208 :: 		}
L_end_StopAxis:
JR	RA
NOP	
; end of _StopAxis
_disableOCx:
;Stepper.c,211 :: 		void disableOCx(){
;Stepper.c,212 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0; //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,213 :: 		OC2IE_bit = 0;OC2CONbits.ON = 0; //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+4)(GP)
;Stepper.c,214 :: 		OC7IE_bit = 0;OC7CONbits.ON = 0; //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+4)(GP)
;Stepper.c,216 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0; //A
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,217 :: 		OC6IE_bit = 0;OC6CONbits.ON = 0; //B
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
SW	R3, Offset(OC6CONbits+4)(GP)
;Stepper.c,218 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0; //Z
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,219 :: 		}
L_end_disableOCx:
JR	RA
NOP	
; end of _disableOCx
Stepper_toggleOCx:
;Stepper.c,223 :: 		static void toggleOCx(int axis_No){
;Stepper.c,224 :: 		switch(axis_No){
J	L_Stepper_toggleOCx44
NOP	
;Stepper.c,225 :: 		case X:
L_Stepper_toggleOCx46:
;Stepper.c,226 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,227 :: 		OC5R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,228 :: 		OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
;Stepper.c,229 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,230 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,231 :: 		break;
J	L_Stepper_toggleOCx45
NOP	
;Stepper.c,232 :: 		case Y:
L_Stepper_toggleOCx47:
;Stepper.c,233 :: 		OC2IF_bit = 0;
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Stepper.c,234 :: 		OC2R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC2R+0)(GP)
;Stepper.c,235 :: 		OC2RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+76)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC2RS+0)(GP)
;Stepper.c,236 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,237 :: 		OC2CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC2CON+0)(GP)
;Stepper.c,238 :: 		break;
J	L_Stepper_toggleOCx45
NOP	
;Stepper.c,239 :: 		case Z:
L_Stepper_toggleOCx48:
;Stepper.c,240 :: 		OC7R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC7R+0)(GP)
;Stepper.c,241 :: 		OC7RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+144)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC7RS+0)(GP)
;Stepper.c,242 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,243 :: 		OC7CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC7CON+0)(GP)
;Stepper.c,244 :: 		break;
J	L_Stepper_toggleOCx45
NOP	
;Stepper.c,245 :: 		case A:
L_Stepper_toggleOCx49:
;Stepper.c,246 :: 		OC3R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,247 :: 		OC3RS  = STPS[A].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+212)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,248 :: 		TMR5   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR5+0)(GP)
;Stepper.c,249 :: 		OC3CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,250 :: 		break;
J	L_Stepper_toggleOCx45
NOP	
;Stepper.c,251 :: 		case B:
L_Stepper_toggleOCx50:
;Stepper.c,252 :: 		OC6R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC6R+0)(GP)
;Stepper.c,253 :: 		OC6RS  = STPS[B].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+280)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC6RS+0)(GP)
;Stepper.c,254 :: 		TMR3   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR3+0)(GP)
;Stepper.c,255 :: 		OC6CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC6CON+0)(GP)
;Stepper.c,256 :: 		break;
J	L_Stepper_toggleOCx45
NOP	
;Stepper.c,257 :: 		case C:
L_Stepper_toggleOCx51:
;Stepper.c,258 :: 		OC8R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,259 :: 		OC8RS  = STPS[C].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+348)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,260 :: 		TMR7   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR7+0)(GP)
;Stepper.c,261 :: 		OC8CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC8CON+0)(GP)
;Stepper.c,262 :: 		break;
J	L_Stepper_toggleOCx45
NOP	
;Stepper.c,263 :: 		default:
L_Stepper_toggleOCx52:
;Stepper.c,264 :: 		break;
J	L_Stepper_toggleOCx45
NOP	
;Stepper.c,265 :: 		}
L_Stepper_toggleOCx44:
SEH	R2, R25
BNE	R2, R0, L_Stepper_toggleOCx192
NOP	
J	L_Stepper_toggleOCx46
NOP	
L_Stepper_toggleOCx192:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L_Stepper_toggleOCx194
NOP	
J	L_Stepper_toggleOCx47
NOP	
L_Stepper_toggleOCx194:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L_Stepper_toggleOCx196
NOP	
J	L_Stepper_toggleOCx48
NOP	
L_Stepper_toggleOCx196:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L_Stepper_toggleOCx198
NOP	
J	L_Stepper_toggleOCx49
NOP	
L_Stepper_toggleOCx198:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L_Stepper_toggleOCx200
NOP	
J	L_Stepper_toggleOCx50
NOP	
L_Stepper_toggleOCx200:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L_Stepper_toggleOCx202
NOP	
J	L_Stepper_toggleOCx51
NOP	
L_Stepper_toggleOCx202:
J	L_Stepper_toggleOCx52
NOP	
L_Stepper_toggleOCx45:
;Stepper.c,267 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of Stepper_toggleOCx
_Step_Cycle:
;Stepper.c,274 :: 		void Step_Cycle(int axis_No){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,275 :: 		toggleOCx(axis_No);
JAL	Stepper_toggleOCx+0
NOP	
;Stepper.c,277 :: 		STPS[axis_No].step_count++;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 32
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,279 :: 		STPS[axis_No].steps_abs_position += STPS[axis_No].axis_dir;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 60
ADDIU	R2, R2, 2
LH	R2, 0(R2)
LW	R3, 0(R4)
SEH	R2, R2
ADDU	R2, R3, R2
SW	R2, 0(R4)
;Stepper.c,281 :: 		}
L_end_Step_Cycle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Step_Cycle
Stepper_Pulse:
;Stepper.c,284 :: 		static int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,286 :: 		switch(STPS[axis_No].run_state) {
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SW	R2, 4(SP)
J	L_Stepper_Pulse53
NOP	
;Stepper.c,287 :: 		case STOP:
L_Stepper_Pulse55:
;Stepper.c,289 :: 		StopAxis(axis_No);
JAL	_StopAxis+0
NOP	
;Stepper.c,292 :: 		bit_false(SV.mode_complete,bit(axis_No));
SEH	R3, R25
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LH	R2, Offset(_SV+2)(GP)
AND	R2, R2, R3
SH	R2, Offset(_SV+2)(GP)
;Stepper.c,293 :: 		break;
J	L_Stepper_Pulse54
NOP	
;Stepper.c,294 :: 		case ACCEL:
L_Stepper_Pulse56:
;Stepper.c,296 :: 		AccDec(axis_No);
JAL	Stepper_AccDec+0
NOP	
;Stepper.c,298 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
SEH	R3, R25
ORI	R2, R0, 68
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
BEQ	R2, R0, L_Stepper_Pulse205
NOP	
J	L_Stepper_Pulse57
NOP	
L_Stepper_Pulse205:
;Stepper.c,299 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,300 :: 		STPS[axis_No].run_state  = RUN;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 3
SH	R2, 0(R3)
;Stepper.c,301 :: 		}
L_Stepper_Pulse57:
;Stepper.c,303 :: 		if(STPS[axis_No].step_count > STPS[axis_No].max_step_lim){
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 32
LW	R3, 0(R2)
ADDIU	R2, R4, 48
LW	R2, 0(R2)
SLT	R2, R2, R3
BNE	R2, R0, L_Stepper_Pulse206
NOP	
J	L_Stepper_Pulse58
NOP	
L_Stepper_Pulse206:
;Stepper.c,304 :: 		STPS[axis_No].run_state  = RUN;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 3
SH	R2, 0(R3)
;Stepper.c,305 :: 		}
L_Stepper_Pulse58:
;Stepper.c,309 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 68
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
BEQ	R2, R0, L_Stepper_Pulse207
NOP	
J	L_Stepper_Pulse59
NOP	
L_Stepper_Pulse207:
;Stepper.c,310 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,311 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
SW	R0, 0(R2)
;Stepper.c,312 :: 		STPS[axis_No].run_state   = DECEL;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 2
SH	R2, 0(R3)
;Stepper.c,313 :: 		}
L_Stepper_Pulse59:
;Stepper.c,314 :: 		break;
J	L_Stepper_Pulse54
NOP	
;Stepper.c,315 :: 		case RUN:
L_Stepper_Pulse60:
;Stepper.c,316 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,319 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 68
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
BEQ	R2, R0, L_Stepper_Pulse208
NOP	
J	L_Stepper_Pulse61
NOP	
L_Stepper_Pulse208:
;Stepper.c,320 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,321 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
SW	R0, 0(R2)
;Stepper.c,322 :: 		STPS[axis_No].run_state =  DECEL;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 2
SH	R2, 0(R3)
;Stepper.c,323 :: 		}
J	L_Stepper_Pulse62
NOP	
L_Stepper_Pulse61:
;Stepper.c,324 :: 		else  if(STPS[axis_No].step_count >= STPS[axis_No].dist) {
SEH	R3, R25
ORI	R2, R0, 68
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
BEQ	R2, R0, L_Stepper_Pulse209
NOP	
J	L_Stepper_Pulse63
NOP	
L_Stepper_Pulse209:
;Stepper.c,325 :: 		STPS[axis_No].run_state =  STOP;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,326 :: 		}
L_Stepper_Pulse63:
L_Stepper_Pulse62:
;Stepper.c,327 :: 		break;
J	L_Stepper_Pulse54
NOP	
;Stepper.c,328 :: 		case DECEL:
L_Stepper_Pulse64:
;Stepper.c,330 :: 		AccDec(axis_No);
JAL	Stepper_AccDec+0
NOP	
;Stepper.c,332 :: 		if(STPS[axis_No].accel_count >= -1 || STPS[axis_No].step_count >= STPS[axis_No].dist ){
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
LW	R2, 0(R2)
SLTI	R2, R2, -1
BNE	R2, R0, L_Stepper_Pulse210
NOP	
J	L_Stepper_Pulse123
NOP	
L_Stepper_Pulse210:
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 32
ADDIU	R2, R2, 36
LW	R3, 0(R2)
LW	R2, 0(R4)
SLT	R2, R2, R3
BNE	R2, R0, L_Stepper_Pulse211
NOP	
J	L_Stepper_Pulse122
NOP	
L_Stepper_Pulse211:
J	L_Stepper_Pulse67
NOP	
L_Stepper_Pulse123:
L_Stepper_Pulse122:
;Stepper.c,333 :: 		STPS[axis_No].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
;Stepper.c,334 :: 		}
L_Stepper_Pulse67:
;Stepper.c,335 :: 		break;
J	L_Stepper_Pulse54
NOP	
;Stepper.c,336 :: 		default:break;
L_Stepper_Pulse68:
J	L_Stepper_Pulse54
NOP	
;Stepper.c,337 :: 		}
L_Stepper_Pulse53:
LW	R4, 4(SP)
LH	R2, 0(R4)
SEH	R2, R2
BNE	R2, R0, L_Stepper_Pulse213
NOP	
J	L_Stepper_Pulse55
NOP	
L_Stepper_Pulse213:
LH	R2, 0(R4)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L_Stepper_Pulse215
NOP	
J	L_Stepper_Pulse56
NOP	
L_Stepper_Pulse215:
LH	R2, 0(R4)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L_Stepper_Pulse217
NOP	
J	L_Stepper_Pulse60
NOP	
L_Stepper_Pulse217:
LH	R2, 0(R4)
SEH	R3, R2
ORI	R2, R0, 2
BNE	R3, R2, L_Stepper_Pulse219
NOP	
J	L_Stepper_Pulse64
NOP	
L_Stepper_Pulse219:
J	L_Stepper_Pulse68
NOP	
L_Stepper_Pulse54:
;Stepper.c,338 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,339 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Stepper_Pulse
Stepper_AccDec:
;Stepper.c,343 :: 		static void AccDec(int axis_No){
;Stepper.c,344 :: 		STPS[axis_No].accel_count++;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,345 :: 		STPS[axis_No].step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R6, R2, R3
ADDIU	R5, R6, 8
LW	R4, 0(R5)
SLL	R3, R4, 1
ADDIU	R2, R6, 52
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
;Stepper.c,346 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R5, R2, R3
ADDIU	R4, R5, 52
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
;Stepper.c,347 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of Stepper_AccDec
_StepX:
;Stepper.c,355 :: 		void StepX() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_SRS {
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
;Stepper.c,356 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,358 :: 		if(SV.Single_Dual == 0){
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__StepX222
NOP	
J	L_StepX69
NOP	
L__StepX222:
;Stepper.c,359 :: 		SingleStepAxis(X);
MOVZ	R25, R0, R0
JAL	Stepper_SingleStepAxis+0
NOP	
;Stepper.c,360 :: 		}else{
J	L_StepX70
NOP	
L_StepX69:
;Stepper.c,361 :: 		if(STPS[X].master = MASTER){
LBU	R2, Offset(_STPS+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_STPS+0)(GP)
LBU	R2, Offset(_STPS+0)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__StepX224
NOP	
J	L_StepX71
NOP	
L__StepX224:
;Stepper.c,362 :: 		if(axis_xyz == xy)
LBU	R2, Offset(_axis_xyz+0)(GP)
BEQ	R2, R0, L__StepX225
NOP	
J	L_StepX72
NOP	
L__StepX225:
;Stepper.c,363 :: 		Axis_Interpolate(X,Y);
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepX73
NOP	
L_StepX72:
;Stepper.c,364 :: 		else if(axis_xyz == xz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__StepX226
NOP	
J	L_StepX74
NOP	
L__StepX226:
;Stepper.c,365 :: 		Axis_Interpolate(X,Z);
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepX75
NOP	
L_StepX74:
;Stepper.c,366 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepX227
NOP	
J	L_StepX76
NOP	
L__StepX227:
;Stepper.c,367 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	Stepper_Axis_Interpolate+0
NOP	
L_StepX76:
L_StepX75:
L_StepX73:
;Stepper.c,368 :: 		}
L_StepX71:
;Stepper.c,369 :: 		}
L_StepX70:
;Stepper.c,370 :: 		}
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
;Stepper.c,374 :: 		void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_SRS {
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
;Stepper.c,375 :: 		OC2IF_bit = 0;
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Stepper.c,377 :: 		if(SV.Single_Dual == 0){
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__StepY229
NOP	
J	L_StepY77
NOP	
L__StepY229:
;Stepper.c,378 :: 		SingleStepAxis(Y);
ORI	R25, R0, 1
JAL	Stepper_SingleStepAxis+0
NOP	
;Stepper.c,379 :: 		}else {
J	L_StepY78
NOP	
L_StepY77:
;Stepper.c,380 :: 		if(STPS[Y].master = MASTER){
LBU	R2, Offset(_STPS+68)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_STPS+68)(GP)
LBU	R2, Offset(_STPS+68)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__StepY231
NOP	
J	L_StepY79
NOP	
L__StepY231:
;Stepper.c,381 :: 		if(axis_xyz == xy )
LBU	R2, Offset(_axis_xyz+0)(GP)
BEQ	R2, R0, L__StepY232
NOP	
J	L_StepY80
NOP	
L__StepY232:
;Stepper.c,382 :: 		Axis_Interpolate(X,Y);
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepY81
NOP	
L_StepY80:
;Stepper.c,383 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepY233
NOP	
J	L_StepY82
NOP	
L__StepY233:
;Stepper.c,384 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepY83
NOP	
L_StepY82:
;Stepper.c,385 :: 		else if(axis_xyz == ya)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__StepY234
NOP	
J	L_StepY84
NOP	
L__StepY234:
;Stepper.c,386 :: 		Axis_Interpolate(Y,A);
ORI	R26, R0, 3
ORI	R25, R0, 1
JAL	Stepper_Axis_Interpolate+0
NOP	
L_StepY84:
L_StepY83:
L_StepY81:
;Stepper.c,387 :: 		}
L_StepY79:
;Stepper.c,388 :: 		}
L_StepY78:
;Stepper.c,389 :: 		}
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
;Stepper.c,392 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_SRS {
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
;Stepper.c,393 :: 		OC7IF_bit = 0;
LUI	R2, BitMask(OC7IF_bit+0)
ORI	R2, R2, BitMask(OC7IF_bit+0)
_SX	
;Stepper.c,395 :: 		if(SV.Single_Dual == 0){
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__StepZ236
NOP	
J	L_StepZ85
NOP	
L__StepZ236:
;Stepper.c,396 :: 		SingleStepAxis(Z);
ORI	R25, R0, 2
JAL	Stepper_SingleStepAxis+0
NOP	
;Stepper.c,397 :: 		}else{
J	L_StepZ86
NOP	
L_StepZ85:
;Stepper.c,398 :: 		if(STPS[Z].master = MASTER){
LBU	R2, Offset(_STPS+136)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_STPS+136)(GP)
LBU	R2, Offset(_STPS+136)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__StepZ238
NOP	
J	L_StepZ87
NOP	
L__StepZ238:
;Stepper.c,399 :: 		if(axis_xyz == xz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__StepZ239
NOP	
J	L_StepZ88
NOP	
L__StepZ239:
;Stepper.c,400 :: 		Axis_Interpolate(X,Z);
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepZ89
NOP	
L_StepZ88:
;Stepper.c,401 :: 		else if(axis_xyz == yz)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepZ240
NOP	
J	L_StepZ90
NOP	
L__StepZ240:
;Stepper.c,402 :: 		Axis_Interpolate(Y,Z);
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepZ91
NOP	
L_StepZ90:
;Stepper.c,403 :: 		else if(axis_xyz == za)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__StepZ241
NOP	
J	L_StepZ92
NOP	
L__StepZ241:
;Stepper.c,404 :: 		Axis_Interpolate(Z,A);
ORI	R26, R0, 3
ORI	R25, R0, 2
JAL	Stepper_Axis_Interpolate+0
NOP	
L_StepZ92:
L_StepZ91:
L_StepZ89:
;Stepper.c,406 :: 		}
L_StepZ87:
;Stepper.c,407 :: 		}
L_StepZ86:
;Stepper.c,409 :: 		}
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
;Stepper.c,412 :: 		void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_SRS {
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
;Stepper.c,413 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,415 :: 		if(SV.Single_Dual == 0){
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__StepA243
NOP	
J	L_StepA93
NOP	
L__StepA243:
;Stepper.c,416 :: 		SingleStepAxis(A);
ORI	R25, R0, 3
JAL	Stepper_SingleStepAxis+0
NOP	
;Stepper.c,417 :: 		}else{
J	L_StepA94
NOP	
L_StepA93:
;Stepper.c,418 :: 		if(STPS[A].master = MASTER){
LBU	R2, Offset(_STPS+204)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_STPS+204)(GP)
LBU	R2, Offset(_STPS+204)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__StepA245
NOP	
J	L_StepA95
NOP	
L__StepA245:
;Stepper.c,419 :: 		if(axis_xyz == xa)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__StepA246
NOP	
J	L_StepA96
NOP	
L__StepA246:
;Stepper.c,420 :: 		Axis_Interpolate(X,A);
ORI	R26, R0, 3
MOVZ	R25, R0, R0
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepA97
NOP	
L_StepA96:
;Stepper.c,421 :: 		else if(axis_xyz == ya)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__StepA247
NOP	
J	L_StepA98
NOP	
L__StepA247:
;Stepper.c,422 :: 		Axis_Interpolate(Y,A);
ORI	R26, R0, 3
ORI	R25, R0, 1
JAL	Stepper_Axis_Interpolate+0
NOP	
J	L_StepA99
NOP	
L_StepA98:
;Stepper.c,423 :: 		else if(axis_xyz == za)
LBU	R3, Offset(_axis_xyz+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__StepA248
NOP	
J	L_StepA100
NOP	
L__StepA248:
;Stepper.c,424 :: 		Axis_Interpolate(Z,A);
ORI	R26, R0, 3
ORI	R25, R0, 2
JAL	Stepper_Axis_Interpolate+0
NOP	
L_StepA100:
L_StepA99:
L_StepA97:
;Stepper.c,425 :: 		}
L_StepA95:
;Stepper.c,426 :: 		}
L_StepA94:
;Stepper.c,427 :: 		}
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
;Stepper.c,434 :: 		static void SingleStepAxis(int axis){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,435 :: 		Step_Cycle(axis);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,436 :: 		Pulse(axis);
JAL	Stepper_Pulse+0
NOP	
;Stepper.c,437 :: 		if(STPS[axis].step_count >= STPS[axis].dist)
SEH	R3, R25
ORI	R2, R0, 68
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
BEQ	R2, R0, L_Stepper_SingleStepAxis250
NOP	
J	L_Stepper_SingleStepAxis101
NOP	
L_Stepper_SingleStepAxis250:
;Stepper.c,438 :: 		StopAxis(axis);
JAL	_StopAxis+0
NOP	
L_Stepper_SingleStepAxis101:
;Stepper.c,439 :: 		}
L_end_SingleStepAxis:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Stepper_SingleStepAxis
_Start_Interpolation:
;Stepper.c,446 :: 		void Start_Interpolation(int axisA,int axisB){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,447 :: 		Axis_Interpolate(axisA,axisB);
JAL	Stepper_Axis_Interpolate+0
NOP	
;Stepper.c,448 :: 		}
L_end_Start_Interpolation:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Start_Interpolation
Stepper_Axis_Interpolate:
;Stepper.c,450 :: 		static void Axis_Interpolate(int axisA,int axisB){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,453 :: 		cnt++;
LH	R2, Offset(Stepper_Axis_Interpolate_cnt_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Stepper_Axis_Interpolate_cnt_L0+0)(GP)
;Stepper.c,454 :: 		if(cnt > 5){
SEH	R2, R2
SLTI	R2, R2, 6
BEQ	R2, R0, L_Stepper_Axis_Interpolate253
NOP	
J	L_Stepper_Axis_Interpolate102
NOP	
L_Stepper_Axis_Interpolate253:
;Stepper.c,455 :: 		LED2=!LED2;
_LX	
EXT	R2, R2, BitPos(LED2+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Stepper.c,456 :: 		cnt = 0;
SH	R0, Offset(Stepper_Axis_Interpolate_cnt_L0+0)(GP)
;Stepper.c,457 :: 		}
L_Stepper_Axis_Interpolate102:
;Stepper.c,459 :: 		if(STPS[axisA].dist >= STPS[axisB].dist){//SV.dA >= SV.dB){
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
LW	R4, 0(R2)
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
LW	R2, 0(R2)
SLT	R2, R4, R2
BEQ	R2, R0, L_Stepper_Axis_Interpolate254
NOP	
J	L_Stepper_Axis_Interpolate103
NOP	
L_Stepper_Axis_Interpolate254:
;Stepper.c,460 :: 		if(STPS[axisA].step_count < STPS[axisA].dist){
SEH	R3, R25
ORI	R2, R0, 68
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
BNE	R2, R0, L_Stepper_Axis_Interpolate255
NOP	
J	L_Stepper_Axis_Interpolate104
NOP	
L_Stepper_Axis_Interpolate255:
;Stepper.c,461 :: 		Step_Cycle(axisA);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,462 :: 		if(STPS[axisB].step_count >= STPS[axisB].dist)
SEH	R3, R26
ORI	R2, R0, 68
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
BEQ	R2, R0, L_Stepper_Axis_Interpolate256
NOP	
J	L_Stepper_Axis_Interpolate105
NOP	
L_Stepper_Axis_Interpolate256:
;Stepper.c,463 :: 		StopAxis(axisB);
SH	R25, 4(SP)
SEH	R25, R26
JAL	_StopAxis+0
NOP	
LH	R25, 4(SP)
L_Stepper_Axis_Interpolate105:
;Stepper.c,464 :: 		}
L_Stepper_Axis_Interpolate104:
;Stepper.c,467 :: 		if(!SV.cir)Pulse(axisA);
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L_Stepper_Axis_Interpolate257
NOP	
J	L_Stepper_Axis_Interpolate106
NOP	
L_Stepper_Axis_Interpolate257:
JAL	Stepper_Pulse+0
NOP	
J	L_Stepper_Axis_Interpolate107
NOP	
L_Stepper_Axis_Interpolate106:
;Stepper.c,469 :: 		if(STPS[axisA].step_count >= STPS[axisA].dist)
SEH	R3, R25
ORI	R2, R0, 68
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
BEQ	R2, R0, L_Stepper_Axis_Interpolate258
NOP	
J	L_Stepper_Axis_Interpolate108
NOP	
L_Stepper_Axis_Interpolate258:
;Stepper.c,470 :: 		StopAxis(axisA);
JAL	_StopAxis+0
NOP	
L_Stepper_Axis_Interpolate108:
;Stepper.c,471 :: 		}
L_Stepper_Axis_Interpolate107:
;Stepper.c,473 :: 		if(SV.dif < 0){
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L_Stepper_Axis_Interpolate259
NOP	
J	L_Stepper_Axis_Interpolate109
NOP	
L_Stepper_Axis_Interpolate259:
;Stepper.c,474 :: 		SV.dif += BresIncVal(STPS[axisB].dist);//SV.dB);//2*SV.dy;//
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
LW	R2, 0(R2)
SLL	R3, R2, 1
LW	R2, Offset(_SV+20)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,475 :: 		}else{
J	L_Stepper_Axis_Interpolate110
NOP	
L_Stepper_Axis_Interpolate109:
;Stepper.c,476 :: 		if(STPS[axisB].step_count < STPS[axisB].dist){
SEH	R3, R26
ORI	R2, R0, 68
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
BNE	R2, R0, L_Stepper_Axis_Interpolate260
NOP	
J	L_Stepper_Axis_Interpolate111
NOP	
L_Stepper_Axis_Interpolate260:
;Stepper.c,477 :: 		STPS[axisB].step_delay = STPS[axisA].step_delay;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 8
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
LW	R2, 0(R2)
SW	R2, 0(R4)
;Stepper.c,478 :: 		STPS[axisB].accel_count = STPS[axisA].accel_count;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 24
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
LW	R2, 0(R2)
SW	R2, 0(R4)
;Stepper.c,479 :: 		Step_Cycle(axisB);
SH	R25, 4(SP)
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
LH	R25, 4(SP)
;Stepper.c,480 :: 		SV.dif += BresDiffVal(STPS[axisB].dist,STPS[axisA].dist);//SV.dB,SV.dA);//2 * (SV.dy - SV.dx);//
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
LW	R4, 0(R2)
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
LW	R2, 0(R2)
SUBU	R2, R4, R2
SLL	R3, R2, 1
LW	R2, Offset(_SV+20)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,481 :: 		}
L_Stepper_Axis_Interpolate111:
;Stepper.c,482 :: 		}
L_Stepper_Axis_Interpolate110:
;Stepper.c,483 :: 		}else{
J	L_Stepper_Axis_Interpolate112
NOP	
L_Stepper_Axis_Interpolate103:
;Stepper.c,484 :: 		if(STPS[axisB].step_count < STPS[axisB].dist){
SEH	R3, R26
ORI	R2, R0, 68
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
BNE	R2, R0, L_Stepper_Axis_Interpolate261
NOP	
J	L_Stepper_Axis_Interpolate113
NOP	
L_Stepper_Axis_Interpolate261:
;Stepper.c,485 :: 		Step_Cycle(axisB);
SH	R25, 4(SP)
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
LH	R25, 4(SP)
;Stepper.c,486 :: 		if(STPS[axisA].step_count >= STPS[axisA].dist)
SEH	R3, R25
ORI	R2, R0, 68
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
BEQ	R2, R0, L_Stepper_Axis_Interpolate262
NOP	
J	L_Stepper_Axis_Interpolate114
NOP	
L_Stepper_Axis_Interpolate262:
;Stepper.c,487 :: 		StopAxis(axisA);
JAL	_StopAxis+0
NOP	
L_Stepper_Axis_Interpolate114:
;Stepper.c,488 :: 		}
L_Stepper_Axis_Interpolate113:
;Stepper.c,491 :: 		if(!SV.cir)Pulse(axisB);
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L_Stepper_Axis_Interpolate263
NOP	
J	L_Stepper_Axis_Interpolate115
NOP	
L_Stepper_Axis_Interpolate263:
SH	R25, 4(SP)
SEH	R25, R26
JAL	Stepper_Pulse+0
NOP	
LH	R25, 4(SP)
J	L_Stepper_Axis_Interpolate116
NOP	
L_Stepper_Axis_Interpolate115:
;Stepper.c,493 :: 		if(STPS[axisB].step_count >= STPS[axisB].dist)
SEH	R3, R26
ORI	R2, R0, 68
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
BEQ	R2, R0, L_Stepper_Axis_Interpolate264
NOP	
J	L_Stepper_Axis_Interpolate117
NOP	
L_Stepper_Axis_Interpolate264:
;Stepper.c,494 :: 		StopAxis(axisB);
SH	R25, 4(SP)
SEH	R25, R26
JAL	_StopAxis+0
NOP	
LH	R25, 4(SP)
L_Stepper_Axis_Interpolate117:
;Stepper.c,495 :: 		}
L_Stepper_Axis_Interpolate116:
;Stepper.c,497 :: 		if(SV.dif < 0){
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L_Stepper_Axis_Interpolate265
NOP	
J	L_Stepper_Axis_Interpolate118
NOP	
L_Stepper_Axis_Interpolate265:
;Stepper.c,498 :: 		SV.dif += BresIncVal(STPS[axisA].dist);//SV.dA);//2 * SV.dx;//
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
LW	R2, 0(R2)
SLL	R3, R2, 1
LW	R2, Offset(_SV+20)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,499 :: 		}else{
J	L_Stepper_Axis_Interpolate119
NOP	
L_Stepper_Axis_Interpolate118:
;Stepper.c,500 :: 		if(STPS[axisA].step_count < STPS[axisA].dist){
SEH	R3, R25
ORI	R2, R0, 68
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
BNE	R2, R0, L_Stepper_Axis_Interpolate266
NOP	
J	L_Stepper_Axis_Interpolate120
NOP	
L_Stepper_Axis_Interpolate266:
;Stepper.c,501 :: 		STPS[axisA].step_delay = STPS[axisB].step_delay;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 8
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
LW	R2, 0(R2)
SW	R2, 0(R4)
;Stepper.c,502 :: 		STPS[axisA].accel_count = STPS[axisB].accel_count;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 24
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
LW	R2, 0(R2)
SW	R2, 0(R4)
;Stepper.c,503 :: 		Step_Cycle(axisA);
JAL	_Step_Cycle+0
NOP	
;Stepper.c,504 :: 		SV.dif += BresDiffVal(STPS[axisA].dist,STPS[axisB].dist);//SV.dA,SV.dB);//2 * (SV.dx - SV.dy);//
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
LW	R4, 0(R2)
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
LW	R2, 0(R2)
SUBU	R2, R4, R2
SLL	R3, R2, 1
LW	R2, Offset(_SV+20)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,505 :: 		}
L_Stepper_Axis_Interpolate120:
;Stepper.c,506 :: 		}
L_Stepper_Axis_Interpolate119:
;Stepper.c,508 :: 		}
L_Stepper_Axis_Interpolate112:
;Stepper.c,509 :: 		}
L_end_Axis_Interpolate:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Stepper_Axis_Interpolate
