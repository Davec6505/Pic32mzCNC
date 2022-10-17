_GetAxisDirection:
;Globals.c,9 :: 		int GetAxisDirection(long mm2move){
;Globals.c,10 :: 		return(mm2move < 0)? CCW_:CW_;
SLTI	R2, R25, 0
BNE	R2, R0, L__GetAxisDirection3
NOP	
J	L_GetAxisDirection0
NOP	
L__GetAxisDirection3:
; ?FLOC___GetAxisDirection?T1 start address is: 8 (R2)
ORI	R2, R0, 255
; ?FLOC___GetAxisDirection?T1 end address is: 8 (R2)
J	L_GetAxisDirection1
NOP	
L_GetAxisDirection0:
; ?FLOC___GetAxisDirection?T1 start address is: 8 (R2)
ORI	R2, R0, 1
; ?FLOC___GetAxisDirection?T1 end address is: 8 (R2)
L_GetAxisDirection1:
; ?FLOC___GetAxisDirection?T1 start address is: 8 (R2)
SEB	R2, R2
; ?FLOC___GetAxisDirection?T1 end address is: 8 (R2)
;Globals.c,11 :: 		}
L_end_GetAxisDirection:
JR	RA
NOP	
; end of _GetAxisDirection
