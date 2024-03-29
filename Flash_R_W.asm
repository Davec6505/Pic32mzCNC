_NVMWriteWord:
;Flash_R_W.c,25 :: 		unsigned int NVMWriteWord (const void *address, unsigned long _data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,29 :: 		padd = *(unsigned long*)address & FLASH_PADDRESS_TRANSLATE;
SW	R25, 4(SP)
MOVZ	R2, R25, R0
LW	R3, 0(R2)
LUI	R2, 8191
ORI	R2, R2, 65535
AND	R2, R3, R2
;Flash_R_W.c,32 :: 		NVMADDR = padd;
SW	R2, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,37 :: 		NVMDATA0 = _data; // value
SW	R26, Offset(NVMDATA0+0)(GP)
;Flash_R_W.c,40 :: 		res = NVMUnlock (0x4001);
ORI	R25, R0, 16385
JAL	Flash_R_W_NVMUnlock+0
NOP	
SH	R2, Offset(_res+0)(GP)
;Flash_R_W.c,43 :: 		return res;
LHU	R2, Offset(_res+0)(GP)
;Flash_R_W.c,44 :: 		}
;Flash_R_W.c,43 :: 		return res;
;Flash_R_W.c,44 :: 		}
L_end_NVMWriteWord:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMWriteWord
_NVMWriteQuad:
;Flash_R_W.c,48 :: 		unsigned int NVMWriteQuad (const void *address, unsigned long *_data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,52 :: 		padd = *(unsigned long*)address & FLASH_PADDRESS_TRANSLATE;
SW	R25, 4(SP)
MOVZ	R2, R25, R0
LW	R3, 0(R2)
LUI	R2, 8191
ORI	R2, R2, 65535
AND	R2, R3, R2
;Flash_R_W.c,55 :: 		NVMADDR = padd;
SW	R2, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,58 :: 		NVMDATA0 = *(_data+0); // value
LW	R2, 0(R26)
SW	R2, Offset(NVMDATA0+0)(GP)
;Flash_R_W.c,59 :: 		NVMDATA1 = *(_data+1); // value
ADDIU	R2, R26, 4
LW	R2, 0(R2)
SW	R2, Offset(NVMDATA1+0)(GP)
;Flash_R_W.c,60 :: 		NVMDATA2 = *(_data+2); // value
ADDIU	R2, R26, 8
LW	R2, 0(R2)
SW	R2, Offset(NVMDATA2+0)(GP)
;Flash_R_W.c,61 :: 		NVMDATA3 = *(_data+3); // value
ADDIU	R2, R26, 12
LW	R2, 0(R2)
SW	R2, Offset(NVMDATA3+0)(GP)
;Flash_R_W.c,64 :: 		res = NVMUnlock (0x4002);
ORI	R25, R0, 16386
JAL	Flash_R_W_NVMUnlock+0
NOP	
SH	R2, Offset(_res+0)(GP)
;Flash_R_W.c,67 :: 		return res;
LHU	R2, Offset(_res+0)(GP)
;Flash_R_W.c,68 :: 		}
;Flash_R_W.c,67 :: 		return res;
;Flash_R_W.c,68 :: 		}
L_end_NVMWriteQuad:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMWriteQuad
_NVMWriteRow:
;Flash_R_W.c,73 :: 		unsigned int NVMWriteRow (const void *address, void *_data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,78 :: 		NVMADDR = *(unsigned long*)address & FLASH_PADDRESS_TRANSLATE;
SW	R25, 4(SP)
MOVZ	R2, R25, R0
LW	R3, 0(R2)
LUI	R2, 8191
ORI	R2, R2, 65535
AND	R2, R3, R2
SW	R2, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,83 :: 		NVMSRCADDR = (unsigned long)_data & FLASH_PADDRESS_TRANSLATE;
LUI	R2, 8191
ORI	R2, R2, 65535
AND	R2, R26, R2
SW	R2, Offset(NVMSRCADDR+0)(GP)
;Flash_R_W.c,90 :: 		res = NVMUnlock(0x4003);
ORI	R25, R0, 16387
JAL	Flash_R_W_NVMUnlock+0
NOP	
SH	R2, Offset(_res+0)(GP)
;Flash_R_W.c,93 :: 		return res;
LHU	R2, Offset(_res+0)(GP)
;Flash_R_W.c,94 :: 		}
;Flash_R_W.c,93 :: 		return res;
;Flash_R_W.c,94 :: 		}
L_end_NVMWriteRow:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMWriteRow
_NVMErasePage:
;Flash_R_W.c,98 :: 		unsigned int NVMErasePage(const void *address){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,102 :: 		NVMADDR = *(unsigned long*)address & FLASH_PADDRESS_TRANSLATE;
SW	R25, 4(SP)
MOVZ	R2, R25, R0
LW	R3, 0(R2)
LUI	R2, 8191
ORI	R2, R2, 65535
AND	R2, R3, R2
SW	R2, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,108 :: 		res = NVMUnlock(0x4004);
ORI	R25, R0, 16388
JAL	Flash_R_W_NVMUnlock+0
NOP	
SH	R2, Offset(_res+0)(GP)
;Flash_R_W.c,111 :: 		return res;
LHU	R2, Offset(_res+0)(GP)
;Flash_R_W.c,112 :: 		}
;Flash_R_W.c,111 :: 		return res;
;Flash_R_W.c,112 :: 		}
L_end_NVMErasePage:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMErasePage
Flash_R_W_NVMUnlock:
;Flash_R_W.c,116 :: 		static unsigned int NVMUnlock (unsigned long nvmop){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Flash_R_W.c,117 :: 		unsigned int I_status = 0;
;Flash_R_W.c,118 :: 		unsigned int dma_ = 0;
;Flash_R_W.c,120 :: 		NVMCON &= 0xFFF0;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 65520
SW	R2, Offset(NVMCON+0)(GP)
;Flash_R_W.c,121 :: 		NVMCON |=  nvmop; //Set NVMOP bits
LW	R2, Offset(NVMCON+0)(GP)
OR	R2, R2, R25
SW	R2, Offset(NVMCON+0)(GP)
;Flash_R_W.c,125 :: 		I_status = (unsigned int)DI();
DI	R30
SH	R30, 8(SP)
;Flash_R_W.c,128 :: 		dma_ = DMA_Suspend();
JAL	_DMA_Suspend+0
NOP	
;Flash_R_W.c,129 :: 		if(dma_){
BNE	R2, R0, L_Flash_R_W_NVMUnlock43
NOP	
J	L_Flash_R_W_NVMUnlock0
NOP	
L_Flash_R_W_NVMUnlock43:
;Flash_R_W.c,130 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Flash_R_W.c,131 :: 		while(DMA_Busy());
L_Flash_R_W_NVMUnlock1:
SW	R25, 4(SP)
JAL	_DMA_Busy+0
NOP	
LW	R25, 4(SP)
BNE	R2, R0, L_Flash_R_W_NVMUnlock45
NOP	
J	L_Flash_R_W_NVMUnlock2
NOP	
L_Flash_R_W_NVMUnlock45:
J	L_Flash_R_W_NVMUnlock1
NOP	
L_Flash_R_W_NVMUnlock2:
;Flash_R_W.c,132 :: 		}
L_Flash_R_W_NVMUnlock0:
;Flash_R_W.c,141 :: 		NVMKEY = 0x0U;
SW	R0, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,142 :: 		NVMKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,143 :: 		NVMKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,144 :: 		NVMCONSET = 0x8000;//1 << 15;
ORI	R2, R0, 32768
SW	R2, Offset(NVMCONSET+0)(GP)
;Flash_R_W.c,145 :: 		asm{NOP};
NOP	
;Flash_R_W.c,148 :: 		DMA_Resume();
SW	R25, 4(SP)
JAL	_DMA_Resume+0
NOP	
LW	R25, 4(SP)
;Flash_R_W.c,151 :: 		if (I_status != 0)
LHU	R2, 8(SP)
BNE	R2, R0, L_Flash_R_W_NVMUnlock47
NOP	
J	L_Flash_R_W_NVMUnlock3
NOP	
L_Flash_R_W_NVMUnlock47:
;Flash_R_W.c,152 :: 		EI();
EI	R30
L_Flash_R_W_NVMUnlock3:
;Flash_R_W.c,155 :: 		NVMCONCLR = 0x4000;
ORI	R2, R0, 16384
SW	R2, Offset(NVMCONCLR+0)(GP)
;Flash_R_W.c,159 :: 		while(NVM_WR_Wait());
L_Flash_R_W_NVMUnlock4:
JAL	Flash_R_W_NVM_WR_Wait+0
NOP	
BNE	R2, R0, L_Flash_R_W_NVMUnlock49
NOP	
J	L_Flash_R_W_NVMUnlock5
NOP	
L_Flash_R_W_NVMUnlock49:
J	L_Flash_R_W_NVMUnlock4
NOP	
L_Flash_R_W_NVMUnlock5:
;Flash_R_W.c,161 :: 		return (NVMCON & 0x3000)>>12;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 12288
SRL	R2, R2, 12
;Flash_R_W.c,162 :: 		}
L_end_NVMUnlock:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of Flash_R_W_NVMUnlock
_NVM_ERROR_Rst:
;Flash_R_W.c,167 :: 		unsigned int NVM_ERROR_Rst(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,168 :: 		unsigned int error= 0;
;Flash_R_W.c,169 :: 		NVMCON = 0;
SW	R0, Offset(NVMCON+0)(GP)
;Flash_R_W.c,172 :: 		NVM_WREN_Set();
JAL	Flash_R_W_NVM_WREN_Set+0
NOP	
;Flash_R_W.c,174 :: 		NVM_WR_Set();
JAL	Flash_R_W_NVM_WR_Set+0
NOP	
;Flash_R_W.c,176 :: 		while(NVM_WR_Wait());
L_NVM_ERROR_Rst6:
JAL	Flash_R_W_NVM_WR_Wait+0
NOP	
BNE	R2, R0, L__NVM_ERROR_Rst52
NOP	
J	L_NVM_ERROR_Rst7
NOP	
L__NVM_ERROR_Rst52:
J	L_NVM_ERROR_Rst6
NOP	
L_NVM_ERROR_Rst7:
;Flash_R_W.c,179 :: 		return (NVMCON & 0x3000)>>12;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 12288
SRL	R2, R2, 12
;Flash_R_W.c,180 :: 		}
L_end_NVM_ERROR_Rst:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _NVM_ERROR_Rst
Flash_R_W_NVM_WR_Set:
;Flash_R_W.c,184 :: 		static void NVM_WR_Set(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,186 :: 		NVMCON |= 1 << 15;
LW	R2, Offset(NVMCON+0)(GP)
ORI	R2, R2, 32768
SW	R2, Offset(NVMCON+0)(GP)
;Flash_R_W.c,187 :: 		while(!NVM_WR_Wait());
L_Flash_R_W_NVM_WR_Set8:
JAL	Flash_R_W_NVM_WR_Wait+0
NOP	
BEQ	R2, R0, L_Flash_R_W_NVM_WR_Set54
NOP	
J	L_Flash_R_W_NVM_WR_Set9
NOP	
L_Flash_R_W_NVM_WR_Set54:
J	L_Flash_R_W_NVM_WR_Set8
NOP	
L_Flash_R_W_NVM_WR_Set9:
;Flash_R_W.c,188 :: 		}
L_end_NVM_WR_Set:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Flash_R_W_NVM_WR_Set
Flash_R_W_NVM_WR_Wait:
;Flash_R_W.c,192 :: 		static unsigned int NVM_WR_Wait(){
;Flash_R_W.c,193 :: 		return (NVMCON & 0x8000) >> 15;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 32768
SRL	R2, R2, 15
;Flash_R_W.c,194 :: 		}
L_end_NVM_WR_Wait:
JR	RA
NOP	
; end of Flash_R_W_NVM_WR_Wait
Flash_R_W_NVM_WREN_Set:
;Flash_R_W.c,198 :: 		static void NVM_WREN_Set(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,199 :: 		NVMCON |= 1 << 14;
LW	R2, Offset(NVMCON+0)(GP)
ORI	R2, R2, 16384
SW	R2, Offset(NVMCON+0)(GP)
;Flash_R_W.c,200 :: 		while(!NVM_WREN_Wait());
L_Flash_R_W_NVM_WREN_Set10:
JAL	Flash_R_W_NVM_WREN_Wait+0
NOP	
BEQ	R2, R0, L_Flash_R_W_NVM_WREN_Set57
NOP	
J	L_Flash_R_W_NVM_WREN_Set11
NOP	
L_Flash_R_W_NVM_WREN_Set57:
J	L_Flash_R_W_NVM_WREN_Set10
NOP	
L_Flash_R_W_NVM_WREN_Set11:
;Flash_R_W.c,201 :: 		}
L_end_NVM_WREN_Set:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Flash_R_W_NVM_WREN_Set
Flash_R_W_NVM_WREN_Rst:
;Flash_R_W.c,205 :: 		static void NVM_WREN_Rst(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,206 :: 		NVMCONCLR |= 1<<14;
LW	R2, Offset(NVMCONCLR+0)(GP)
ORI	R2, R2, 16384
SW	R2, Offset(NVMCONCLR+0)(GP)
;Flash_R_W.c,207 :: 		while(NVM_WREN_Wait());
L_Flash_R_W_NVM_WREN_Rst12:
JAL	Flash_R_W_NVM_WREN_Wait+0
NOP	
BNE	R2, R0, L_Flash_R_W_NVM_WREN_Rst60
NOP	
J	L_Flash_R_W_NVM_WREN_Rst13
NOP	
L_Flash_R_W_NVM_WREN_Rst60:
J	L_Flash_R_W_NVM_WREN_Rst12
NOP	
L_Flash_R_W_NVM_WREN_Rst13:
;Flash_R_W.c,208 :: 		}
L_end_NVM_WREN_Rst:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Flash_R_W_NVM_WREN_Rst
Flash_R_W_NVM_WREN_Wait:
;Flash_R_W.c,212 :: 		static unsigned int NVM_WREN_Wait(){
;Flash_R_W.c,213 :: 		return (NVMCON & 0x4000) >> 14;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 16384
SRL	R2, R2, 14
;Flash_R_W.c,214 :: 		}
L_end_NVM_WREN_Wait:
JR	RA
NOP	
; end of Flash_R_W_NVM_WREN_Wait
_NVM_PWPAGE_Lock:
;Flash_R_W.c,218 :: 		void NVM_PWPAGE_Lock(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,221 :: 		unsigned int dma_susp=0;   // storage for current DMA state
; dma_susp start address is: 16 (R4)
MOVZ	R4, R0, R0
;Flash_R_W.c,223 :: 		I_status = (unsigned int)DI();
DI	R30
SH	R30, 4(SP)
; dma_susp end address is: 16 (R4)
ANDI	R3, R4, 65535
;Flash_R_W.c,226 :: 		while(!dma_susp)
L_NVM_PWPAGE_Lock14:
; dma_susp start address is: 12 (R3)
BEQ	R3, R0, L__NVM_PWPAGE_Lock63
NOP	
J	L_NVM_PWPAGE_Lock15
NOP	
L__NVM_PWPAGE_Lock63:
; dma_susp end address is: 12 (R3)
;Flash_R_W.c,227 :: 		dma_susp = DMA_Suspend();
JAL	_DMA_Suspend+0
NOP	
; dma_susp start address is: 16 (R4)
ANDI	R4, R2, 65535
ANDI	R3, R4, 65535
; dma_susp end address is: 16 (R4)
J	L_NVM_PWPAGE_Lock14
NOP	
L_NVM_PWPAGE_Lock15:
;Flash_R_W.c,230 :: 		NVMCONSET = 4;
; dma_susp start address is: 12 (R3)
ORI	R2, R0, 4
SW	R2, Offset(NVMCONSET+0)(GP)
;Flash_R_W.c,232 :: 		NVM_WREN_Set();
JAL	Flash_R_W_NVM_WREN_Set+0
NOP	
;Flash_R_W.c,236 :: 		NVMKEY = 0x0U;
SW	R0, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,237 :: 		NVMKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,238 :: 		NVMKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,239 :: 		NVMPWPCLR = 0x8000C000;
LUI	R2, 32768
ORI	R2, R2, 49152
SW	R2, Offset(NVMPWPCLR+0)(GP)
; dma_susp end address is: 12 (R3)
ANDI	R2, R3, 65535
;Flash_R_W.c,242 :: 		while(dma_susp){
L_NVM_PWPAGE_Lock16:
; dma_susp start address is: 8 (R2)
BNE	R2, R0, L__NVM_PWPAGE_Lock65
NOP	
J	L_NVM_PWPAGE_Lock17
NOP	
L__NVM_PWPAGE_Lock65:
; dma_susp end address is: 8 (R2)
;Flash_R_W.c,243 :: 		dma_susp = DMA_Resume();
JAL	_DMA_Resume+0
NOP	
; dma_susp start address is: 8 (R2)
;Flash_R_W.c,244 :: 		}
; dma_susp end address is: 8 (R2)
J	L_NVM_PWPAGE_Lock16
NOP	
L_NVM_PWPAGE_Lock17:
;Flash_R_W.c,247 :: 		if (I_status)
LHU	R2, 4(SP)
BNE	R2, R0, L__NVM_PWPAGE_Lock67
NOP	
J	L_NVM_PWPAGE_Lock18
NOP	
L__NVM_PWPAGE_Lock67:
;Flash_R_W.c,248 :: 		EI();
EI	R30
L_NVM_PWPAGE_Lock18:
;Flash_R_W.c,251 :: 		NVM_WREN_Rst();
JAL	Flash_R_W_NVM_WREN_Rst+0
NOP	
;Flash_R_W.c,254 :: 		}
L_end_NVM_PWPAGE_Lock:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVM_PWPAGE_Lock
_NVMReadRow:
;Flash_R_W.c,259 :: 		void NVMReadRow(unsigned long addr,unsigned long *buff){
;Flash_R_W.c,264 :: 		ptr = (unsigned long*)addr;
; ptr start address is: 16 (R4)
MOVZ	R4, R25, R0
;Flash_R_W.c,266 :: 		for(j = 0;j < 128;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
L_NVMReadRow19:
; j start address is: 20 (R5)
; ptr start address is: 16 (R4)
; ptr end address is: 16 (R4)
SLTIU	R2, R5, 128
BNE	R2, R0, L__NVMReadRow69
NOP	
J	L_NVMReadRow20
NOP	
L__NVMReadRow69:
; ptr end address is: 16 (R4)
;Flash_R_W.c,267 :: 		buff[j] = *(ptr+j);
; ptr start address is: 16 (R4)
SLL	R2, R5, 2
ADDU	R3, R26, R2
ADDU	R2, R4, R2
LW	R2, 0(R2)
SW	R2, 0(R3)
;Flash_R_W.c,266 :: 		for(j = 0;j < 128;j++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Flash_R_W.c,268 :: 		}
; ptr end address is: 16 (R4)
; j end address is: 20 (R5)
J	L_NVMReadRow19
NOP	
L_NVMReadRow20:
;Flash_R_W.c,269 :: 		}
L_end_NVMReadRow:
JR	RA
NOP	
; end of _NVMReadRow
_NVMReadQuad:
;Flash_R_W.c,273 :: 		void NVMReadQuad(unsigned long addr,unsigned long *words){
;Flash_R_W.c,277 :: 		ptr = (unsigned long*)addr;
; ptr start address is: 16 (R4)
MOVZ	R4, R25, R0
;Flash_R_W.c,279 :: 		for(j = 0;j < 4;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
L_NVMReadQuad22:
; j start address is: 20 (R5)
; ptr start address is: 16 (R4)
; ptr end address is: 16 (R4)
SLTIU	R2, R5, 4
BNE	R2, R0, L__NVMReadQuad71
NOP	
J	L_NVMReadQuad23
NOP	
L__NVMReadQuad71:
; ptr end address is: 16 (R4)
;Flash_R_W.c,280 :: 		words[j] = *(ptr+j);
; ptr start address is: 16 (R4)
SLL	R2, R5, 2
ADDU	R3, R26, R2
ADDU	R2, R4, R2
LW	R2, 0(R2)
SW	R2, 0(R3)
;Flash_R_W.c,279 :: 		for(j = 0;j < 4;j++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Flash_R_W.c,281 :: 		}
; ptr end address is: 16 (R4)
; j end address is: 20 (R5)
J	L_NVMReadQuad22
NOP	
L_NVMReadQuad23:
;Flash_R_W.c,282 :: 		}
L_end_NVMReadQuad:
JR	RA
NOP	
; end of _NVMReadQuad
_NVMReadWord:
;Flash_R_W.c,286 :: 		unsigned long NVMReadWord(void *addr){
;Flash_R_W.c,289 :: 		val = *(unsigned long*)addr;
LW	R2, 0(R25)
;Flash_R_W.c,291 :: 		return val;
;Flash_R_W.c,292 :: 		}
L_end_NVMReadWord:
JR	RA
NOP	
; end of _NVMReadWord
_Get_Address_Pval:
;Flash_R_W.c,296 :: 		unsigned long Get_Address_Pval(int recipe){
;Flash_R_W.c,297 :: 		unsigned long addr = 0;
; addr start address is: 16 (R4)
MOVZ	R4, R0, R0
;Flash_R_W.c,298 :: 		switch(recipe){
J	L_Get_Address_Pval25
NOP	
;Flash_R_W.c,299 :: 		case 0:break;
L_Get_Address_Pval27:
MOVZ	R2, R4, R0
; addr end address is: 16 (R4)
J	L_Get_Address_Pval26
NOP	
;Flash_R_W.c,300 :: 		case 1:addr =(unsigned long)FLASH_Settings_VAddr_P1;break;
L_Get_Address_Pval28:
; addr start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49152
; addr end address is: 8 (R2)
J	L_Get_Address_Pval26
NOP	
;Flash_R_W.c,301 :: 		case 2:addr =(unsigned long)FLASH_Settings_VAddr_P2;break;
L_Get_Address_Pval29:
; addr start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49168
; addr end address is: 8 (R2)
J	L_Get_Address_Pval26
NOP	
;Flash_R_W.c,302 :: 		case 3:addr =(unsigned long)FLASH_Settings_VAddr_P3;break;
L_Get_Address_Pval30:
; addr start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49184
; addr end address is: 8 (R2)
J	L_Get_Address_Pval26
NOP	
;Flash_R_W.c,303 :: 		case 4:addr =(unsigned long)FLASH_Settings_VAddr_P4;break;
L_Get_Address_Pval31:
; addr start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49200
; addr end address is: 8 (R2)
J	L_Get_Address_Pval26
NOP	
;Flash_R_W.c,304 :: 		case 5:addr =(unsigned long)FLASH_Settings_VAddr_P5;break;
L_Get_Address_Pval32:
; addr start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49216
; addr end address is: 8 (R2)
J	L_Get_Address_Pval26
NOP	
;Flash_R_W.c,305 :: 		case 6:addr =(unsigned long)FLASH_Settings_VAddr_P6;break;
L_Get_Address_Pval33:
; addr start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49232
; addr end address is: 8 (R2)
J	L_Get_Address_Pval26
NOP	
;Flash_R_W.c,306 :: 		case 7:addr =(unsigned long)FLASH_Settings_VAddr_P7;break;
L_Get_Address_Pval34:
; addr start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49248
; addr end address is: 8 (R2)
J	L_Get_Address_Pval26
NOP	
;Flash_R_W.c,307 :: 		case 8:addr =(unsigned long)FLASH_Settings_VAddr_P8;break;
L_Get_Address_Pval35:
; addr start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49264
; addr end address is: 8 (R2)
J	L_Get_Address_Pval26
NOP	
;Flash_R_W.c,308 :: 		case 9:addr =(unsigned long)FLASH_Settings_VAddr_P9;break;
L_Get_Address_Pval36:
; addr start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49280
; addr end address is: 8 (R2)
J	L_Get_Address_Pval26
NOP	
;Flash_R_W.c,309 :: 		}
L_Get_Address_Pval25:
; addr start address is: 16 (R4)
SEH	R2, R25
BNE	R2, R0, L__Get_Address_Pval75
NOP	
J	L_Get_Address_Pval27
NOP	
L__Get_Address_Pval75:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Get_Address_Pval77
NOP	
J	L_Get_Address_Pval28
NOP	
L__Get_Address_Pval77:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Get_Address_Pval79
NOP	
J	L_Get_Address_Pval29
NOP	
L__Get_Address_Pval79:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Get_Address_Pval81
NOP	
J	L_Get_Address_Pval30
NOP	
L__Get_Address_Pval81:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Get_Address_Pval83
NOP	
J	L_Get_Address_Pval31
NOP	
L__Get_Address_Pval83:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Get_Address_Pval85
NOP	
J	L_Get_Address_Pval32
NOP	
L__Get_Address_Pval85:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Get_Address_Pval87
NOP	
J	L_Get_Address_Pval33
NOP	
L__Get_Address_Pval87:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Get_Address_Pval89
NOP	
J	L_Get_Address_Pval34
NOP	
L__Get_Address_Pval89:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Get_Address_Pval91
NOP	
J	L_Get_Address_Pval35
NOP	
L__Get_Address_Pval91:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Get_Address_Pval93
NOP	
J	L_Get_Address_Pval36
NOP	
L__Get_Address_Pval93:
; addr end address is: 16 (R4)
MOVZ	R2, R4, R0
L_Get_Address_Pval26:
;Flash_R_W.c,310 :: 		return addr;
; addr start address is: 8 (R2)
; addr end address is: 8 (R2)
;Flash_R_W.c,311 :: 		}
L_end_Get_Address_Pval:
JR	RA
NOP	
; end of _Get_Address_Pval
