_NVMWriteWord:
;Flash_R_W.c,51 :: 		unsigned int NVMWriteWord (void *address, unsigned long _data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,55 :: 		NVMADDR = *(unsigned long*)address;
SW	R25, 4(SP)
LW	R2, 0(R25)
SW	R2, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,58 :: 		NVMDATA0 = _data; // value
SW	R26, Offset(NVMDATA0+0)(GP)
;Flash_R_W.c,60 :: 		res = NVMUnlock (0x4001);
ORI	R25, R0, 16385
JAL	Flash_R_W_NVMUnlock+0
NOP	
;Flash_R_W.c,63 :: 		return res;
;Flash_R_W.c,64 :: 		}
;Flash_R_W.c,63 :: 		return res;
;Flash_R_W.c,64 :: 		}
L_end_NVMWriteWord:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMWriteWord
_NVMWriteRow:
;Flash_R_W.c,67 :: 		unsigned int NVMWriteRow (void* address, void* _data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,70 :: 		NVMADDR = (unsigned long) address;
SW	R25, 4(SP)
SW	R25, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,73 :: 		NVMSRCADDR = (unsigned long) _data;
SW	R26, Offset(NVMSRCADDR+0)(GP)
;Flash_R_W.c,76 :: 		res = NVMUnlock(0x4003);
ORI	R25, R0, 16387
JAL	Flash_R_W_NVMUnlock+0
NOP	
;Flash_R_W.c,78 :: 		return res;
;Flash_R_W.c,79 :: 		}
;Flash_R_W.c,78 :: 		return res;
;Flash_R_W.c,79 :: 		}
L_end_NVMWriteRow:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMWriteRow
_NVMErasePage:
;Flash_R_W.c,81 :: 		unsigned int NVMErasePage(void* address){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,84 :: 		NVMADDR = (unsigned long) address;
SW	R25, 4(SP)
SW	R25, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,86 :: 		res = NVMUnlock(0x4004);
ORI	R25, R0, 16388
JAL	Flash_R_W_NVMUnlock+0
NOP	
;Flash_R_W.c,88 :: 		return res;
;Flash_R_W.c,89 :: 		}
;Flash_R_W.c,88 :: 		return res;
;Flash_R_W.c,89 :: 		}
L_end_NVMErasePage:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMErasePage
Flash_R_W_NVMUnlock:
;Flash_R_W.c,116 :: 		static unsigned int NVMUnlock (unsigned int nvmop){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Flash_R_W.c,118 :: 		unsigned int dma_susp=0;   // storage for current DMA state
MOVZ	R30, R0, R0
SH	R30, 8(SP)
;Flash_R_W.c,120 :: 		NVMCON = 0x0;
SW	R0, Offset(NVMCON+0)(GP)
;Flash_R_W.c,123 :: 		I_status = (unsigned int)DI();
DI	R30
SH	R30, 6(SP)
;Flash_R_W.c,126 :: 		while(!dma_susp){
L_Flash_R_W_NVMUnlock0:
LHU	R2, 8(SP)
BEQ	R2, R0, L_Flash_R_W_NVMUnlock22
NOP	
J	L_Flash_R_W_NVMUnlock1
NOP	
L_Flash_R_W_NVMUnlock22:
;Flash_R_W.c,127 :: 		dma_susp = DMA_Suspend();
SH	R25, 4(SP)
JAL	_DMA_Suspend+0
NOP	
LHU	R25, 4(SP)
SH	R2, 8(SP)
;Flash_R_W.c,128 :: 		}
J	L_Flash_R_W_NVMUnlock0
NOP	
L_Flash_R_W_NVMUnlock1:
;Flash_R_W.c,132 :: 		while(NVM_WREN_Rst());
L_Flash_R_W_NVMUnlock2:
JAL	Flash_R_W_NVM_WREN_Rst+0
NOP	
BNE	R2, R0, L_Flash_R_W_NVMUnlock24
NOP	
J	L_Flash_R_W_NVMUnlock3
NOP	
L_Flash_R_W_NVMUnlock24:
J	L_Flash_R_W_NVMUnlock2
NOP	
L_Flash_R_W_NVMUnlock3:
;Flash_R_W.c,133 :: 		NVMCON = nvmop & 0x00000007;
ANDI	R2, R25, 7
ANDI	R2, R2, 65535
SW	R2, Offset(NVMCON+0)(GP)
;Flash_R_W.c,135 :: 		NVMCON = nvmop & 0x00004007;
ANDI	R2, R25, 16391
ANDI	R2, R2, 65535
SW	R2, Offset(NVMCON+0)(GP)
;Flash_R_W.c,137 :: 		while(!NVM_WREN_Wait());
L_Flash_R_W_NVMUnlock4:
JAL	Flash_R_W_NVM_WREN_Wait+0
NOP	
BEQ	R2, R0, L_Flash_R_W_NVMUnlock25
NOP	
J	L_Flash_R_W_NVMUnlock5
NOP	
L_Flash_R_W_NVMUnlock25:
J	L_Flash_R_W_NVMUnlock4
NOP	
L_Flash_R_W_NVMUnlock5:
;Flash_R_W.c,140 :: 		NVMKEY = 0x0;
SW	R0, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,141 :: 		NVMKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,142 :: 		NVMKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,145 :: 		status = NVM_WR_Set();
JAL	Flash_R_W_NVM_WR_Set+0
NOP	
;Flash_R_W.c,149 :: 		while(NVM_WR_Wait());
L_Flash_R_W_NVMUnlock6:
JAL	Flash_R_W_NVM_WR_Wait+0
NOP	
BNE	R2, R0, L_Flash_R_W_NVMUnlock27
NOP	
J	L_Flash_R_W_NVMUnlock7
NOP	
L_Flash_R_W_NVMUnlock27:
J	L_Flash_R_W_NVMUnlock6
NOP	
L_Flash_R_W_NVMUnlock7:
;Flash_R_W.c,152 :: 		while(dma_susp){
L_Flash_R_W_NVMUnlock8:
LHU	R2, 8(SP)
BNE	R2, R0, L_Flash_R_W_NVMUnlock29
NOP	
J	L_Flash_R_W_NVMUnlock9
NOP	
L_Flash_R_W_NVMUnlock29:
;Flash_R_W.c,153 :: 		dma_susp = DMA_Resume();
SH	R25, 4(SP)
JAL	_DMA_Resume+0
NOP	
LHU	R25, 4(SP)
SH	R2, 8(SP)
;Flash_R_W.c,154 :: 		}
J	L_Flash_R_W_NVMUnlock8
NOP	
L_Flash_R_W_NVMUnlock9:
;Flash_R_W.c,157 :: 		if (I_status)
LHU	R2, 6(SP)
BNE	R2, R0, L_Flash_R_W_NVMUnlock31
NOP	
J	L_Flash_R_W_NVMUnlock10
NOP	
L_Flash_R_W_NVMUnlock31:
;Flash_R_W.c,158 :: 		EI();
EI	R30
L_Flash_R_W_NVMUnlock10:
;Flash_R_W.c,161 :: 		NVMCONCLR |= 0x0004000;
LW	R2, Offset(NVMCONCLR+0)(GP)
ORI	R2, R2, 16384
SW	R2, Offset(NVMCONCLR+0)(GP)
;Flash_R_W.c,164 :: 		return (NVMCON & 0x3000)>>12;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 12288
SRL	R2, R2, 12
;Flash_R_W.c,165 :: 		}
L_end_NVMUnlock:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of Flash_R_W_NVMUnlock
Flash_R_W_NVM_WR_Set:
;Flash_R_W.c,170 :: 		static unsigned int NVM_WR_Set(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,172 :: 		NVMCONSET |= 1 << 15;
LW	R2, Offset(NVMCONSET+0)(GP)
ORI	R2, R2, 32768
SW	R2, Offset(NVMCONSET+0)(GP)
;Flash_R_W.c,173 :: 		return NVM_WR_Wait();
JAL	Flash_R_W_NVM_WR_Wait+0
NOP	
;Flash_R_W.c,174 :: 		}
L_end_NVM_WR_Set:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Flash_R_W_NVM_WR_Set
Flash_R_W_NVM_WR_Wait:
;Flash_R_W.c,177 :: 		static unsigned int NVM_WR_Wait(){
;Flash_R_W.c,178 :: 		return (NVMCON & 0x8000) >> 15;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 32768
SRL	R2, R2, 15
;Flash_R_W.c,179 :: 		}
L_end_NVM_WR_Wait:
JR	RA
NOP	
; end of Flash_R_W_NVM_WR_Wait
Flash_R_W_NVM_WREN_Rst:
;Flash_R_W.c,181 :: 		static unsigned int NVM_WREN_Rst(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,182 :: 		NVMCONCLR |= 1<<14;
LW	R2, Offset(NVMCONCLR+0)(GP)
ORI	R2, R2, 16384
SW	R2, Offset(NVMCONCLR+0)(GP)
;Flash_R_W.c,183 :: 		while(NVM_WREN_Wait());
L_Flash_R_W_NVM_WREN_Rst11:
JAL	Flash_R_W_NVM_WREN_Wait+0
NOP	
BNE	R2, R0, L_Flash_R_W_NVM_WREN_Rst36
NOP	
J	L_Flash_R_W_NVM_WREN_Rst12
NOP	
L_Flash_R_W_NVM_WREN_Rst36:
J	L_Flash_R_W_NVM_WREN_Rst11
NOP	
L_Flash_R_W_NVM_WREN_Rst12:
;Flash_R_W.c,184 :: 		return (NVMCON & 4000)>>14;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 4000
SRL	R2, R2, 14
;Flash_R_W.c,185 :: 		}
L_end_NVM_WREN_Rst:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Flash_R_W_NVM_WREN_Rst
Flash_R_W_NVM_WREN_Wait:
;Flash_R_W.c,189 :: 		static unsigned int NVM_WREN_Wait(){
;Flash_R_W.c,190 :: 		return (NVMCON & 0x4000) >> 14;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 16384
SRL	R2, R2, 14
;Flash_R_W.c,191 :: 		}
L_end_NVM_WREN_Wait:
JR	RA
NOP	
; end of Flash_R_W_NVM_WREN_Wait
_ReadFlashWord:
;Flash_R_W.c,196 :: 		unsigned long ReadFlashWord(void *addr){
;Flash_R_W.c,199 :: 		val = *((unsigned long*)addr);
LW	R2, 0(R25)
;Flash_R_W.c,201 :: 		return val;
;Flash_R_W.c,202 :: 		}
L_end_ReadFlashWord:
JR	RA
NOP	
; end of _ReadFlashWord
_NVMRead:
;Flash_R_W.c,204 :: 		unsigned long NVMRead(unsigned long addr){
ADDIU	SP, SP, -544
SW	RA, 0(SP)
;Flash_R_W.c,205 :: 		unsigned char buff[512] = {0};
ADDIU	R23, SP, 31
ADDIU	R22, R23, 512
LUI	R24, hi_addr(?ICSNVMRead_buff_L0+0)
ORI	R24, R24, lo_addr(?ICSNVMRead_buff_L0+0)
JAL	___CC2DW+0
NOP	
;Flash_R_W.c,210 :: 		ptr = (unsigned char*)addr;
SW	R25, 12(SP)
;Flash_R_W.c,213 :: 		for(j = 0;j < 512;j++){
; j start address is: 16 (R4)
MOVZ	R4, R0, R0
; j end address is: 16 (R4)
ANDI	R5, R4, 65535
L_NVMRead13:
; j start address is: 20 (R5)
ANDI	R2, R5, 65535
SLTIU	R2, R2, 512
BNE	R2, R0, L__NVMRead40
NOP	
J	L_NVMRead14
NOP	
L__NVMRead40:
;Flash_R_W.c,214 :: 		buff[j] = ptr[j];
ADDIU	R3, SP, 31
ANDI	R2, R5, 65535
ADDU	R4, R3, R2
ANDI	R3, R5, 65535
LW	R2, 12(SP)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
SB	R2, 0(R4)
; j end address is: 20 (R5)
ANDI	R4, R5, 65535
;Flash_R_W.c,215 :: 		while(DMA_IsOn(1));
L_NVMRead16:
; j start address is: 16 (R4)
SH	R4, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 8(SP)
LHU	R4, 4(SP)
BNE	R2, R0, L__NVMRead42
NOP	
J	L_NVMRead17
NOP	
L__NVMRead42:
J	L_NVMRead16
NOP	
L_NVMRead17:
;Flash_R_W.c,216 :: 		dma_printf("buff[%d]:= %d\n",j,(int)buff[j]);
ADDIU	R3, SP, 31
ANDI	R2, R4, 65535
ADDU	R2, R3, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ADDIU	R23, SP, 16
ADDIU	R22, R23, 15
LUI	R24, hi_addr(?ICS?lstr1_Flash_R_W+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Flash_R_W+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 16
SH	R4, 4(SP)
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R3, 8(SP)
SH	R4, 4(SP)
SW	R2, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
LHU	R4, 4(SP)
;Flash_R_W.c,213 :: 		for(j = 0;j < 512;j++){
ADDIU	R2, R4, 1
ANDI	R4, R2, 65535
;Flash_R_W.c,217 :: 		}
ANDI	R5, R4, 65535
; j end address is: 16 (R4)
J	L_NVMRead13
NOP	
L_NVMRead14:
;Flash_R_W.c,224 :: 		}
L_end_NVMRead:
LW	RA, 0(SP)
ADDIU	SP, SP, 544
JR	RA
NOP	
; end of _NVMRead
