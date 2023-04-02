_leadscrew_steps:
;Steptodistance.c,17 :: 		long leadscrew_steps(double move_distance,int axis){
;Steptodistance.c,18 :: 		double temp = 0.00;
;Steptodistance.c,22 :: 		temp =  INVERSE_LEADSCREW_PITCH * INVERSE_M_STEP * settings.steps_per_mm[axis];
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_settings+0)
ORI	R2, R2, lo_addr(_settings+0)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LUI	R2, 16889
ORI	R2, R2, 65535
MTC1	R2, S0
MUL.S 	S0, S0, S1
;Steptodistance.c,24 :: 		return temp;
CVT36.S 	S0, S0
MFC1	R2, S0
;Steptodistance.c,25 :: 		}
L_end_leadscrew_steps:
JR	RA
NOP	
; end of _leadscrew_steps
_belt_steps:
;Steptodistance.c,31 :: 		long belt_steps(float move_distance,int axis){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Steptodistance.c,32 :: 		double temp = 0;
;Steptodistance.c,33 :: 		temp = ((M_STEP * settings.steps_per_mm[axis])/(BELT_PITCH * PULLEY_TOOTH_COUNT)) * move_distance; //mmtostep(move_distance);
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_settings+0)
ORI	R2, R2, lo_addr(_settings+0)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LUI	R2, 16896
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S1, S0, S1
LUI	R2, 16928
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S0, S1, S0
MUL.S 	S0, S0, S12
;Steptodistance.c,34 :: 		return lround(temp);
MOV.S 	S12, S0
JAL	_lround+0
NOP	
;Steptodistance.c,35 :: 		}
L_end_belt_steps:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _belt_steps
_beltsteps2mm:
;Steptodistance.c,40 :: 		float beltsteps2mm(long Steps,int axis){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Steptodistance.c,41 :: 		float temp = (BELT_PITCH*PULLEY_TOOTH_COUNT*(float)Steps)/(M_STEP * settings.steps_per_mm[axis]); //steptomm(steps);
MTC1	R25, S0
CVT32.W 	S1, S0
LUI	R2, 16928
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S2, S0, S1
SEH	R2, R26
SLL	R3, R2, 2
LUI	R2, hi_addr(_settings+0)
ORI	R2, R2, lo_addr(_settings+0)
ADDU	R2, R2, R3
LWC1	S1, 0(R2)
LUI	R2, 16896
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S1
DIV.S 	S0, S2, S0
;Steptodistance.c,42 :: 		temp = fround(temp);
MOV.S 	S12, S0
JAL	_fround+0
NOP	
;Steptodistance.c,47 :: 		return temp;
;Steptodistance.c,48 :: 		}
L_end_beltsteps2mm:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _beltsteps2mm
_mm2in:
;Steptodistance.c,53 :: 		double mm2in(double mm){
;Steptodistance.c,54 :: 		return mm * INCH_PER_MM;
LUI	R2, 15649
ORI	R2, R2, 17035
MTC1	R2, S0
MUL.S 	S0, S12, S0
;Steptodistance.c,55 :: 		}
L_end_mm2in:
JR	RA
NOP	
; end of _mm2in
_in2mm:
;Steptodistance.c,60 :: 		double in2mm(double inch){
;Steptodistance.c,61 :: 		return inch * MM_PER_INCH;
LUI	R2, 16843
ORI	R2, R2, 13107
MTC1	R2, S0
MUL.S 	S0, S12, S0
;Steptodistance.c,62 :: 		}
L_end_in2mm:
JR	RA
NOP	
; end of _in2mm
_calcSteps:
;Steptodistance.c,68 :: 		long calcSteps(double mmsToMove,  double Dia,int axis){
;Steptodistance.c,73 :: 		circ = Dia*Pi;
LUI	R2, 16457
ORI	R2, R2, 4060
MTC1	R2, S0
MUL.S 	S0, S13, S0
;Steptodistance.c,77 :: 		cirDivision = mmsToMove / circ;
DIV.S 	S1, S12, S0
;Steptodistance.c,78 :: 		stepsToMove = cirDivision * settings.steps_per_mm[axis] * M_STEP;
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_settings+0)
ORI	R2, R2, lo_addr(_settings+0)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
MUL.S 	S1, S1, S0
LUI	R2, 16896
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S1, S0
;Steptodistance.c,81 :: 		return (long)stepsToMove;
CVT36.S 	S0, S0
MFC1	R2, S0
;Steptodistance.c,82 :: 		}
L_end_calcSteps:
JR	RA
NOP	
; end of _calcSteps
