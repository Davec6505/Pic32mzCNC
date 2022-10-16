_leadscrew_steps:
;Steptodistance.c,17 :: 		long leadscrew_steps(double move_distance){
;Steptodistance.c,18 :: 		double temp = 0.00;
;Steptodistance.c,24 :: 		return temp;
ORI	R2, R0, 5874
;Steptodistance.c,25 :: 		}
L_end_leadscrew_steps:
JR	RA
NOP	
; end of _leadscrew_steps
_belt_steps:
;Steptodistance.c,31 :: 		long belt_steps(double move_distance){
;Steptodistance.c,32 :: 		double temp = 0;
;Steptodistance.c,33 :: 		temp = (SPRU/(BELT_PITCH*PULLEY_TOOTH_COUNT))*move_distance;
LUI	R2, 17174
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S12
<<<<<<< HEAD
;Steptodistance.c,35 :: 		return (signed long)temp;
CVT36.S 	S0, S0
MFC1	R2, S0
;Steptodistance.c,36 :: 		}
=======
;Steptodistance.c,34 :: 		return (long)temp;
CVT36.S 	S0, S0
MFC1	R2, S0
;Steptodistance.c,35 :: 		}
>>>>>>> patch2
L_end_belt_steps:
JR	RA
NOP	
; end of _belt_steps
_mm2in:
<<<<<<< HEAD
;Steptodistance.c,41 :: 		double mm2in(double mm){
;Steptodistance.c,42 :: 		return mm * INCH_PER_MM;
=======
;Steptodistance.c,40 :: 		double mm2in(double mm){
;Steptodistance.c,41 :: 		return mm * INCH_PER_MM;
>>>>>>> patch2
LUI	R2, 15649
ORI	R2, R2, 17035
MTC1	R2, S0
MUL.S 	S0, S12, S0
<<<<<<< HEAD
;Steptodistance.c,43 :: 		}
=======
;Steptodistance.c,42 :: 		}
>>>>>>> patch2
L_end_mm2in:
JR	RA
NOP	
; end of _mm2in
_in2mm:
<<<<<<< HEAD
;Steptodistance.c,48 :: 		double in2mm(double inch){
;Steptodistance.c,49 :: 		return inch * MM_PER_INCH;
=======
;Steptodistance.c,47 :: 		double in2mm(double inch){
;Steptodistance.c,48 :: 		return inch * MM_PER_INCH;
>>>>>>> patch2
LUI	R2, 16843
ORI	R2, R2, 13107
MTC1	R2, S0
MUL.S 	S0, S12, S0
<<<<<<< HEAD
;Steptodistance.c,50 :: 		}
=======
;Steptodistance.c,49 :: 		}
>>>>>>> patch2
L_end_in2mm:
JR	RA
NOP	
; end of _in2mm
_calcSteps:
<<<<<<< HEAD
;Steptodistance.c,56 :: 		long calcSteps(double mmsToMove,  double Dia){
;Steptodistance.c,61 :: 		circ = Dia*Pi;
=======
;Steptodistance.c,55 :: 		long calcSteps(double mmsToMove,  double Dia){
;Steptodistance.c,60 :: 		circ = Dia*Pi;
>>>>>>> patch2
LUI	R2, 16457
ORI	R2, R2, 4060
MTC1	R2, S0
MUL.S 	S0, S13, S0
<<<<<<< HEAD
;Steptodistance.c,65 :: 		cirDivision = mmsToMove / circ;
DIV.S 	S1, S12, S0
;Steptodistance.c,66 :: 		stepsToMove = cirDivision * SPRU;
=======
;Steptodistance.c,64 :: 		cirDivision = mmsToMove / circ;
DIV.S 	S1, S12, S0
;Steptodistance.c,65 :: 		stepsToMove = cirDivision * SPRU;
<<<<<<< HEAD
>>>>>>> patch2
LUI	R2, 17864
=======
LUI	R2, 17852
>>>>>>> patch2
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S1, S0
<<<<<<< HEAD
;Steptodistance.c,69 :: 		return (signed long)stepsToMove;
CVT36.S 	S0, S0
MFC1	R2, S0
;Steptodistance.c,70 :: 		}
=======
;Steptodistance.c,68 :: 		return (signed long)stepsToMove;
CVT36.S 	S0, S0
MFC1	R2, S0
;Steptodistance.c,69 :: 		}
>>>>>>> patch2
L_end_calcSteps:
JR	RA
NOP	
; end of _calcSteps
