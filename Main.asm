_main:
;Main.c,54 :: 		void main() {
ADDIU	SP, SP, -64
;Main.c,57 :: 		int axis_to_run = 0;
MOVZ	R30, R0, R0
SH	R30, 60(SP)
;Main.c,59 :: 		int xyz_ = 0, i,dif;
;Main.c,63 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,64 :: 		plan_init(15000,15000);
ORI	R26, R0, 15000
ORI	R25, R0, 15000
JAL	_plan_init+0
NOP	
;Main.c,65 :: 		oneShotA = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,66 :: 		a=0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,67 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,68 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,70 :: 		disable_steps = 0;
SH	R0, Offset(Main_disable_steps+0)(GP)
;Main.c,71 :: 		EnableInterrupts();
EI	R30
;Main.c,72 :: 		Toggle = 0;
SH	R0, Offset(_Toggle+0)(GP)
;Main.c,73 :: 		while(1){
L_main0:
;Main.c,75 :: 		Debounce_Limits(X);
MOVZ	R25, R0, R0
JAL	_Debounce_Limits+0
NOP	
;Main.c,76 :: 		Debounce_Limits(Y);
ORI	R25, R0, 1
JAL	_Debounce_Limits+0
NOP	
;Main.c,77 :: 		if(!status_of_gcode)
LH	R2, 0(SP)
BEQ	R2, R0, L__main45
NOP	
J	L_main2
NOP	
L__main45:
;Main.c,78 :: 		axis_to_run = Get_Axisword();
JAL	_Get_Axisword+0
NOP	
SH	R2, 60(SP)
L_main2:
;Main.c,79 :: 		if(axis_to_run){
LH	R2, 60(SP)
BNE	R2, R0, L__main47
NOP	
J	L_main3
NOP	
L__main47:
;Main.c,80 :: 		while(DMA_Busy(1));
L_main4:
ORI	R25, R0, 1
JAL	_DMA_Busy+0
NOP	
BNE	R2, R0, L__main49
NOP	
J	L_main5
NOP	
L__main49:
J	L_main4
NOP	
L_main5:
;Main.c,81 :: 		dma_printf("axis_to_run:= %d\n",axis_to_run&0xff);
LH	R2, 60(SP)
ANDI	R3, R2, 255
ADDIU	R23, SP, 2
ADDIU	R22, R23, 18
LUI	R24, hi_addr(?ICS?lstr1_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 2
ADDIU	SP, SP, -8
SH	R3, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
;Main.c,82 :: 		axis_to_run = Rst_Axisword();
JAL	_Rst_Axisword+0
NOP	
SH	R2, 60(SP)
;Main.c,83 :: 		}
L_main3:
;Main.c,85 :: 		status_of_gcode = Sample_Ringbuffer();
JAL	_Sample_Ringbuffer+0
NOP	
SH	R2, 0(SP)
;Main.c,97 :: 		if(!Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main50
NOP	
J	L_main6
NOP	
L__main50:
;Main.c,98 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,100 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(Main_disable_steps+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main51
NOP	
J	L_main7
NOP	
L__main51:
;Main.c,101 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(Main_disable_steps+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(Main_disable_steps+0)(GP)
L_main7:
;Main.c,103 :: 		}
L_main6:
;Main.c,105 :: 		if(!SW2){
_LX	
EXT	R2, R2, BitPos(SW2+0), 1
BEQ	R2, R0, L__main52
NOP	
J	L_main8
NOP	
L__main52:
;Main.c,106 :: 		Toggle  = 0;
SH	R0, Offset(_Toggle+0)(GP)
;Main.c,107 :: 		disable_steps = 0;
SH	R0, Offset(Main_disable_steps+0)(GP)
;Main.c,108 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,109 :: 		}
L_main8:
;Main.c,111 :: 		if((!SW1)&&(!Toggle)){
_LX	
EXT	R2, R2, BitPos(SW1+0), 1
BEQ	R2, R0, L__main53
NOP	
J	L__main39
NOP	
L__main53:
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main54
NOP	
J	L__main38
NOP	
L__main54:
L__main37:
;Main.c,112 :: 		LED1 = 0;
_LX	
INS	R2, R0, BitPos(LED1+0), 1
_SX	
;Main.c,113 :: 		Toggle = 1;
ORI	R2, R0, 1
SH	R2, Offset(_Toggle+0)(GP)
;Main.c,114 :: 		EnStepperX();
JAL	_EnStepperX+0
NOP	
;Main.c,115 :: 		EnStepperY();
JAL	_EnStepperY+0
NOP	
;Main.c,116 :: 		EnStepperZ();
JAL	_EnStepperZ+0
NOP	
;Main.c,117 :: 		EnStepperA();
JAL	_EnStepperA+0
NOP	
;Main.c,118 :: 		ResetHoming();
JAL	_ResetHoming+0
NOP	
;Main.c,119 :: 		a = 0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,111 :: 		if((!SW1)&&(!Toggle)){
L__main39:
L__main38:
;Main.c,122 :: 		if(Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BNE	R2, R0, L__main56
NOP	
J	L_main12
NOP	
L__main56:
;Main.c,124 :: 		if((a > 19)){
LHU	R2, Offset(Main_a+0)(GP)
SLTIU	R2, R2, 20
BEQ	R2, R0, L__main57
NOP	
J	L_main13
NOP	
L__main57:
;Main.c,125 :: 		if(STPS[X].homing.home_cnt >= 2){
LHU	R2, Offset(_STPS+100)(GP)
SLTIU	R2, R2, 2
BEQ	R2, R0, L__main58
NOP	
J	L_main14
NOP	
L__main58:
;Main.c,126 :: 		STPS[X].homing.home_cnt = 0;
SH	R0, Offset(_STPS+100)(GP)
;Main.c,127 :: 		a = 11;
ORI	R2, R0, 11
SH	R2, Offset(Main_a+0)(GP)
;Main.c,128 :: 		dma_printf("\nXCnt:= %d : a:= %d",STPS[X].homing.home_cnt,a);
ADDIU	R23, SP, 20
ADDIU	R22, R23, 20
LUI	R24, hi_addr(?ICS?lstr2_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 20
ORI	R2, R0, 11
ADDIU	SP, SP, -12
SH	R2, 8(SP)
SH	R0, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,129 :: 		}
L_main14:
;Main.c,130 :: 		if(STPS[Y].homing.home_cnt >= 2){
LHU	R2, Offset(_STPS+204)(GP)
SLTIU	R2, R2, 2
BEQ	R2, R0, L__main59
NOP	
J	L_main15
NOP	
L__main59:
;Main.c,131 :: 		STPS[Y].homing.home_cnt = 0;
SH	R0, Offset(_STPS+204)(GP)
;Main.c,132 :: 		a = 12;
ORI	R2, R0, 12
SH	R2, Offset(Main_a+0)(GP)
;Main.c,133 :: 		dma_printf("\nXCnt:= %d : a:= %d",STPS[Y].homing.home_cnt,a);
ADDIU	R23, SP, 40
ADDIU	R22, R23, 20
LUI	R24, hi_addr(?ICS?lstr3_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 40
ORI	R2, R0, 12
ADDIU	SP, SP, -12
SH	R2, 8(SP)
SH	R0, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,134 :: 		}
L_main15:
;Main.c,136 :: 		}else{
J	L_main16
NOP	
L_main13:
;Main.c,137 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__main60
NOP	
J	L__main43
NOP	
L__main60:
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__main61
NOP	
J	L__main42
NOP	
L__main61:
_LX	
EXT	R2, R2, BitPos(OC7IE_bit+0), 1
BEQ	R2, R0, L__main62
NOP	
J	L__main41
NOP	
L__main62:
_LX	
EXT	R2, R2, BitPos(OC3IE_bit+0), 1
BEQ	R2, R0, L__main63
NOP	
J	L__main40
NOP	
L__main63:
L__main36:
L__main43:
L__main42:
L__main41:
L__main40:
;Main.c,145 :: 		}
L_main16:
;Main.c,146 :: 		}
L_main12:
;Main.c,148 :: 		}
J	L_main0
NOP	
;Main.c,149 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Temp_Move:
;Main.c,151 :: 		int Temp_Move(int a){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,152 :: 		switch(a){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_Temp_Move20
NOP	
;Main.c,153 :: 		case 0:
L_Temp_Move22:
;Main.c,154 :: 		SingleAxisStep(50.00,8000,Y);
LUI	R2, 16968
ORI	R2, R2, 0
SH	R25, 12(SP)
ORI	R26, R0, 1
ORI	R25, R0, 8000
MTC1	R2, S12
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,155 :: 		a = 1;
ORI	R25, R0, 1
;Main.c,156 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,157 :: 		case 1:
L_Temp_Move23:
;Main.c,158 :: 		SingleAxisStep(50.00,8000,X);
LUI	R2, 16968
ORI	R2, R2, 0
SH	R25, 12(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 8000
MTC1	R2, S12
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,159 :: 		a = 2;
ORI	R25, R0, 2
;Main.c,160 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,161 :: 		case 2:
L_Temp_Move24:
;Main.c,162 :: 		SingleAxisStep(-50.00,8000,Y);
LUI	R2, 49736
ORI	R2, R2, 0
SH	R25, 12(SP)
ORI	R26, R0, 1
ORI	R25, R0, 8000
MTC1	R2, S12
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,163 :: 		a = 3;
ORI	R25, R0, 3
;Main.c,164 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,165 :: 		case 3:
L_Temp_Move25:
;Main.c,166 :: 		SingleAxisStep(-50.00,8000,X);
LUI	R2, 49736
ORI	R2, R2, 0
SH	R25, 12(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 8000
MTC1	R2, S12
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,167 :: 		a = 4;
ORI	R25, R0, 4
;Main.c,168 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,169 :: 		case 4:
L_Temp_Move26:
;Main.c,170 :: 		DualAxisStep(150.00, 100.00,X,Y,8000);
LUI	R3, 17096
ORI	R3, R3, 0
LUI	R2, 17174
ORI	R2, R2, 0
SH	R25, 12(SP)
ORI	R27, R0, 8000
ORI	R26, R0, 1
MOVZ	R25, R0, R0
MTC1	R3, S13
MTC1	R2, S12
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,171 :: 		a = 5;
ORI	R25, R0, 5
;Main.c,172 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,173 :: 		case 5:
L_Temp_Move27:
;Main.c,174 :: 		DualAxisStep(-150.00, -100.00,X,Y,8000);
LUI	R3, 49864
ORI	R3, R3, 0
LUI	R2, 49942
ORI	R2, R2, 0
SH	R25, 12(SP)
ORI	R27, R0, 8000
ORI	R26, R0, 1
MOVZ	R25, R0, R0
MTC1	R3, S13
MTC1	R2, S12
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,175 :: 		a = 6;
ORI	R25, R0, 6
;Main.c,176 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,177 :: 		case 6:
L_Temp_Move28:
;Main.c,178 :: 		DualAxisStep(150.00, 30.00,X,Y,8000);
LUI	R3, 16880
ORI	R3, R3, 0
LUI	R2, 17174
ORI	R2, R2, 0
SH	R25, 12(SP)
ORI	R27, R0, 8000
ORI	R26, R0, 1
MOVZ	R25, R0, R0
MTC1	R3, S13
MTC1	R2, S12
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,179 :: 		a = 9;
ORI	R25, R0, 9
;Main.c,180 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,181 :: 		case 7:
L_Temp_Move29:
;Main.c,182 :: 		DualAxisStep(-150.00, -30.00,X,Y,8000);
LUI	R3, 49648
ORI	R3, R3, 0
LUI	R2, 49942
ORI	R2, R2, 0
SH	R25, 12(SP)
ORI	R27, R0, 8000
ORI	R26, R0, 1
MOVZ	R25, R0, R0
MTC1	R3, S13
MTC1	R2, S12
JAL	_DualAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,183 :: 		a = 8;
ORI	R25, R0, 8
;Main.c,184 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,185 :: 		case 8:
L_Temp_Move30:
;Main.c,186 :: 		SingleAxisStep(350.00,10000,A);
LUI	R2, 17327
ORI	R2, R2, 0
SH	R25, 12(SP)
ORI	R26, R0, 3
ORI	R25, R0, 10000
MTC1	R2, S12
JAL	_SingleAxisStep+0
NOP	
LH	R25, 12(SP)
;Main.c,187 :: 		a = 9;
ORI	R25, R0, 9
;Main.c,188 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,189 :: 		case 9:
L_Temp_Move31:
;Main.c,193 :: 		r_or_ijk(150.00, 30.00, 150.00, 30.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
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
;Main.c,194 :: 		a = 12;
ORI	R25, R0, 12
;Main.c,195 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,196 :: 		case 10://Homing X axis
L_Temp_Move32:
;Main.c,197 :: 		Home(X);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Home+0
NOP	
LH	R25, 12(SP)
;Main.c,198 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,199 :: 		case 11://Homing Y axis
L_Temp_Move33:
;Main.c,200 :: 		Home(Y);
SH	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Home+0
NOP	
LH	R25, 12(SP)
;Main.c,201 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,202 :: 		case 12://Homing Y axis
L_Temp_Move34:
;Main.c,204 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,205 :: 		default: a = 0;
L_Temp_Move35:
MOVZ	R25, R0, R0
;Main.c,206 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,207 :: 		}
L_Temp_Move20:
SEH	R2, R25
BNE	R2, R0, L__Temp_Move67
NOP	
J	L_Temp_Move22
NOP	
L__Temp_Move67:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Temp_Move69
NOP	
J	L_Temp_Move23
NOP	
L__Temp_Move69:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Temp_Move71
NOP	
J	L_Temp_Move24
NOP	
L__Temp_Move71:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Temp_Move73
NOP	
J	L_Temp_Move25
NOP	
L__Temp_Move73:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Temp_Move75
NOP	
J	L_Temp_Move26
NOP	
L__Temp_Move75:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Temp_Move77
NOP	
J	L_Temp_Move27
NOP	
L__Temp_Move77:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Temp_Move79
NOP	
J	L_Temp_Move28
NOP	
L__Temp_Move79:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Temp_Move81
NOP	
J	L_Temp_Move29
NOP	
L__Temp_Move81:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Temp_Move83
NOP	
J	L_Temp_Move30
NOP	
L__Temp_Move83:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Temp_Move85
NOP	
J	L_Temp_Move31
NOP	
L__Temp_Move85:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Temp_Move87
NOP	
J	L_Temp_Move32
NOP	
L__Temp_Move87:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__Temp_Move89
NOP	
J	L_Temp_Move33
NOP	
L__Temp_Move89:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Temp_Move91
NOP	
J	L_Temp_Move34
NOP	
L__Temp_Move91:
J	L_Temp_Move35
NOP	
L_Temp_Move21:
;Main.c,209 :: 		return a;
SEH	R2, R25
;Main.c,210 :: 		}
;Main.c,209 :: 		return a;
;Main.c,210 :: 		}
L_end_Temp_Move:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Temp_Move
