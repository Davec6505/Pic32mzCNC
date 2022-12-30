_NVMWriteWord:
;Flash_R_W.c,50 :: 		unsigned int NVMWriteWord (void* address, unsigned long _data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,54 :: 		NVMADDR = (unsigned long) address;
SW	R25, 4(SP)
SW	R25, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,57 :: 		NVMDATA0 = _data; // value
SW	R26, Offset(NVMDATA0+0)(GP)
;Flash_R_W.c,59 :: 		res = NVMUnlock (0x4001);
ORI	R25, R0, 16385
JAL	_NVMUnlock+0
NOP	
;Flash_R_W.c,62 :: 		return res;
;Flash_R_W.c,63 :: 		}
;Flash_R_W.c,62 :: 		return res;
;Flash_R_W.c,63 :: 		}
L_end_NVMWriteWord:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMWriteWord
_NVMWriteRow:
;Flash_R_W.c,66 :: 		unsigned int NVMWriteRow (void* address, void* _data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,69 :: 		NVMADDR = (unsigned long) address;
SW	R25, 4(SP)
SW	R25, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,72 :: 		NVMSRCADDR = (unsigned long) _data;
SW	R26, Offset(NVMSRCADDR+0)(GP)
;Flash_R_W.c,75 :: 		res = NVMUnlock(0x4003);
ORI	R25, R0, 16387
JAL	_NVMUnlock+0
NOP	
;Flash_R_W.c,77 :: 		return res;
;Flash_R_W.c,78 :: 		}
;Flash_R_W.c,77 :: 		return res;
;Flash_R_W.c,78 :: 		}
L_end_NVMWriteRow:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMWriteRow
_NVMErasePage:
;Flash_R_W.c,80 :: 		unsigned int NVMErasePage(void* address){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,83 :: 		NVMADDR = (unsigned long) address;
SW	R25, 4(SP)
SW	R25, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,85 :: 		res = NVMUnlock(0x4004);
ORI	R25, R0, 16388
JAL	_NVMUnlock+0
NOP	
;Flash_R_W.c,87 :: 		return res;
;Flash_R_W.c,88 :: 		}
;Flash_R_W.c,87 :: 		return res;
;Flash_R_W.c,88 :: 		}
L_end_NVMErasePage:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMErasePage
_NVMUnlock:
;Flash_R_W.c,115 :: 		unsigned int NVMUnlock (unsigned int nvmop){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Flash_R_W.c,119 :: 		status = (unsigned int)DI();
DI	R30
SH	R30, 6(SP)
;Flash_R_W.c,120 :: 		while(!dma_susp0 && !dma_susp1){
L_NVMUnlock0:
LHU	R2, 8(SP)
BEQ	R2, R0, L__NVMUnlock17
NOP	
J	L__NVMUnlock12
NOP	
L__NVMUnlock17:
LHU	R2, 10(SP)
BEQ	R2, R0, L__NVMUnlock18
NOP	
J	L__NVMUnlock11
NOP	
L__NVMUnlock18:
L__NVMUnlock10:
;Flash_R_W.c,121 :: 		dma_susp0 = DMA_Suspend(0);
SH	R25, 4(SP)
MOVZ	R25, R0, R0
JAL	_DMA_Suspend+0
NOP	
SH	R2, 8(SP)
;Flash_R_W.c,122 :: 		dma_susp1 =DMA_Suspend(1);
ORI	R25, R0, 1
JAL	_DMA_Suspend+0
NOP	
LHU	R25, 4(SP)
SH	R2, 10(SP)
;Flash_R_W.c,123 :: 		}
J	L_NVMUnlock0
NOP	
;Flash_R_W.c,120 :: 		while(!dma_susp0 && !dma_susp1){
L__NVMUnlock12:
L__NVMUnlock11:
;Flash_R_W.c,126 :: 		NVMCON = nvmop & 0x00004007;
ANDI	R2, R25, 16391
ANDI	R2, R2, 65535
SW	R2, Offset(NVMCON+0)(GP)
;Flash_R_W.c,129 :: 		Delay_ms(5);
LUI	R24, 5
ORI	R24, R24, 5652
L_NVMUnlock4:
ADDIU	R24, R24, -1
BNE	R24, R0, L_NVMUnlock4
NOP	
NOP	
NOP	
;Flash_R_W.c,131 :: 		NVMKEY = 0x0;
SW	R0, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,132 :: 		NVMKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,133 :: 		NVMKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,136 :: 		NVMCONSET = 1 << 15;
ORI	R2, R0, 32768
SW	R2, Offset(NVMCONSET+0)(GP)
;Flash_R_W.c,139 :: 		while( NVMWait());
L_NVMUnlock6:
JAL	_NVMWait+0
NOP	
BNE	R2, R0, L__NVMUnlock20
NOP	
J	L_NVMUnlock7
NOP	
L__NVMUnlock20:
J	L_NVMUnlock6
NOP	
L_NVMUnlock7:
;Flash_R_W.c,142 :: 		DMA_Resume(0);
SH	R25, 4(SP)
MOVZ	R25, R0, R0
JAL	_DMA_Resume+0
NOP	
;Flash_R_W.c,143 :: 		DMA_Resume(1);
ORI	R25, R0, 1
JAL	_DMA_Resume+0
NOP	
LHU	R25, 4(SP)
;Flash_R_W.c,146 :: 		if (status & 0x0001)
LHU	R2, 6(SP)
ANDI	R2, R2, 1
BNE	R2, R0, L__NVMUnlock22
NOP	
J	L_NVMUnlock8
NOP	
L__NVMUnlock22:
;Flash_R_W.c,147 :: 		EI();
EI	R30
J	L_NVMUnlock9
NOP	
L_NVMUnlock8:
;Flash_R_W.c,149 :: 		DI();  //set an alarm here
DI	R30
L_NVMUnlock9:
;Flash_R_W.c,152 :: 		NVMCONCLR = 0x0004000;
ORI	R2, R0, 16384
SW	R2, Offset(NVMCONCLR+0)(GP)
;Flash_R_W.c,155 :: 		return (NVMCON & 0x3000);
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 12288
;Flash_R_W.c,156 :: 		}
L_end_NVMUnlock:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _NVMUnlock
_NVMWait:
;Flash_R_W.c,160 :: 		unsigned int NVMWait(){
;Flash_R_W.c,161 :: 		return (NVMCON & 0x8000) >> 15;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 32768
SRL	R2, R2, 15
;Flash_R_W.c,162 :: 		}
L_end_NVMWait:
JR	RA
NOP	
; end of _NVMWait
_ReadFlashWord:
;Flash_R_W.c,167 :: 		unsigned long ReadFlashWord(const unsigned long *addr){
;Flash_R_W.c,170 :: 		add = *addr;
LW	R2, 0(R25)
;Flash_R_W.c,171 :: 		val = ( *((unsigned long*)(add)) ); //<=== CRASHES HERE
LW	R2, 0(R2)
;Flash_R_W.c,173 :: 		return val;//0xafffafff;
;Flash_R_W.c,174 :: 		}
L_end_ReadFlashWord:
JR	RA
NOP	
; end of _ReadFlashWord
