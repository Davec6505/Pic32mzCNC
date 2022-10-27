_InitTimer1:
;Timers.c,11 :: 		void InitTimer1(){
;Timers.c,13 :: 		Clock = ClockPulse;
LUI	R2, hi_addr(_ClockPulse+0)
ORI	R2, R2, lo_addr(_ClockPulse+0)
SW	R2, Offset(_Clock+0)(GP)
;Timers.c,15 :: 		TMR.Reset = ResetSteppers;
LUI	R2, hi_addr(_ResetSteppers+0)
ORI	R2, R2, lo_addr(_ResetSteppers+0)
SW	R2, Offset(_TMR+4)(GP)
;Timers.c,17 :: 		T1CON         = 0x8010;
ORI	R2, R0, 32784
SW	R2, Offset(T1CON+0)(GP)
;Timers.c,19 :: 		IPC1SET       = 0x1A;
ORI	R2, R0, 26
SW	R2, Offset(IPC1SET+0)(GP)
;Timers.c,21 :: 		IEC0SET       = 0x10;
ORI	R2, R0, 16
SW	R2, Offset(IEC0SET+0)(GP)
;Timers.c,23 :: 		IFS0CLR       = 0x10;;
ORI	R2, R0, 16
SW	R2, Offset(IFS0CLR+0)(GP)
;Timers.c,25 :: 		PR1           = 62500;
ORI	R2, R0, 62500
SW	R2, Offset(PR1+0)(GP)
;Timers.c,26 :: 		TMR1          = 0;
SW	R0, Offset(TMR1+0)(GP)
;Timers.c,27 :: 		}
L_end_InitTimer1:
JR	RA
NOP	
; end of _InitTimer1
_InitTimer8:
;Timers.c,33 :: 		void InitTimer8(){
;Timers.c,34 :: 		T8CON            = 0x8000;
ORI	R2, R0, 32768
SW	R2, Offset(T8CON+0)(GP)
;Timers.c,35 :: 		T8IP0_bit        = 1;
LUI	R2, BitMask(T8IP0_bit+0)
ORI	R2, R2, BitMask(T8IP0_bit+0)
_SX	
;Timers.c,36 :: 		T8IP1_bit        = 1;
LUI	R2, BitMask(T8IP1_bit+0)
ORI	R2, R2, BitMask(T8IP1_bit+0)
_SX	
;Timers.c,37 :: 		T8IP2_bit        = 0;
LUI	R2, BitMask(T8IP2_bit+0)
ORI	R2, R2, BitMask(T8IP2_bit+0)
_SX	
;Timers.c,38 :: 		T8IS0_bit        = 0;
LUI	R2, BitMask(T8IS0_bit+0)
ORI	R2, R2, BitMask(T8IS0_bit+0)
_SX	
;Timers.c,39 :: 		T8IS1_bit        = 1;
LUI	R2, BitMask(T8IS1_bit+0)
ORI	R2, R2, BitMask(T8IS1_bit+0)
_SX	
;Timers.c,42 :: 		T8IF_bit         = 0;
LUI	R2, BitMask(T8IF_bit+0)
ORI	R2, R2, BitMask(T8IF_bit+0)
_SX	
;Timers.c,43 :: 		T8IE_bit         = 0;
LUI	R2, BitMask(T8IE_bit+0)
ORI	R2, R2, BitMask(T8IE_bit+0)
_SX	
;Timers.c,44 :: 		PR8              = 50;
ORI	R2, R0, 50
SW	R2, Offset(PR8+0)(GP)
;Timers.c,45 :: 		TMR8             = 0;
SW	R0, Offset(TMR8+0)(GP)
;Timers.c,46 :: 		}
L_end_InitTimer8:
JR	RA
NOP	
; end of _InitTimer8
_Timer1Interrupt:
;Timers.c,51 :: 		void Timer1Interrupt() iv IVT_TIMER_1 ilevel 6 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 6144
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Timers.c,52 :: 		T1IF_bit  = 0;
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
;Timers.c,54 :: 		Clock();
LW	R30, Offset(_Clock+0)(GP)
JALR	RA, R30
NOP	
;Timers.c,55 :: 		}
L_end_Timer1Interrupt:
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
; end of _Timer1Interrupt
_Timer8Interrupt:
;Timers.c,59 :: 		void Timer8Interrupt() iv IVT_TIMER_8 ilevel 3 ics ICS_SRS {
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
;Timers.c,62 :: 		T8IF_bit  = 0;
LUI	R2, BitMask(T8IF_bit+0)
ORI	R2, R2, BitMask(T8IF_bit+0)
_SX	
;Timers.c,63 :: 		}
L_end_Timer8Interrupt:
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
; end of _Timer8Interrupt
_ClockPulse:
;Timers.c,67 :: 		void ClockPulse(){
;Timers.c,68 :: 		ms100++;
LHU	R2, Offset(Timers_ms100+0)(GP)
ADDIU	R4, R2, 1
SH	R4, Offset(Timers_ms100+0)(GP)
;Timers.c,69 :: 		ms300++;
LHU	R2, Offset(Timers_ms300+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Timers_ms300+0)(GP)
;Timers.c,70 :: 		ms500++;
LHU	R2, Offset(Timers_ms500+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Timers_ms500+0)(GP)
;Timers.c,71 :: 		sec1++;
LHU	R2, Offset(Timers_sec1+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Timers_sec1+0)(GP)
;Timers.c,73 :: 		TMR.clock.B0 = !TMR.clock.B0;
LBU	R2, Offset(_TMR+0)(GP)
EXT	R2, R2, 0, 1
XORI	R3, R2, 1
LBU	R2, Offset(_TMR+0)(GP)
INS	R2, R3, 0, 1
SB	R2, Offset(_TMR+0)(GP)
;Timers.c,74 :: 		if(ms100 > 9){
ANDI	R2, R4, 65535
SLTIU	R2, R2, 10
BEQ	R2, R0, L__ClockPulse24
NOP	
J	L_ClockPulse0
NOP	
L__ClockPulse24:
;Timers.c,75 :: 		ms100 = 0;
SH	R0, Offset(Timers_ms100+0)(GP)
;Timers.c,76 :: 		TMR.clock.B1 = !TMR.clock.B1;
LBU	R2, Offset(_TMR+0)(GP)
EXT	R2, R2, 1, 1
XORI	R3, R2, 1
LBU	R2, Offset(_TMR+0)(GP)
INS	R2, R3, 1, 1
SB	R2, Offset(_TMR+0)(GP)
;Timers.c,77 :: 		}
L_ClockPulse0:
;Timers.c,78 :: 		if(ms300 > 29){
LHU	R2, Offset(Timers_ms300+0)(GP)
SLTIU	R2, R2, 30
BEQ	R2, R0, L__ClockPulse25
NOP	
J	L_ClockPulse1
NOP	
L__ClockPulse25:
;Timers.c,79 :: 		ms300 = 0;
SH	R0, Offset(Timers_ms300+0)(GP)
;Timers.c,80 :: 		TMR.clock.B2 = !TMR.clock.B2;
LBU	R2, Offset(_TMR+0)(GP)
EXT	R2, R2, 2, 1
XORI	R3, R2, 1
LBU	R2, Offset(_TMR+0)(GP)
INS	R2, R3, 2, 1
SB	R2, Offset(_TMR+0)(GP)
;Timers.c,81 :: 		}
L_ClockPulse1:
;Timers.c,82 :: 		if(ms500 > 49){
LHU	R2, Offset(Timers_ms500+0)(GP)
SLTIU	R2, R2, 50
BEQ	R2, R0, L__ClockPulse26
NOP	
J	L_ClockPulse2
NOP	
L__ClockPulse26:
;Timers.c,83 :: 		ms500 = 0;
SH	R0, Offset(Timers_ms500+0)(GP)
;Timers.c,84 :: 		TMR.clock.B3 = !TMR.clock.B3;
LBU	R2, Offset(_TMR+0)(GP)
EXT	R2, R2, 3, 1
XORI	R3, R2, 1
LBU	R2, Offset(_TMR+0)(GP)
INS	R2, R3, 3, 1
SB	R2, Offset(_TMR+0)(GP)
;Timers.c,85 :: 		}
L_ClockPulse2:
;Timers.c,86 :: 		if(sec1 > 99){
LHU	R2, Offset(Timers_sec1+0)(GP)
SLTIU	R2, R2, 100
BEQ	R2, R0, L__ClockPulse27
NOP	
J	L_ClockPulse3
NOP	
L__ClockPulse27:
;Timers.c,87 :: 		sec1 = 0;
SH	R0, Offset(Timers_sec1+0)(GP)
;Timers.c,88 :: 		TMR.clock.B4 = !TMR.clock.B4;
LBU	R2, Offset(_TMR+0)(GP)
EXT	R2, R2, 4, 1
XORI	R3, R2, 1
LBU	R2, Offset(_TMR+0)(GP)
INS	R2, R3, 4, 1
SB	R2, Offset(_TMR+0)(GP)
;Timers.c,89 :: 		}
L_ClockPulse3:
;Timers.c,91 :: 		}
L_end_ClockPulse:
JR	RA
NOP	
; end of _ClockPulse
_ResetSteppers:
;Timers.c,95 :: 		unsigned int ResetSteppers(unsigned int sec_to_disable,unsigned int last_sec_to_disable){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Timers.c,96 :: 		TMR.P1 = TMR. clock >> 4;  //1sec clock pulse
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
LBU	R2, Offset(_TMR+1)(GP)
INS	R2, R3, 0, 1
SB	R2, Offset(_TMR+1)(GP)
;Timers.c,97 :: 		if(last_sec_to_disable == 0)
ANDI	R2, R26, 65535
BEQ	R2, R0, L__ResetSteppers29
NOP	
J	L_ResetSteppers4
NOP	
L__ResetSteppers29:
;Timers.c,98 :: 		TMR.disable_cnt = 1;
ORI	R2, R0, 1
SH	R2, Offset(_TMR+2)(GP)
L_ResetSteppers4:
;Timers.c,99 :: 		if(TMR.P1 && !TMR.P2){
LBU	R2, Offset(_TMR+1)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__ResetSteppers31
NOP	
J	L__ResetSteppers16
NOP	
L__ResetSteppers31:
LBU	R2, Offset(_TMR+1)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__ResetSteppers32
NOP	
J	L__ResetSteppers15
NOP	
L__ResetSteppers32:
L__ResetSteppers14:
;Timers.c,100 :: 		TMR.P2 = 1;
LBU	R2, Offset(_TMR+1)(GP)
ORI	R2, R2, 2
SB	R2, Offset(_TMR+1)(GP)
;Timers.c,101 :: 		TMR.disable_cnt++;
LHU	R2, Offset(_TMR+2)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_TMR+2)(GP)
;Timers.c,102 :: 		if(TMR.disable_cnt > sec_to_disable)
ANDI	R3, R2, 65535
ANDI	R2, R25, 65535
SLTU	R2, R2, R3
BNE	R2, R0, L__ResetSteppers33
NOP	
J	L_ResetSteppers8
NOP	
L__ResetSteppers33:
;Timers.c,103 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
L_ResetSteppers8:
;Timers.c,104 :: 		}else if(!TMR.P1 && TMR.P2)
J	L_ResetSteppers9
NOP	
;Timers.c,99 :: 		if(TMR.P1 && !TMR.P2){
L__ResetSteppers16:
L__ResetSteppers15:
;Timers.c,104 :: 		}else if(!TMR.P1 && TMR.P2)
LBU	R2, Offset(_TMR+1)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__ResetSteppers34
NOP	
J	L__ResetSteppers18
NOP	
L__ResetSteppers34:
LBU	R2, Offset(_TMR+1)(GP)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__ResetSteppers36
NOP	
J	L__ResetSteppers17
NOP	
L__ResetSteppers36:
L__ResetSteppers13:
;Timers.c,105 :: 		TMR.P2 = 0;
LBU	R2, Offset(_TMR+1)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(_TMR+1)(GP)
;Timers.c,104 :: 		}else if(!TMR.P1 && TMR.P2)
L__ResetSteppers18:
L__ResetSteppers17:
;Timers.c,105 :: 		TMR.P2 = 0;
L_ResetSteppers9:
;Timers.c,107 :: 		return TMR.disable_cnt;
LHU	R2, Offset(_TMR+2)(GP)
;Timers.c,108 :: 		}
L_end_ResetSteppers:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _ResetSteppers
