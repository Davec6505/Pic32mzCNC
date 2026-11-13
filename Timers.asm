_InitTimer1:
;Timers.c,12 :: 		void InitTimer1(){
;Timers.c,14 :: 		Clock = ClockPulse;
LUI	R2, hi_addr(Timers_ClockPulse+0)
ORI	R2, R2, lo_addr(Timers_ClockPulse+0)
SW	R2, Offset(_Clock+0)(GP)
;Timers.c,16 :: 		TMR.Reset = ResetSteppers;
LUI	R2, hi_addr(_ResetSteppers+0)
ORI	R2, R2, lo_addr(_ResetSteppers+0)
SW	R2, Offset(_TMR+4)(GP)
;Timers.c,18 :: 		T1CON         = 0x8010;
ORI	R2, R0, 32784
SW	R2, Offset(T1CON+0)(GP)
;Timers.c,20 :: 		IPC1SET       = 0x1A;
ORI	R2, R0, 26
SW	R2, Offset(IPC1SET+0)(GP)
;Timers.c,22 :: 		IEC0       |= 1<<4;
LW	R2, Offset(IEC0+0)(GP)
ORI	R2, R2, 16
SW	R2, Offset(IEC0+0)(GP)
;Timers.c,24 :: 		IFS0       |= ~(1<<4);
LW	R3, Offset(IFS0+0)(GP)
LUI	R2, 65535
ORI	R2, R2, 65519
OR	R2, R3, R2
SW	R2, Offset(IFS0+0)(GP)
;Timers.c,26 :: 		PR1           = 62500;
ORI	R2, R0, 62500
SW	R2, Offset(PR1+0)(GP)
;Timers.c,27 :: 		TMR1          = 0;
SW	R0, Offset(TMR1+0)(GP)
;Timers.c,29 :: 		}
L_end_InitTimer1:
JR	RA
NOP	
; end of _InitTimer1
_InitTimer8:
;Timers.c,34 :: 		void InitTimer8(){
;Timers.c,35 :: 		T8CON            = 0x0000;
SW	R0, Offset(T8CON+0)(GP)
;Timers.c,36 :: 		T8IP0_bit        = 1;
LUI	R2, BitMask(T8IP0_bit+0)
ORI	R2, R2, BitMask(T8IP0_bit+0)
_SX	
;Timers.c,37 :: 		T8IP1_bit        = 1;
LUI	R2, BitMask(T8IP1_bit+0)
ORI	R2, R2, BitMask(T8IP1_bit+0)
_SX	
;Timers.c,38 :: 		T8IP2_bit        = 0;
LUI	R2, BitMask(T8IP2_bit+0)
ORI	R2, R2, BitMask(T8IP2_bit+0)
_SX	
;Timers.c,39 :: 		T8IS0_bit        = 0;
LUI	R2, BitMask(T8IS0_bit+0)
ORI	R2, R2, BitMask(T8IS0_bit+0)
_SX	
;Timers.c,40 :: 		T8IS1_bit        = 1;
LUI	R2, BitMask(T8IS1_bit+0)
ORI	R2, R2, BitMask(T8IS1_bit+0)
_SX	
;Timers.c,43 :: 		T8IF_bit         = 0;
LUI	R2, BitMask(T8IF_bit+0)
ORI	R2, R2, BitMask(T8IF_bit+0)
_SX	
;Timers.c,44 :: 		T8IE_bit         = 1;
LUI	R2, BitMask(T8IE_bit+0)
ORI	R2, R2, BitMask(T8IE_bit+0)
_SX	
;Timers.c,45 :: 		PR8              = 500;
ORI	R2, R0, 500
SW	R2, Offset(PR8+0)(GP)
;Timers.c,46 :: 		TMR8             = 0;
SW	R0, Offset(TMR8+0)(GP)
;Timers.c,47 :: 		}
L_end_InitTimer8:
JR	RA
NOP	
; end of _InitTimer8
_Timer8_Start:
;Timers.c,49 :: 		void Timer8_Start(){
;Timers.c,50 :: 		T8CONbits.ON = 1;
ORI	R2, R0, 32768
SW	R2, Offset(T8CONbits+8)(GP)
;Timers.c,51 :: 		}
L_end_Timer8_Start:
JR	RA
NOP	
; end of _Timer8_Start
_Timer8_Stop:
;Timers.c,53 :: 		void Timer8_Stop(){
;Timers.c,54 :: 		T8CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(T8CONbits+4)(GP)
;Timers.c,55 :: 		}
L_end_Timer8_Stop:
JR	RA
NOP	
; end of _Timer8_Stop
_Timer8CallbackInitialize:
;Timers.c,57 :: 		void Timer8CallbackInitialize(void (*callback)()){
;Timers.c,58 :: 		DDS_Tick = callback;
SW	R25, Offset(_DDS_Tick+0)(GP)
;Timers.c,59 :: 		}
L_end_Timer8CallbackInitialize:
JR	RA
NOP	
; end of _Timer8CallbackInitialize
_Timer1Interrupt:
;Timers.c,67 :: 		void Timer1Interrupt() iv IVT_TIMER_1 ilevel 6 ics ICS_SRS {
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
;Timers.c,68 :: 		T1IF_bit  = 0;
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
;Timers.c,70 :: 		Clock();
LW	R30, Offset(_Clock+0)(GP)
JALR	RA, R30
NOP	
;Timers.c,71 :: 		}
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
;Timers.c,75 :: 		void Timer8Interrupt() iv IVT_TIMER_8 ilevel 3 ics ICS_SRS {
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
;Timers.c,77 :: 		T8IF_bit  = 0;
LUI	R2, BitMask(T8IF_bit+0)
ORI	R2, R2, BitMask(T8IF_bit+0)
_SX	
;Timers.c,78 :: 		if(DDS_Tick) DDS_Tick();
LW	R2, Offset(_DDS_Tick+0)(GP)
BNE	R2, R0, L__Timer8Interrupt28
NOP	
J	L_Timer8Interrupt0
NOP	
L__Timer8Interrupt28:
LW	R30, Offset(_DDS_Tick+0)(GP)
JALR	RA, R30
NOP	
L_Timer8Interrupt0:
;Timers.c,80 :: 		}
L_end_Timer8Interrupt:
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
; end of _Timer8Interrupt
Timers_ClockPulse:
;Timers.c,84 :: 		static void ClockPulse(){
;Timers.c,85 :: 		ms100++;
LHU	R2, Offset(Timers_ms100+0)(GP)
ADDIU	R4, R2, 1
SH	R4, Offset(Timers_ms100+0)(GP)
;Timers.c,86 :: 		ms300++;
LHU	R2, Offset(Timers_ms300+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Timers_ms300+0)(GP)
;Timers.c,87 :: 		ms500++;
LHU	R2, Offset(Timers_ms500+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Timers_ms500+0)(GP)
;Timers.c,88 :: 		sec1++;
LHU	R2, Offset(Timers_sec1+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Timers_sec1+0)(GP)
;Timers.c,90 :: 		TMR.clock.B0 = !TMR.clock.B0;
LBU	R2, Offset(_TMR+0)(GP)
EXT	R2, R2, 0, 1
XORI	R3, R2, 1
LBU	R2, Offset(_TMR+0)(GP)
INS	R2, R3, 0, 1
SB	R2, Offset(_TMR+0)(GP)
;Timers.c,91 :: 		if(ms100 > 9){
ANDI	R2, R4, 65535
SLTIU	R2, R2, 10
BEQ	R2, R0, L_Timers_ClockPulse30
NOP	
J	L_Timers_ClockPulse1
NOP	
L_Timers_ClockPulse30:
;Timers.c,92 :: 		ms100 = 0;
SH	R0, Offset(Timers_ms100+0)(GP)
;Timers.c,93 :: 		TMR.clock.B1 = !TMR.clock.B1;
LBU	R2, Offset(_TMR+0)(GP)
EXT	R2, R2, 1, 1
XORI	R3, R2, 1
LBU	R2, Offset(_TMR+0)(GP)
INS	R2, R3, 1, 1
SB	R2, Offset(_TMR+0)(GP)
;Timers.c,94 :: 		}
L_Timers_ClockPulse1:
;Timers.c,95 :: 		if(ms300 > 29){
LHU	R2, Offset(Timers_ms300+0)(GP)
SLTIU	R2, R2, 30
BEQ	R2, R0, L_Timers_ClockPulse31
NOP	
J	L_Timers_ClockPulse2
NOP	
L_Timers_ClockPulse31:
;Timers.c,96 :: 		ms300 = 0;
SH	R0, Offset(Timers_ms300+0)(GP)
;Timers.c,97 :: 		TMR.clock.B2 = !TMR.clock.B2;
LBU	R2, Offset(_TMR+0)(GP)
EXT	R2, R2, 2, 1
XORI	R3, R2, 1
LBU	R2, Offset(_TMR+0)(GP)
INS	R2, R3, 2, 1
SB	R2, Offset(_TMR+0)(GP)
;Timers.c,98 :: 		}
L_Timers_ClockPulse2:
;Timers.c,99 :: 		if(ms500 > 49){
LHU	R2, Offset(Timers_ms500+0)(GP)
SLTIU	R2, R2, 50
BEQ	R2, R0, L_Timers_ClockPulse32
NOP	
J	L_Timers_ClockPulse3
NOP	
L_Timers_ClockPulse32:
;Timers.c,100 :: 		ms500 = 0;
SH	R0, Offset(Timers_ms500+0)(GP)
;Timers.c,101 :: 		TMR.clock.B3 = !TMR.clock.B3;
LBU	R2, Offset(_TMR+0)(GP)
EXT	R2, R2, 3, 1
XORI	R3, R2, 1
LBU	R2, Offset(_TMR+0)(GP)
INS	R2, R3, 3, 1
SB	R2, Offset(_TMR+0)(GP)
;Timers.c,102 :: 		}
L_Timers_ClockPulse3:
;Timers.c,103 :: 		if(sec1 > 99){
LHU	R2, Offset(Timers_sec1+0)(GP)
SLTIU	R2, R2, 100
BEQ	R2, R0, L_Timers_ClockPulse33
NOP	
J	L_Timers_ClockPulse4
NOP	
L_Timers_ClockPulse33:
;Timers.c,104 :: 		sec1 = 0;
SH	R0, Offset(Timers_sec1+0)(GP)
;Timers.c,105 :: 		TMR.clock.B4 = !TMR.clock.B4;
LBU	R2, Offset(_TMR+0)(GP)
EXT	R2, R2, 4, 1
XORI	R3, R2, 1
LBU	R2, Offset(_TMR+0)(GP)
INS	R2, R3, 4, 1
SB	R2, Offset(_TMR+0)(GP)
;Timers.c,106 :: 		}
L_Timers_ClockPulse4:
;Timers.c,108 :: 		}
L_end_ClockPulse:
JR	RA
NOP	
; end of Timers_ClockPulse
_ResetSteppers:
;Timers.c,112 :: 		unsigned int ResetSteppers(unsigned int sec_to_disable,unsigned int last_sec_to_disable){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Timers.c,113 :: 		TMR.P1 = TMR. clock >> 4;  //1sec clock pulse
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
LBU	R2, Offset(_TMR+1)(GP)
INS	R2, R3, 0, 1
SB	R2, Offset(_TMR+1)(GP)
;Timers.c,114 :: 		if(last_sec_to_disable == 0)
ANDI	R2, R26, 65535
BEQ	R2, R0, L__ResetSteppers35
NOP	
J	L_ResetSteppers5
NOP	
L__ResetSteppers35:
;Timers.c,115 :: 		TMR.disable_cnt = 1;
ORI	R2, R0, 1
SH	R2, Offset(_TMR+2)(GP)
L_ResetSteppers5:
;Timers.c,116 :: 		if(TMR.P1 && !TMR.P2){
LBU	R2, Offset(_TMR+1)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__ResetSteppers37
NOP	
J	L__ResetSteppers17
NOP	
L__ResetSteppers37:
LBU	R2, Offset(_TMR+1)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__ResetSteppers38
NOP	
J	L__ResetSteppers16
NOP	
L__ResetSteppers38:
L__ResetSteppers15:
;Timers.c,117 :: 		TMR.P2 = 1;
LBU	R2, Offset(_TMR+1)(GP)
ORI	R2, R2, 2
SB	R2, Offset(_TMR+1)(GP)
;Timers.c,118 :: 		TMR.disable_cnt++;
LHU	R2, Offset(_TMR+2)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_TMR+2)(GP)
;Timers.c,119 :: 		if(TMR.disable_cnt > sec_to_disable){
ANDI	R3, R2, 65535
ANDI	R2, R25, 65535
SLTU	R2, R2, R3
BNE	R2, R0, L__ResetSteppers39
NOP	
J	L_ResetSteppers9
NOP	
L__ResetSteppers39:
;Timers.c,120 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Timers.c,121 :: 		}
L_ResetSteppers9:
;Timers.c,122 :: 		}else if(!TMR.P1 && TMR.P2)
J	L_ResetSteppers10
NOP	
;Timers.c,116 :: 		if(TMR.P1 && !TMR.P2){
L__ResetSteppers17:
L__ResetSteppers16:
;Timers.c,122 :: 		}else if(!TMR.P1 && TMR.P2)
LBU	R2, Offset(_TMR+1)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__ResetSteppers40
NOP	
J	L__ResetSteppers19
NOP	
L__ResetSteppers40:
LBU	R2, Offset(_TMR+1)(GP)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__ResetSteppers42
NOP	
J	L__ResetSteppers18
NOP	
L__ResetSteppers42:
L__ResetSteppers14:
;Timers.c,123 :: 		TMR.P2 = 0;
LBU	R2, Offset(_TMR+1)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(_TMR+1)(GP)
;Timers.c,122 :: 		}else if(!TMR.P1 && TMR.P2)
L__ResetSteppers19:
L__ResetSteppers18:
;Timers.c,123 :: 		TMR.P2 = 0;
L_ResetSteppers10:
;Timers.c,125 :: 		return TMR.disable_cnt;
LHU	R2, Offset(_TMR+2)(GP)
;Timers.c,126 :: 		}
L_end_ResetSteppers:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _ResetSteppers
