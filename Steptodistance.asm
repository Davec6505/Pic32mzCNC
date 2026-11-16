_belt_steps:
;Steptodistance.c,17 :: 		long belt_steps(float move_distance,int axis){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Steptodistance.c,18 :: 		double temp = 0;
;Steptodistance.c,19 :: 		temp = ((settings.steps_per_mm[axis])/(BELT_PITCH * PULLEY_TOOTH_COUNT)) * move_distance; //mmtostep(move_distance);
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_settings+0)
ORI	R2, R2, lo_addr(_settings+0)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LUI	R2, 16928
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S0, S1, S0
MUL.S 	S0, S0, S12
;Steptodistance.c,20 :: 		return lround(temp);
MOV.S 	S12, S0
JAL	_lround+0
NOP	
;Steptodistance.c,21 :: 		}
L_end_belt_steps:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _belt_steps
_beltsteps2mm:
;Steptodistance.c,26 :: 		float beltsteps2mm(long Steps,int axis){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Steptodistance.c,27 :: 		float temp = (BELT_PITCH*PULLEY_TOOTH_COUNT*(float)Steps)/(settings.steps_per_mm[axis]); //steptomm(steps);
MTC1	R25, S0
CVT32.W 	S1, S0
LUI	R2, 16928
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S1, S0, S1
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, hi_addr(_settings+0)
ORI	R2, R2, lo_addr(_settings+0)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
DIV.S 	S0, S1, S0
;Steptodistance.c,28 :: 		temp = fround(temp);
MOV.S 	S12, S0
JAL	_fround+0
NOP	
;Steptodistance.c,33 :: 		return temp;
;Steptodistance.c,34 :: 		}
L_end_beltsteps2mm:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _beltsteps2mm
