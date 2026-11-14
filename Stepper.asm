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
;Stepper.c,25 :: 		EN_Steppers      = 1;
_LX	
ORI	R2, R2, BitMask(EN_Steppers+0)
_SX	
;Stepper.c,26 :: 		EN_Steppers_Dir  = 0;
_LX	
INS	R2, R0, BitPos(EN_Steppers_Dir+0), 1
_SX	
;Stepper.c,29 :: 		DIR_Step_PinDirX = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirX+0), 1
_SX	
;Stepper.c,32 :: 		PLS_Step_PinDirX = 0;
_LX	
INS	R2, R0, BitPos(PLS_Step_PinDirX+0), 1
_SX	
;Stepper.c,36 :: 		DIR_Step_PinDirY = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirY+0), 1
_SX	
;Stepper.c,39 :: 		PLS_Step_PinDirY = 0;
_LX	
INS	R2, R0, BitPos(PLS_Step_PinDirY+0), 1
_SX	
;Stepper.c,43 :: 		DIR_Step_PinDirZ = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirZ+0), 1
_SX	
;Stepper.c,46 :: 		PLS_Step_PinDirZ = 0;
_LX	
INS	R2, R0, BitPos(PLS_Step_PinDirZ+0), 1
_SX	
;Stepper.c,50 :: 		DIR_Step_PinDirA = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirA+0), 1
_SX	
;Stepper.c,53 :: 		PLS_Step_PinDirA = 0;
_LX	
INS	R2, R0, BitPos(PLS_Step_PinDirA+0), 1
_SX	
;Stepper.c,56 :: 		dds_axes[0].incrament = 54540;
ORI	R2, R0, 54540
SW	R2, Offset(_dds_axes+4)(GP)
;Stepper.c,57 :: 		}
L_end_SetPinMode:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SetPinMode
_dds_tick:
;Stepper.c,65 :: 		void dds_tick(){
;Stepper.c,67 :: 		dds_axes[0].old_phase = dds_axes[0].phase;
LW	R2, Offset(_dds_axes+0)(GP)
SW	R2, Offset(_dds_axes+8)(GP)
;Stepper.c,68 :: 		dds_axes[0].phase += dds_axes[0].incrament;
LW	R3, Offset(_dds_axes+4)(GP)
LW	R2, Offset(_dds_axes+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_dds_axes+0)(GP)
;Stepper.c,70 :: 		if(dds_axes[0].phase < dds_axes[0].old_phase){
LW	R3, Offset(_dds_axes+8)(GP)
LW	R2, Offset(_dds_axes+0)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__dds_tick5
NOP	
J	L_dds_tick0
NOP	
L__dds_tick5:
;Stepper.c,71 :: 		LED2 = !LED2;
_LX	
EXT	R2, R2, BitPos(LED2+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LED2+0), 1
_SX	
;Stepper.c,72 :: 		}
L_dds_tick0:
;Stepper.c,73 :: 		}
L_end_dds_tick:
JR	RA
NOP	
; end of _dds_tick
_EnableSteppers:
;Stepper.c,76 :: 		void EnableSteppers(){
;Stepper.c,77 :: 		EN_Steppers = 0;
_LX	
INS	R2, R0, BitPos(EN_Steppers+0), 1
_SX	
;Stepper.c,78 :: 		}
L_end_EnableSteppers:
JR	RA
NOP	
; end of _EnableSteppers
_DisableSteppers:
;Stepper.c,80 :: 		void DisableSteppers(){
;Stepper.c,81 :: 		EN_Steppers = 1;
_LX	
ORI	R2, R2, BitMask(EN_Steppers+0)
_SX	
;Stepper.c,82 :: 		}
L_end_DisableSteppers:
JR	RA
NOP	
; end of _DisableSteppers
_DisableSpindleInterrupt:
;Stepper.c,84 :: 		void DisableSpindleInterrupt(int stepper){
;Stepper.c,85 :: 		OC8IE_bit = 0;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
;Stepper.c,86 :: 		OC8CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+4)(GP)
;Stepper.c,87 :: 		}
L_end_DisableSpindleInterrupt:
JR	RA
NOP	
; end of _DisableSpindleInterrupt
_GET_RunState:
;Stepper.c,92 :: 		int GET_RunState(int axis_No){
;Stepper.c,93 :: 		return STPS[axis_No].run_state;
SEH	R3, R25
ORI	R2, R0, 88
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LH	R2, 0(R2)
;Stepper.c,94 :: 		}
L_end_GET_RunState:
JR	RA
NOP	
; end of _GET_RunState
_Steppers_Enabled:
;Stepper.c,96 :: 		int Steppers_Enabled(){
;Stepper.c,97 :: 		return EN_Steppers? 0:1;
_LX	
EXT	R2, R2, BitPos(EN_Steppers+0), 1
BNE	R2, R0, L__Steppers_Enabled12
NOP	
J	L_Steppers_Enabled1
NOP	
L__Steppers_Enabled12:
; ?FLOC___Steppers_Enabled?T24 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___Steppers_Enabled?T24 end address is: 8 (R2)
J	L_Steppers_Enabled2
NOP	
L_Steppers_Enabled1:
; ?FLOC___Steppers_Enabled?T24 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___Steppers_Enabled?T24 end address is: 8 (R2)
L_Steppers_Enabled2:
; ?FLOC___Steppers_Enabled?T24 start address is: 8 (R2)
SEB	R2, R2
; ?FLOC___Steppers_Enabled?T24 end address is: 8 (R2)
;Stepper.c,98 :: 		}
L_end_Steppers_Enabled:
JR	RA
NOP	
; end of _Steppers_Enabled
_Single_Axis_Enable:
;Stepper.c,103 :: 		void Single_Axis_Enable(_axis_ axis_){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,105 :: 		axis_running = 0;
SH	R0, Offset(Stepper_axis_running+0)(GP)
;Stepper.c,106 :: 		EnableSteppers();
JAL	_EnableSteppers+0
NOP	
;Stepper.c,107 :: 		}
L_end_Single_Axis_Enable:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Single_Axis_Enable
_StopAxis:
;Stepper.c,110 :: 		void StopAxis(int axis){
;Stepper.c,111 :: 		STPS[axis].stopAxis = 1;
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
;Stepper.c,112 :: 		}
L_end_StopAxis:
JR	RA
NOP	
; end of _StopAxis
_disableSpindleOCx:
;Stepper.c,115 :: 		void disableSpindleOCx(){
;Stepper.c,116 :: 		OC7IE_bit = 0;OC7CONbits.ON = 0; //Spindle
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+4)(GP)
;Stepper.c,117 :: 		}
L_end_disableSpindleOCx:
JR	RA
NOP	
; end of _disableSpindleOCx
