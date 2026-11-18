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
SW	R2, Offset(-1082128864)(GP)
;Flash_R_W.c,37 :: 		NVMDATA0 = _data; // value
SW	R26, Offset(-1082128848)(GP)
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
SW	R2, Offset(-1082128864)(GP)
;Flash_R_W.c,58 :: 		NVMDATA0 = *(_data+0); // value
LW	R2, 0(R26)
SW	R2, Offset(-1082128848)(GP)
;Flash_R_W.c,59 :: 		NVMDATA1 = *(_data+1); // value
ADDIU	R2, R26, 4
LW	R2, 0(R2)
SW	R2, Offset(-1082128832)(GP)
;Flash_R_W.c,60 :: 		NVMDATA2 = *(_data+2); // value
ADDIU	R2, R26, 8
LW	R2, 0(R2)
SW	R2, Offset(-1082128816)(GP)
;Flash_R_W.c,61 :: 		NVMDATA3 = *(_data+3); // value
ADDIU	R2, R26, 12
LW	R2, 0(R2)
SW	R2, Offset(-1082128800)(GP)
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
SW	R2, Offset(-1082128864)(GP)
;Flash_R_W.c,83 :: 		NVMSRCADDR = (unsigned long)_data & FLASH_PADDRESS_TRANSLATE;
LUI	R2, 8191
ORI	R2, R2, 65535
AND	R2, R26, R2
SW	R2, Offset(-1082128784)(GP)
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
SW	R2, Offset(-1082128864)(GP)
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
;Flash_R_W.c,119 :: 		static unsigned int NVMUnlock (unsigned long nvmop){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Flash_R_W.c,120 :: 		unsigned int I_status = 0;
;Flash_R_W.c,121 :: 		unsigned int dma_susp = 0;
;Flash_R_W.c,122 :: 		unsigned long timeout = NVM_WR_TIMEOUT;
LUI	R30, 305
ORI	R30, R30, 11520
SW	R30, 8(SP)
;Flash_R_W.c,124 :: 		NVMCONCLR = 0x4000;              //WREN = 0 so NVMOP can be changed
ORI	R2, R0, 16384
SW	R2, Offset(-1082128892)(GP)
;Flash_R_W.c,125 :: 		NVMCONCLR = 0x000F;
ORI	R2, R0, 15
SW	R2, Offset(-1082128892)(GP)
;Flash_R_W.c,126 :: 		NVMCONSET = nvmop & 0x000F;      //NVMOP
ANDI	R2, R25, 15
SW	R2, Offset(-1082128888)(GP)
;Flash_R_W.c,127 :: 		NVMCONSET = 0x4000;              //WREN = 1
ORI	R2, R0, 16384
SW	R2, Offset(-1082128888)(GP)
;Flash_R_W.c,130 :: 		I_status = (unsigned int)DI();
DI	R30
SH	R30, 12(SP)
;Flash_R_W.c,133 :: 		dma_susp = (DMACON & 0x1000) >> 12;
LW	R2, Offset(-1082060800)(GP)
ANDI	R2, R2, 4096
SRL	R2, R2, 12
SH	R2, 14(SP)
;Flash_R_W.c,135 :: 		if(!dma_susp){
BEQ	R2, R0, L_Flash_R_W_NVMUnlock49
NOP	
J	L_Flash_R_W_NVMUnlock0
NOP	
L_Flash_R_W_NVMUnlock49:
;Flash_R_W.c,136 :: 		DMACONSET = 0x1000;
ORI	R2, R0, 4096
SW	R2, Offset(-1082060792)(GP)
;Flash_R_W.c,137 :: 		while(DMA_Busy());
L_Flash_R_W_NVMUnlock1:
SW	R25, 4(SP)
JAL	_DMA_Busy+0
NOP	
LW	R25, 4(SP)
BNE	R2, R0, L_Flash_R_W_NVMUnlock51
NOP	
J	L_Flash_R_W_NVMUnlock2
NOP	
L_Flash_R_W_NVMUnlock51:
J	L_Flash_R_W_NVMUnlock1
NOP	
L_Flash_R_W_NVMUnlock2:
;Flash_R_W.c,138 :: 		}
L_Flash_R_W_NVMUnlock0:
;Flash_R_W.c,141 :: 		NVMKEY = 0x0U;
SW	R0, Offset(-1082128880)(GP)
;Flash_R_W.c,142 :: 		NVMKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(-1082128880)(GP)
;Flash_R_W.c,143 :: 		NVMKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(-1082128880)(GP)
;Flash_R_W.c,144 :: 		NVMCONSET = 0x8000;
ORI	R2, R0, 32768
SW	R2, Offset(-1082128888)(GP)
;Flash_R_W.c,145 :: 		asm{NOP};
NOP	
;Flash_R_W.c,148 :: 		if(!dma_susp)
LHU	R2, 14(SP)
BEQ	R2, R0, L_Flash_R_W_NVMUnlock52
NOP	
J	L_Flash_R_W_NVMUnlock3
NOP	
L_Flash_R_W_NVMUnlock52:
;Flash_R_W.c,149 :: 		DMACONCLR = 0x1000;
ORI	R2, R0, 4096
SW	R2, Offset(-1082060796)(GP)
L_Flash_R_W_NVMUnlock3:
;Flash_R_W.c,152 :: 		if(I_status & 0x00000001)
LHU	R2, 12(SP)
ANDI	R2, R2, 1
BNE	R2, R0, L_Flash_R_W_NVMUnlock54
NOP	
J	L_Flash_R_W_NVMUnlock4
NOP	
L_Flash_R_W_NVMUnlock54:
;Flash_R_W.c,153 :: 		EI();
EI	R30
L_Flash_R_W_NVMUnlock4:
;Flash_R_W.c,156 :: 		while(NVM_WR_Wait() && --timeout);
L_Flash_R_W_NVMUnlock5:
JAL	Flash_R_W_NVM_WR_Wait+0
NOP	
BNE	R2, R0, L_Flash_R_W_NVMUnlock56
NOP	
J	L_Flash_R_W_NVMUnlock43
NOP	
L_Flash_R_W_NVMUnlock56:
LW	R2, 8(SP)
ADDIU	R2, R2, -1
SW	R2, 8(SP)
BNE	R2, R0, L_Flash_R_W_NVMUnlock58
NOP	
J	L_Flash_R_W_NVMUnlock42
NOP	
L_Flash_R_W_NVMUnlock58:
L_Flash_R_W_NVMUnlock41:
J	L_Flash_R_W_NVMUnlock5
NOP	
L_Flash_R_W_NVMUnlock43:
L_Flash_R_W_NVMUnlock42:
;Flash_R_W.c,159 :: 		NVMCONCLR = 0x4000;
ORI	R2, R0, 16384
SW	R2, Offset(-1082128892)(GP)
;Flash_R_W.c,161 :: 		if(!timeout)
LW	R2, 8(SP)
BEQ	R2, R0, L_Flash_R_W_NVMUnlock59
NOP	
J	L_Flash_R_W_NVMUnlock9
NOP	
L_Flash_R_W_NVMUnlock59:
;Flash_R_W.c,162 :: 		return NVM_WR_TIMEOUT_ERROR;
ORI	R2, R0, 4
J	L_end_NVMUnlock
NOP	
L_Flash_R_W_NVMUnlock9:
;Flash_R_W.c,164 :: 		return (NVMCON & 0x3000)>>12;
LW	R2, Offset(-1082128896)(GP)
ANDI	R2, R2, 12288
SRL	R2, R2, 12
;Flash_R_W.c,165 :: 		}
L_end_NVMUnlock:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of Flash_R_W_NVMUnlock
_NVM_ERROR_Rst:
;Flash_R_W.c,170 :: 		unsigned int NVM_ERROR_Rst(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,171 :: 		unsigned int error= 0;
;Flash_R_W.c,172 :: 		NVMCON = 0;
SW	R0, Offset(-1082128896)(GP)
;Flash_R_W.c,176 :: 		NVM_WREN_Set();
JAL	Flash_R_W_NVM_WREN_Set+0
NOP	
;Flash_R_W.c,178 :: 		NVM_WR_Set();
JAL	Flash_R_W_NVM_WR_Set+0
NOP	
;Flash_R_W.c,180 :: 		while(NVM_WR_Wait());
L_NVM_ERROR_Rst10:
JAL	Flash_R_W_NVM_WR_Wait+0
NOP	
BNE	R2, R0, L__NVM_ERROR_Rst62
NOP	
J	L_NVM_ERROR_Rst11
NOP	
L__NVM_ERROR_Rst62:
J	L_NVM_ERROR_Rst10
NOP	
L_NVM_ERROR_Rst11:
;Flash_R_W.c,183 :: 		return (NVMCON & 0x3000)>>12;
LW	R2, Offset(-1082128896)(GP)
ANDI	R2, R2, 12288
SRL	R2, R2, 12
;Flash_R_W.c,184 :: 		}
L_end_NVM_ERROR_Rst:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _NVM_ERROR_Rst
Flash_R_W_NVM_WR_Set:
;Flash_R_W.c,188 :: 		static void NVM_WR_Set(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,190 :: 		NVMCON |= 1 << 15;
LW	R2, Offset(-1082128896)(GP)
ORI	R2, R2, 32768
SW	R2, Offset(-1082128896)(GP)
;Flash_R_W.c,191 :: 		while(!NVM_WR_Wait());
L_Flash_R_W_NVM_WR_Set12:
JAL	Flash_R_W_NVM_WR_Wait+0
NOP	
BEQ	R2, R0, L_Flash_R_W_NVM_WR_Set64
NOP	
J	L_Flash_R_W_NVM_WR_Set13
NOP	
L_Flash_R_W_NVM_WR_Set64:
J	L_Flash_R_W_NVM_WR_Set12
NOP	
L_Flash_R_W_NVM_WR_Set13:
;Flash_R_W.c,192 :: 		}
L_end_NVM_WR_Set:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Flash_R_W_NVM_WR_Set
Flash_R_W_NVM_WR_Wait:
;Flash_R_W.c,196 :: 		static unsigned int NVM_WR_Wait(){
;Flash_R_W.c,197 :: 		return (NVMCON & 0x8000) >> 15;
LW	R2, Offset(-1082128896)(GP)
ANDI	R2, R2, 32768
SRL	R2, R2, 15
;Flash_R_W.c,198 :: 		}
L_end_NVM_WR_Wait:
JR	RA
NOP	
; end of Flash_R_W_NVM_WR_Wait
Flash_R_W_NVM_WREN_Set:
;Flash_R_W.c,202 :: 		static void NVM_WREN_Set(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,203 :: 		NVMCON |= 1 << 14;
LW	R2, Offset(-1082128896)(GP)
ORI	R2, R2, 16384
SW	R2, Offset(-1082128896)(GP)
;Flash_R_W.c,204 :: 		while(!NVM_WREN_Wait());
L_Flash_R_W_NVM_WREN_Set14:
JAL	Flash_R_W_NVM_WREN_Wait+0
NOP	
BEQ	R2, R0, L_Flash_R_W_NVM_WREN_Set67
NOP	
J	L_Flash_R_W_NVM_WREN_Set15
NOP	
L_Flash_R_W_NVM_WREN_Set67:
J	L_Flash_R_W_NVM_WREN_Set14
NOP	
L_Flash_R_W_NVM_WREN_Set15:
;Flash_R_W.c,205 :: 		}
L_end_NVM_WREN_Set:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Flash_R_W_NVM_WREN_Set
Flash_R_W_NVM_WREN_Rst:
;Flash_R_W.c,209 :: 		static void NVM_WREN_Rst(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,210 :: 		NVMCONCLR |= 1<<14;
LW	R2, Offset(-1082128892)(GP)
ORI	R2, R2, 16384
SW	R2, Offset(-1082128892)(GP)
;Flash_R_W.c,211 :: 		while(NVM_WREN_Wait());
L_Flash_R_W_NVM_WREN_Rst16:
JAL	Flash_R_W_NVM_WREN_Wait+0
NOP	
BNE	R2, R0, L_Flash_R_W_NVM_WREN_Rst70
NOP	
J	L_Flash_R_W_NVM_WREN_Rst17
NOP	
L_Flash_R_W_NVM_WREN_Rst70:
J	L_Flash_R_W_NVM_WREN_Rst16
NOP	
L_Flash_R_W_NVM_WREN_Rst17:
;Flash_R_W.c,212 :: 		}
L_end_NVM_WREN_Rst:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Flash_R_W_NVM_WREN_Rst
Flash_R_W_NVM_WREN_Wait:
;Flash_R_W.c,216 :: 		static unsigned int NVM_WREN_Wait(){
;Flash_R_W.c,217 :: 		return (NVMCON & 0x4000) >> 14;
LW	R2, Offset(-1082128896)(GP)
ANDI	R2, R2, 16384
SRL	R2, R2, 14
;Flash_R_W.c,218 :: 		}
L_end_NVM_WREN_Wait:
JR	RA
NOP	
; end of Flash_R_W_NVM_WREN_Wait
_NVM_PWPAGE_Lock:
;Flash_R_W.c,222 :: 		void NVM_PWPAGE_Lock(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,225 :: 		unsigned int dma_susp=0;   // storage for current DMA state
; dma_susp start address is: 16 (R4)
MOVZ	R4, R0, R0
;Flash_R_W.c,227 :: 		I_status = (unsigned int)DI();
DI	R30
SH	R30, 4(SP)
; dma_susp end address is: 16 (R4)
ANDI	R3, R4, 65535
;Flash_R_W.c,230 :: 		while(!dma_susp)
L_NVM_PWPAGE_Lock18:
; dma_susp start address is: 12 (R3)
BEQ	R3, R0, L__NVM_PWPAGE_Lock73
NOP	
J	L_NVM_PWPAGE_Lock19
NOP	
L__NVM_PWPAGE_Lock73:
; dma_susp end address is: 12 (R3)
;Flash_R_W.c,231 :: 		dma_susp = DMA_Suspend();
JAL	_DMA_Suspend+0
NOP	
; dma_susp start address is: 16 (R4)
ANDI	R4, R2, 65535
ANDI	R3, R4, 65535
; dma_susp end address is: 16 (R4)
J	L_NVM_PWPAGE_Lock18
NOP	
L_NVM_PWPAGE_Lock19:
;Flash_R_W.c,234 :: 		NVMCONSET = 4;
; dma_susp start address is: 12 (R3)
ORI	R2, R0, 4
SW	R2, Offset(-1082128888)(GP)
;Flash_R_W.c,236 :: 		NVM_WREN_Set();
JAL	Flash_R_W_NVM_WREN_Set+0
NOP	
;Flash_R_W.c,240 :: 		NVMKEY = 0x0U;
SW	R0, Offset(-1082128880)(GP)
;Flash_R_W.c,241 :: 		NVMKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(-1082128880)(GP)
;Flash_R_W.c,242 :: 		NVMKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(-1082128880)(GP)
;Flash_R_W.c,243 :: 		NVMPWPCLR = 0x8000C000;
LUI	R2, 32768
ORI	R2, R2, 49152
SW	R2, Offset(-1082128764)(GP)
; dma_susp end address is: 12 (R3)
ANDI	R2, R3, 65535
;Flash_R_W.c,246 :: 		while(dma_susp){
L_NVM_PWPAGE_Lock20:
; dma_susp start address is: 8 (R2)
BNE	R2, R0, L__NVM_PWPAGE_Lock75
NOP	
J	L_NVM_PWPAGE_Lock21
NOP	
L__NVM_PWPAGE_Lock75:
; dma_susp end address is: 8 (R2)
;Flash_R_W.c,247 :: 		dma_susp = DMA_Resume();
JAL	_DMA_Resume+0
NOP	
; dma_susp start address is: 8 (R2)
;Flash_R_W.c,248 :: 		}
; dma_susp end address is: 8 (R2)
J	L_NVM_PWPAGE_Lock20
NOP	
L_NVM_PWPAGE_Lock21:
;Flash_R_W.c,251 :: 		if (I_status)
LHU	R2, 4(SP)
BNE	R2, R0, L__NVM_PWPAGE_Lock77
NOP	
J	L_NVM_PWPAGE_Lock22
NOP	
L__NVM_PWPAGE_Lock77:
;Flash_R_W.c,252 :: 		EI();
EI	R30
L_NVM_PWPAGE_Lock22:
;Flash_R_W.c,255 :: 		NVM_WREN_Rst();
JAL	Flash_R_W_NVM_WREN_Rst+0
NOP	
;Flash_R_W.c,258 :: 		}
L_end_NVM_PWPAGE_Lock:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVM_PWPAGE_Lock
_NVMReadRow:
;Flash_R_W.c,263 :: 		void NVMReadRow(unsigned long addr,unsigned long *buff){
;Flash_R_W.c,268 :: 		ptr = (unsigned long*)addr;
; ptr start address is: 16 (R4)
MOVZ	R4, R25, R0
;Flash_R_W.c,270 :: 		for(j = 0;j < 128;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
L_NVMReadRow23:
; j start address is: 20 (R5)
; ptr start address is: 16 (R4)
; ptr end address is: 16 (R4)
SLTIU	R2, R5, 128
BNE	R2, R0, L__NVMReadRow79
NOP	
J	L_NVMReadRow24
NOP	
L__NVMReadRow79:
; ptr end address is: 16 (R4)
;Flash_R_W.c,271 :: 		buff[j] = *(ptr+j);
; ptr start address is: 16 (R4)
SLL	R2, R5, 2
ADDU	R3, R26, R2
ADDU	R2, R4, R2
LW	R2, 0(R2)
SW	R2, 0(R3)
;Flash_R_W.c,270 :: 		for(j = 0;j < 128;j++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Flash_R_W.c,272 :: 		}
; ptr end address is: 16 (R4)
; j end address is: 20 (R5)
J	L_NVMReadRow23
NOP	
L_NVMReadRow24:
;Flash_R_W.c,273 :: 		}
L_end_NVMReadRow:
JR	RA
NOP	
; end of _NVMReadRow
_NVMReadQuad:
;Flash_R_W.c,277 :: 		void NVMReadQuad(unsigned long addr,unsigned long *words){
;Flash_R_W.c,281 :: 		ptr = (unsigned long*)addr;
; ptr start address is: 16 (R4)
MOVZ	R4, R25, R0
;Flash_R_W.c,283 :: 		for(j = 0;j < 4;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
L_NVMReadQuad26:
; j start address is: 20 (R5)
; ptr start address is: 16 (R4)
; ptr end address is: 16 (R4)
SLTIU	R2, R5, 4
BNE	R2, R0, L__NVMReadQuad81
NOP	
J	L_NVMReadQuad27
NOP	
L__NVMReadQuad81:
; ptr end address is: 16 (R4)
;Flash_R_W.c,284 :: 		words[j] = *(ptr+j);
; ptr start address is: 16 (R4)
SLL	R2, R5, 2
ADDU	R3, R26, R2
ADDU	R2, R4, R2
LW	R2, 0(R2)
SW	R2, 0(R3)
;Flash_R_W.c,283 :: 		for(j = 0;j < 4;j++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Flash_R_W.c,285 :: 		}
; ptr end address is: 16 (R4)
; j end address is: 20 (R5)
J	L_NVMReadQuad26
NOP	
L_NVMReadQuad27:
;Flash_R_W.c,286 :: 		}
L_end_NVMReadQuad:
JR	RA
NOP	
; end of _NVMReadQuad
_NVMReadWord:
;Flash_R_W.c,290 :: 		unsigned long NVMReadWord(void *addr){
;Flash_R_W.c,293 :: 		val = *(unsigned long*)addr;
LW	R2, 0(R25)
;Flash_R_W.c,295 :: 		return val;
;Flash_R_W.c,296 :: 		}
L_end_NVMReadWord:
JR	RA
NOP	
; end of _NVMReadWord
_Get_Address_Pval:
;Flash_R_W.c,300 :: 		unsigned long Get_Address_Pval(int recipe){
;Flash_R_W.c,301 :: 		unsigned long addr = 0;
; addr start address is: 16 (R4)
MOVZ	R4, R0, R0
;Flash_R_W.c,303 :: 		switch(recipe){
J	L_Get_Address_Pval29
NOP	
;Flash_R_W.c,304 :: 		case 0:break;
L_Get_Address_Pval31:
MOVZ	R2, R4, R0
; addr end address is: 16 (R4)
J	L_Get_Address_Pval30
NOP	
;Flash_R_W.c,305 :: 		case 1:addr =(unsigned long)FLASH_Settings_VAddr_P1;break;
L_Get_Address_Pval32:
; addr start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49152
; addr end address is: 8 (R2)
J	L_Get_Address_Pval30
NOP	
;Flash_R_W.c,306 :: 		case 2:addr =(unsigned long)FLASH_Settings_VAddr_P2;break;
L_Get_Address_Pval33:
; addr start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49168
; addr end address is: 8 (R2)
J	L_Get_Address_Pval30
NOP	
;Flash_R_W.c,307 :: 		case 3:addr =(unsigned long)FLASH_Settings_VAddr_P3;break;
L_Get_Address_Pval34:
; addr start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49184
; addr end address is: 8 (R2)
J	L_Get_Address_Pval30
NOP	
;Flash_R_W.c,308 :: 		case 4:addr =(unsigned long)FLASH_Settings_VAddr_P4;break;
L_Get_Address_Pval35:
; addr start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49200
; addr end address is: 8 (R2)
J	L_Get_Address_Pval30
NOP	
;Flash_R_W.c,309 :: 		case 5:addr =(unsigned long)FLASH_Settings_VAddr_P5;break;
L_Get_Address_Pval36:
; addr start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49216
; addr end address is: 8 (R2)
J	L_Get_Address_Pval30
NOP	
;Flash_R_W.c,310 :: 		case 6:addr =(unsigned long)FLASH_Settings_VAddr_P6;break;
L_Get_Address_Pval37:
; addr start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49232
; addr end address is: 8 (R2)
J	L_Get_Address_Pval30
NOP	
;Flash_R_W.c,311 :: 		case 7:addr =(unsigned long)FLASH_Settings_VAddr_P7;break;
L_Get_Address_Pval38:
; addr start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49248
; addr end address is: 8 (R2)
J	L_Get_Address_Pval30
NOP	
;Flash_R_W.c,312 :: 		case 8:addr =(unsigned long)FLASH_Settings_VAddr_P8;break;
L_Get_Address_Pval39:
; addr start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49264
; addr end address is: 8 (R2)
J	L_Get_Address_Pval30
NOP	
;Flash_R_W.c,313 :: 		case 9:addr =(unsigned long)FLASH_Settings_VAddr_P9;break;
L_Get_Address_Pval40:
; addr start address is: 8 (R2)
LUI	R2, 48411
ORI	R2, R2, 49280
; addr end address is: 8 (R2)
J	L_Get_Address_Pval30
NOP	
;Flash_R_W.c,314 :: 		}
L_Get_Address_Pval29:
; addr start address is: 16 (R4)
SEH	R2, R25
BNE	R2, R0, L__Get_Address_Pval85
NOP	
J	L_Get_Address_Pval31
NOP	
L__Get_Address_Pval85:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Get_Address_Pval87
NOP	
J	L_Get_Address_Pval32
NOP	
L__Get_Address_Pval87:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Get_Address_Pval89
NOP	
J	L_Get_Address_Pval33
NOP	
L__Get_Address_Pval89:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Get_Address_Pval91
NOP	
J	L_Get_Address_Pval34
NOP	
L__Get_Address_Pval91:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Get_Address_Pval93
NOP	
J	L_Get_Address_Pval35
NOP	
L__Get_Address_Pval93:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Get_Address_Pval95
NOP	
J	L_Get_Address_Pval36
NOP	
L__Get_Address_Pval95:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Get_Address_Pval97
NOP	
J	L_Get_Address_Pval37
NOP	
L__Get_Address_Pval97:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Get_Address_Pval99
NOP	
J	L_Get_Address_Pval38
NOP	
L__Get_Address_Pval99:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Get_Address_Pval101
NOP	
J	L_Get_Address_Pval39
NOP	
L__Get_Address_Pval101:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Get_Address_Pval103
NOP	
J	L_Get_Address_Pval40
NOP	
L__Get_Address_Pval103:
; addr end address is: 16 (R4)
MOVZ	R2, R4, R0
L_Get_Address_Pval30:
;Flash_R_W.c,316 :: 		return addr;
; addr start address is: 8 (R2)
; addr end address is: 8 (R2)
;Flash_R_W.c,317 :: 		}
L_end_Get_Address_Pval:
JR	RA
NOP	
; end of _Get_Address_Pval
