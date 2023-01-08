_NVMWriteWord:
;Flash_R_W.c,25 :: 		unsigned int NVMWriteWord (void *address, unsigned long _data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,30 :: 		padd = *(unsigned long*)address & FLASH_PADDRESS_TRANSLATE;
SW	R25, 4(SP)
LW	R3, 0(R25)
LUI	R2, 8191
ORI	R2, R2, 65535
AND	R2, R3, R2
;Flash_R_W.c,33 :: 		NVMADDR = padd;
SW	R2, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,38 :: 		NVMDATA0 = _data; // value
SW	R26, Offset(NVMDATA0+0)(GP)
;Flash_R_W.c,41 :: 		res = NVMUnlock (0x4001);
ORI	R25, R0, 16385
JAL	Flash_R_W_NVMUnlock+0
NOP	
;Flash_R_W.c,44 :: 		return res;
;Flash_R_W.c,45 :: 		}
;Flash_R_W.c,44 :: 		return res;
;Flash_R_W.c,45 :: 		}
L_end_NVMWriteWord:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMWriteWord
_NVMWriteQuad:
;Flash_R_W.c,49 :: 		unsigned int NVMWriteQuad (void *address, unsigned long *_data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,54 :: 		padd = *(unsigned long*)address & FLASH_PADDRESS_TRANSLATE;
SW	R25, 4(SP)
LW	R3, 0(R25)
LUI	R2, 8191
ORI	R2, R2, 65535
AND	R2, R3, R2
;Flash_R_W.c,57 :: 		NVMADDR = padd;
SW	R2, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,60 :: 		NVMDATA0 = *(_data+0); // value
LW	R2, 0(R26)
SW	R2, Offset(NVMDATA0+0)(GP)
;Flash_R_W.c,61 :: 		NVMDATA1 = *(_data+1); // value
ADDIU	R2, R26, 4
LW	R2, 0(R2)
SW	R2, Offset(NVMDATA1+0)(GP)
;Flash_R_W.c,62 :: 		NVMDATA2 = *(_data+2); // value
ADDIU	R2, R26, 8
LW	R2, 0(R2)
SW	R2, Offset(NVMDATA2+0)(GP)
;Flash_R_W.c,63 :: 		NVMDATA3 = *(_data+3); // value
ADDIU	R2, R26, 12
LW	R2, 0(R2)
SW	R2, Offset(NVMDATA3+0)(GP)
;Flash_R_W.c,66 :: 		res = NVMUnlock (0x4002);
ORI	R25, R0, 16386
JAL	Flash_R_W_NVMUnlock+0
NOP	
;Flash_R_W.c,69 :: 		return res;
;Flash_R_W.c,70 :: 		}
;Flash_R_W.c,69 :: 		return res;
;Flash_R_W.c,70 :: 		}
L_end_NVMWriteQuad:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMWriteQuad
_NVMWriteRow:
;Flash_R_W.c,74 :: 		unsigned int NVMWriteRow (void  *address, void *_data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,82 :: 		NVMADDR = *(unsigned long*)address & FLASH_PADDRESS_TRANSLATE;
SW	R25, 4(SP)
LW	R3, 0(R25)
LUI	R2, 8191
ORI	R2, R2, 65535
AND	R2, R3, R2
SW	R2, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,87 :: 		NVMSRCADDR = (unsigned long)_data & FLASH_PADDRESS_TRANSLATE;
LUI	R2, 8191
ORI	R2, R2, 65535
AND	R2, R26, R2
SW	R2, Offset(NVMSRCADDR+0)(GP)
;Flash_R_W.c,94 :: 		res = NVMUnlock(0x4003);
ORI	R25, R0, 16387
JAL	Flash_R_W_NVMUnlock+0
NOP	
;Flash_R_W.c,97 :: 		return res;
;Flash_R_W.c,98 :: 		}
;Flash_R_W.c,97 :: 		return res;
;Flash_R_W.c,98 :: 		}
L_end_NVMWriteRow:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMWriteRow
_NVMErasePage:
;Flash_R_W.c,102 :: 		unsigned int NVMErasePage(unsigned long address){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,108 :: 		NVMADDR = address & FLASH_PADDRESS_TRANSLATE;
SW	R25, 4(SP)
LUI	R2, 8191
ORI	R2, R2, 65535
AND	R2, R25, R2
SW	R2, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,111 :: 		res = NVMUnlock(0x4004);
ORI	R25, R0, 16388
JAL	Flash_R_W_NVMUnlock+0
NOP	
;Flash_R_W.c,114 :: 		return res;
;Flash_R_W.c,115 :: 		}
;Flash_R_W.c,114 :: 		return res;
;Flash_R_W.c,115 :: 		}
L_end_NVMErasePage:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMErasePage
Flash_R_W_NVMUnlock:
;Flash_R_W.c,119 :: 		static unsigned int NVMUnlock (unsigned long nvmop){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Flash_R_W.c,120 :: 		unsigned int I_status = 0;
;Flash_R_W.c,121 :: 		unsigned int dma_ = 0;
;Flash_R_W.c,123 :: 		NVMCON &= 0xFFF0;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 65520
SW	R2, Offset(NVMCON+0)(GP)
;Flash_R_W.c,124 :: 		NVMCON |=  nvmop; //Set NVMOP bits
LW	R2, Offset(NVMCON+0)(GP)
OR	R2, R2, R25
SW	R2, Offset(NVMCON+0)(GP)
;Flash_R_W.c,128 :: 		I_status = (unsigned int)DI();
DI	R30
SH	R30, 8(SP)
;Flash_R_W.c,131 :: 		dma_ = DMA_Suspend();
JAL	_DMA_Suspend+0
NOP	
;Flash_R_W.c,132 :: 		if(dma_){
BNE	R2, R0, L_Flash_R_W_NVMUnlock32
NOP	
J	L_Flash_R_W_NVMUnlock0
NOP	
L_Flash_R_W_NVMUnlock32:
;Flash_R_W.c,133 :: 		LED2 = false;
_LX	
INS	R2, R0, BitPos(LED2+0), 1
_SX	
;Flash_R_W.c,134 :: 		while(DMA_Busy());
L_Flash_R_W_NVMUnlock1:
SW	R25, 4(SP)
JAL	_DMA_Busy+0
NOP	
LW	R25, 4(SP)
BNE	R2, R0, L_Flash_R_W_NVMUnlock34
NOP	
J	L_Flash_R_W_NVMUnlock2
NOP	
L_Flash_R_W_NVMUnlock34:
J	L_Flash_R_W_NVMUnlock1
NOP	
L_Flash_R_W_NVMUnlock2:
;Flash_R_W.c,135 :: 		}
L_Flash_R_W_NVMUnlock0:
;Flash_R_W.c,144 :: 		NVMKEY = 0x0U;
SW	R0, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,145 :: 		NVMKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,146 :: 		NVMKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,147 :: 		NVMCONSET = 0x8000;//1 << 15;
ORI	R2, R0, 32768
SW	R2, Offset(NVMCONSET+0)(GP)
;Flash_R_W.c,148 :: 		asm{NOP};
NOP	
;Flash_R_W.c,151 :: 		DMA_Resume();
SW	R25, 4(SP)
JAL	_DMA_Resume+0
NOP	
LW	R25, 4(SP)
;Flash_R_W.c,154 :: 		if (I_status != 0)
LHU	R2, 8(SP)
BNE	R2, R0, L_Flash_R_W_NVMUnlock36
NOP	
J	L_Flash_R_W_NVMUnlock3
NOP	
L_Flash_R_W_NVMUnlock36:
;Flash_R_W.c,155 :: 		EI();
EI	R30
L_Flash_R_W_NVMUnlock3:
;Flash_R_W.c,158 :: 		NVMCONCLR = 0x4000;
ORI	R2, R0, 16384
SW	R2, Offset(NVMCONCLR+0)(GP)
;Flash_R_W.c,162 :: 		while(NVM_WR_Wait());
L_Flash_R_W_NVMUnlock4:
JAL	Flash_R_W_NVM_WR_Wait+0
NOP	
BNE	R2, R0, L_Flash_R_W_NVMUnlock38
NOP	
J	L_Flash_R_W_NVMUnlock5
NOP	
L_Flash_R_W_NVMUnlock38:
J	L_Flash_R_W_NVMUnlock4
NOP	
L_Flash_R_W_NVMUnlock5:
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
_NVM_ERROR_Rst:
;Flash_R_W.c,170 :: 		unsigned int NVM_ERROR_Rst(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,171 :: 		unsigned int error= 0;
;Flash_R_W.c,172 :: 		NVMCON = 0;
SW	R0, Offset(NVMCON+0)(GP)
;Flash_R_W.c,175 :: 		NVM_WREN_Set();
JAL	Flash_R_W_NVM_WREN_Set+0
NOP	
;Flash_R_W.c,177 :: 		NVM_WR_Set();
JAL	Flash_R_W_NVM_WR_Set+0
NOP	
;Flash_R_W.c,179 :: 		while(NVM_WR_Wait());
L_NVM_ERROR_Rst6:
JAL	Flash_R_W_NVM_WR_Wait+0
NOP	
BNE	R2, R0, L__NVM_ERROR_Rst41
NOP	
J	L_NVM_ERROR_Rst7
NOP	
L__NVM_ERROR_Rst41:
J	L_NVM_ERROR_Rst6
NOP	
L_NVM_ERROR_Rst7:
;Flash_R_W.c,182 :: 		return (NVMCON & 0x3000)>>12;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 12288
SRL	R2, R2, 12
;Flash_R_W.c,183 :: 		}
L_end_NVM_ERROR_Rst:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _NVM_ERROR_Rst
Flash_R_W_NVM_WR_Set:
;Flash_R_W.c,187 :: 		static void NVM_WR_Set(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,189 :: 		NVMCON |= 1 << 15;
LW	R2, Offset(NVMCON+0)(GP)
ORI	R2, R2, 32768
SW	R2, Offset(NVMCON+0)(GP)
;Flash_R_W.c,190 :: 		while(!NVM_WR_Wait());
L_Flash_R_W_NVM_WR_Set8:
JAL	Flash_R_W_NVM_WR_Wait+0
NOP	
BEQ	R2, R0, L_Flash_R_W_NVM_WR_Set43
NOP	
J	L_Flash_R_W_NVM_WR_Set9
NOP	
L_Flash_R_W_NVM_WR_Set43:
J	L_Flash_R_W_NVM_WR_Set8
NOP	
L_Flash_R_W_NVM_WR_Set9:
;Flash_R_W.c,191 :: 		}
L_end_NVM_WR_Set:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Flash_R_W_NVM_WR_Set
Flash_R_W_NVM_WR_Wait:
;Flash_R_W.c,195 :: 		static unsigned int NVM_WR_Wait(){
;Flash_R_W.c,196 :: 		return (NVMCON & 0x8000) >> 15;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 32768
SRL	R2, R2, 15
;Flash_R_W.c,197 :: 		}
L_end_NVM_WR_Wait:
JR	RA
NOP	
; end of Flash_R_W_NVM_WR_Wait
Flash_R_W_NVM_WREN_Set:
;Flash_R_W.c,201 :: 		static void NVM_WREN_Set(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,202 :: 		NVMCON |= 1 << 14;
LW	R2, Offset(NVMCON+0)(GP)
ORI	R2, R2, 16384
SW	R2, Offset(NVMCON+0)(GP)
;Flash_R_W.c,203 :: 		while(!NVM_WREN_Wait());
L_Flash_R_W_NVM_WREN_Set10:
JAL	Flash_R_W_NVM_WREN_Wait+0
NOP	
BEQ	R2, R0, L_Flash_R_W_NVM_WREN_Set46
NOP	
J	L_Flash_R_W_NVM_WREN_Set11
NOP	
L_Flash_R_W_NVM_WREN_Set46:
J	L_Flash_R_W_NVM_WREN_Set10
NOP	
L_Flash_R_W_NVM_WREN_Set11:
;Flash_R_W.c,204 :: 		}
L_end_NVM_WREN_Set:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Flash_R_W_NVM_WREN_Set
Flash_R_W_NVM_WREN_Rst:
;Flash_R_W.c,208 :: 		static void NVM_WREN_Rst(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,209 :: 		NVMCONCLR |= 1<<14;
LW	R2, Offset(NVMCONCLR+0)(GP)
ORI	R2, R2, 16384
SW	R2, Offset(NVMCONCLR+0)(GP)
;Flash_R_W.c,210 :: 		while(NVM_WREN_Wait());
L_Flash_R_W_NVM_WREN_Rst12:
JAL	Flash_R_W_NVM_WREN_Wait+0
NOP	
BNE	R2, R0, L_Flash_R_W_NVM_WREN_Rst49
NOP	
J	L_Flash_R_W_NVM_WREN_Rst13
NOP	
L_Flash_R_W_NVM_WREN_Rst49:
J	L_Flash_R_W_NVM_WREN_Rst12
NOP	
L_Flash_R_W_NVM_WREN_Rst13:
;Flash_R_W.c,211 :: 		}
L_end_NVM_WREN_Rst:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Flash_R_W_NVM_WREN_Rst
Flash_R_W_NVM_WREN_Wait:
;Flash_R_W.c,215 :: 		static unsigned int NVM_WREN_Wait(){
;Flash_R_W.c,216 :: 		return (NVMCON & 0x4000) >> 14;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 16384
SRL	R2, R2, 14
;Flash_R_W.c,217 :: 		}
L_end_NVM_WREN_Wait:
JR	RA
NOP	
; end of Flash_R_W_NVM_WREN_Wait
_NVMReadWord:
;Flash_R_W.c,222 :: 		unsigned long NVMReadWord(void *addr){
;Flash_R_W.c,225 :: 		val = *((unsigned long*)addr);
LW	R2, 0(R25)
;Flash_R_W.c,227 :: 		return val;
;Flash_R_W.c,228 :: 		}
L_end_NVMReadWord:
JR	RA
NOP	
; end of _NVMReadWord
_NVM_PWPAGE_Lock:
;Flash_R_W.c,232 :: 		void NVM_PWPAGE_Lock(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,235 :: 		unsigned int dma_susp=0;   // storage for current DMA state
; dma_susp start address is: 16 (R4)
MOVZ	R4, R0, R0
;Flash_R_W.c,237 :: 		I_status = (unsigned int)DI();
DI	R30
SH	R30, 4(SP)
; dma_susp end address is: 16 (R4)
ANDI	R3, R4, 65535
;Flash_R_W.c,240 :: 		while(!dma_susp)
L_NVM_PWPAGE_Lock14:
; dma_susp start address is: 12 (R3)
BEQ	R3, R0, L__NVM_PWPAGE_Lock53
NOP	
J	L_NVM_PWPAGE_Lock15
NOP	
L__NVM_PWPAGE_Lock53:
; dma_susp end address is: 12 (R3)
;Flash_R_W.c,241 :: 		dma_susp = DMA_Suspend();
JAL	_DMA_Suspend+0
NOP	
; dma_susp start address is: 16 (R4)
ANDI	R4, R2, 65535
ANDI	R3, R4, 65535
; dma_susp end address is: 16 (R4)
J	L_NVM_PWPAGE_Lock14
NOP	
L_NVM_PWPAGE_Lock15:
;Flash_R_W.c,244 :: 		NVMCONSET = 4;
; dma_susp start address is: 12 (R3)
ORI	R2, R0, 4
SW	R2, Offset(NVMCONSET+0)(GP)
;Flash_R_W.c,246 :: 		NVM_WREN_Set();
JAL	Flash_R_W_NVM_WREN_Set+0
NOP	
;Flash_R_W.c,250 :: 		NVMKEY = 0x0U;
SW	R0, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,251 :: 		NVMKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,252 :: 		NVMKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,253 :: 		NVMPWPCLR = 0x8000C000;
LUI	R2, 32768
ORI	R2, R2, 49152
SW	R2, Offset(NVMPWPCLR+0)(GP)
; dma_susp end address is: 12 (R3)
ANDI	R2, R3, 65535
;Flash_R_W.c,256 :: 		while(dma_susp){
L_NVM_PWPAGE_Lock16:
; dma_susp start address is: 8 (R2)
BNE	R2, R0, L__NVM_PWPAGE_Lock55
NOP	
J	L_NVM_PWPAGE_Lock17
NOP	
L__NVM_PWPAGE_Lock55:
; dma_susp end address is: 8 (R2)
;Flash_R_W.c,257 :: 		dma_susp = DMA_Resume();
JAL	_DMA_Resume+0
NOP	
; dma_susp start address is: 8 (R2)
;Flash_R_W.c,258 :: 		}
; dma_susp end address is: 8 (R2)
J	L_NVM_PWPAGE_Lock16
NOP	
L_NVM_PWPAGE_Lock17:
;Flash_R_W.c,261 :: 		if (I_status)
LHU	R2, 4(SP)
BNE	R2, R0, L__NVM_PWPAGE_Lock57
NOP	
J	L_NVM_PWPAGE_Lock18
NOP	
L__NVM_PWPAGE_Lock57:
;Flash_R_W.c,262 :: 		EI();
EI	R30
L_NVM_PWPAGE_Lock18:
;Flash_R_W.c,265 :: 		NVM_WREN_Rst();
JAL	Flash_R_W_NVM_WREN_Rst+0
NOP	
;Flash_R_W.c,268 :: 		}
L_end_NVM_PWPAGE_Lock:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVM_PWPAGE_Lock
_NVMReadRow:
;Flash_R_W.c,270 :: 		void NVMReadRow(unsigned long addr){
ADDIU	SP, SP, -556
SW	RA, 0(SP)
;Flash_R_W.c,271 :: 		unsigned long buff[128] = {0};
ADDIU	R23, SP, 44
ADDIU	R22, R23, 512
LUI	R24, hi_addr(?ICSNVMReadRow_buff_L0+0)
ORI	R24, R24, lo_addr(?ICSNVMReadRow_buff_L0+0)
JAL	___CC2DW+0
NOP	
;Flash_R_W.c,276 :: 		ptr = (unsigned long*)addr;
SW	R25, 12(SP)
;Flash_R_W.c,279 :: 		for(j = 0;j < 128;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
MOVZ	R6, R5, R0
L_NVMReadRow19:
; j start address is: 24 (R6)
SLTIU	R2, R6, 128
BNE	R2, R0, L__NVMReadRow59
NOP	
J	L_NVMReadRow20
NOP	
L__NVMReadRow59:
;Flash_R_W.c,280 :: 		buff[j] = *(ptr+j);
ADDIU	R5, SP, 44
SLL	R4, R6, 2
ADDU	R3, R5, R4
LW	R2, 12(SP)
ADDU	R2, R2, R4
LW	R2, 0(R2)
SW	R2, 0(R3)
;Flash_R_W.c,281 :: 		if(buff[j] < 0xFFFFFFFF)
SLL	R2, R6, 2
ADDU	R2, R5, R2
LW	R2, 0(R2)
SLTIU	R2, R2, 65535
BNE	R2, R0, L__NVMReadRow60
NOP	
J	L_NVMReadRow22
NOP	
L__NVMReadRow60:
;Flash_R_W.c,282 :: 		val = ulong2flt(buff[j]);
ADDIU	R3, SP, 44
SLL	R2, R6, 2
ADDU	R2, R3, R2
SW	R6, 4(SP)
SW	R25, 8(SP)
LW	R25, 0(R2)
JAL	_ulong2flt+0
NOP	
LW	R25, 8(SP)
LW	R6, 4(SP)
SWC1	S0, 16(SP)
J	L_NVMReadRow23
NOP	
L_NVMReadRow22:
;Flash_R_W.c,283 :: 		else val = 0.00;
MOVZ	R2, R0, R0
SW	R2, 16(SP)
L_NVMReadRow23:
;Flash_R_W.c,285 :: 		while(DMA_IsOn(1));
MOVZ	R4, R6, R0
; j end address is: 24 (R6)
L_NVMReadRow24:
; j start address is: 16 (R4)
SW	R4, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 8(SP)
LW	R4, 4(SP)
BNE	R2, R0, L__NVMReadRow62
NOP	
J	L_NVMReadRow25
NOP	
L__NVMReadRow62:
J	L_NVMReadRow24
NOP	
L_NVMReadRow25:
;Flash_R_W.c,286 :: 		dma_printf("val:= %f\tbuff[%l]:= %l\n",val,j,buff[j]);
ADDIU	R3, SP, 44
SLL	R2, R4, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
ADDIU	R23, SP, 20
ADDIU	R22, R23, 24
LUI	R24, hi_addr(?ICS?lstr1_Flash_R_W+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Flash_R_W+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 20
SW	R4, 4(SP)
SW	R25, 8(SP)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
SW	R4, 8(SP)
LW	R2, 32(SP)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 16
LW	R25, 8(SP)
LW	R4, 4(SP)
;Flash_R_W.c,279 :: 		for(j = 0;j < 128;j++){
ADDIU	R2, R4, 1
; j end address is: 16 (R4)
; j start address is: 20 (R5)
MOVZ	R5, R2, R0
;Flash_R_W.c,287 :: 		}
MOVZ	R6, R5, R0
; j end address is: 20 (R5)
J	L_NVMReadRow19
NOP	
L_NVMReadRow20:
;Flash_R_W.c,289 :: 		}
L_end_NVMReadRow:
LW	RA, 0(SP)
ADDIU	SP, SP, 556
JR	RA
NOP	
; end of _NVMReadRow
