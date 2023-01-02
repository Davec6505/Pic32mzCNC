_NVMWriteWord:
;Flash_R_W.c,25 :: 		unsigned int NVMWriteWord (void *address, unsigned long _data){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,30 :: 		padd = *(unsigned long*)address & FLASH_PADDRESS_TRANSLATE;
LW	R3, 0(R25)
LUI	R2, 8191
ORI	R2, R2, 65535
AND	R2, R3, R2
;Flash_R_W.c,33 :: 		NVMADDR = padd;
SW	R2, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,38 :: 		NVMDATA0 = _data; // value
SW	R26, Offset(NVMDATA0+0)(GP)
;Flash_R_W.c,41 :: 		NVMCONSET = 1;
ORI	R2, R0, 1
SW	R2, Offset(NVMCONSET+0)(GP)
;Flash_R_W.c,43 :: 		res = NVMUnlock ();
JAL	Flash_R_W_NVMUnlock+0
NOP	
;Flash_R_W.c,46 :: 		return res;
;Flash_R_W.c,47 :: 		}
L_end_NVMWriteWord:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _NVMWriteWord
_NVMWriteQuad:
;Flash_R_W.c,51 :: 		unsigned int NVMWriteQuad (void *address, unsigned long *_data){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,56 :: 		padd = *(unsigned long*)address & FLASH_PADDRESS_TRANSLATE;
LW	R3, 0(R25)
LUI	R2, 8191
ORI	R2, R2, 65535
AND	R2, R3, R2
;Flash_R_W.c,59 :: 		NVMADDR = padd;
SW	R2, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,64 :: 		NVMDATA0 = *(_data+0); // value
LW	R2, 0(R26)
SW	R2, Offset(NVMDATA0+0)(GP)
;Flash_R_W.c,65 :: 		NVMDATA1 = *(_data+1); // value
ADDIU	R2, R26, 4
LW	R2, 0(R2)
SW	R2, Offset(NVMDATA1+0)(GP)
;Flash_R_W.c,66 :: 		NVMDATA2 = *(_data+2); // value
ADDIU	R2, R26, 8
LW	R2, 0(R2)
SW	R2, Offset(NVMDATA2+0)(GP)
;Flash_R_W.c,67 :: 		NVMDATA3 = *(_data+3); // value
ADDIU	R2, R26, 12
LW	R2, 0(R2)
SW	R2, Offset(NVMDATA3+0)(GP)
;Flash_R_W.c,69 :: 		NVMCONSET = 2;
ORI	R2, R0, 2
SW	R2, Offset(NVMCONSET+0)(GP)
;Flash_R_W.c,71 :: 		res = NVMUnlock ();
JAL	Flash_R_W_NVMUnlock+0
NOP	
;Flash_R_W.c,74 :: 		return res;
;Flash_R_W.c,75 :: 		}
L_end_NVMWriteQuad:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _NVMWriteQuad
_NVMWriteRow:
;Flash_R_W.c,79 :: 		unsigned int NVMWriteRow (void* address, void* _data){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,84 :: 		padd = *(unsigned long*)address & FLASH_PADDRESS_TRANSLATE;
LW	R3, 0(R25)
LUI	R2, 8191
ORI	R2, R2, 65535
AND	R2, R3, R2
;Flash_R_W.c,87 :: 		NVMADDR = padd;
SW	R2, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,90 :: 		src_padd = *(unsigned long*)_data & FLASH_PADDRESS_TRANSLATE;
LW	R3, 0(R26)
LUI	R2, 8191
ORI	R2, R2, 65535
AND	R2, R3, R2
;Flash_R_W.c,93 :: 		NVMSRCADDR = src_padd ;
SW	R2, Offset(NVMSRCADDR+0)(GP)
;Flash_R_W.c,96 :: 		NVMCONSET = 3;
ORI	R2, R0, 3
SW	R2, Offset(NVMCONSET+0)(GP)
;Flash_R_W.c,99 :: 		res = NVMUnlock();
JAL	Flash_R_W_NVMUnlock+0
NOP	
;Flash_R_W.c,101 :: 		return res;
;Flash_R_W.c,102 :: 		}
L_end_NVMWriteRow:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _NVMWriteRow
_NVMErasePage:
;Flash_R_W.c,106 :: 		unsigned int NVMErasePage(void* address){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,110 :: 		NVMADDR = (unsigned long) address;
SW	R25, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,112 :: 		res = NVMUnlock();
JAL	Flash_R_W_NVMUnlock+0
NOP	
;Flash_R_W.c,114 :: 		return res;
;Flash_R_W.c,115 :: 		}
L_end_NVMErasePage:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _NVMErasePage
Flash_R_W_NVMUnlock:
;Flash_R_W.c,119 :: 		static unsigned int NVMUnlock (){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,121 :: 		unsigned int dma_susp=0;   // storage for current DMA state
MOVZ	R30, R0, R0
SH	R30, 6(SP)
;Flash_R_W.c,125 :: 		I_status = (unsigned int)DI();
DI	R30
SH	R30, 4(SP)
;Flash_R_W.c,128 :: 		while(!dma_susp)
L_Flash_R_W_NVMUnlock0:
LHU	R2, 6(SP)
BEQ	R2, R0, L_Flash_R_W_NVMUnlock31
NOP	
J	L_Flash_R_W_NVMUnlock1
NOP	
L_Flash_R_W_NVMUnlock31:
;Flash_R_W.c,129 :: 		dma_susp = DMA_Suspend();
JAL	_DMA_Suspend+0
NOP	
SH	R2, 6(SP)
J	L_Flash_R_W_NVMUnlock0
NOP	
L_Flash_R_W_NVMUnlock1:
;Flash_R_W.c,132 :: 		NVM_WREN_Set();
JAL	Flash_R_W_NVM_WREN_Set+0
NOP	
;Flash_R_W.c,135 :: 		while(!NVM_WREN_Wait());
L_Flash_R_W_NVMUnlock2:
JAL	Flash_R_W_NVM_WREN_Wait+0
NOP	
BEQ	R2, R0, L_Flash_R_W_NVMUnlock32
NOP	
J	L_Flash_R_W_NVMUnlock3
NOP	
L_Flash_R_W_NVMUnlock32:
J	L_Flash_R_W_NVMUnlock2
NOP	
L_Flash_R_W_NVMUnlock3:
;Flash_R_W.c,138 :: 		Delay_us(20);
LUI	R24, 0
ORI	R24, R24, 1332
L_Flash_R_W_NVMUnlock4:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Flash_R_W_NVMUnlock4
NOP	
NOP	
NOP	
;Flash_R_W.c,141 :: 		NVMKEY = 0x0;
SW	R0, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,142 :: 		NVMKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,143 :: 		NVMKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,145 :: 		NVMCONSET = 1 << 15;
ORI	R2, R0, 32768
SW	R2, Offset(NVMCONSET+0)(GP)
;Flash_R_W.c,148 :: 		while(dma_susp){
L_Flash_R_W_NVMUnlock6:
LHU	R2, 6(SP)
BNE	R2, R0, L_Flash_R_W_NVMUnlock34
NOP	
J	L_Flash_R_W_NVMUnlock7
NOP	
L_Flash_R_W_NVMUnlock34:
;Flash_R_W.c,149 :: 		dma_susp = DMA_Resume();
JAL	_DMA_Resume+0
NOP	
SH	R2, 6(SP)
;Flash_R_W.c,150 :: 		}
J	L_Flash_R_W_NVMUnlock6
NOP	
L_Flash_R_W_NVMUnlock7:
;Flash_R_W.c,153 :: 		if (I_status)
LHU	R2, 4(SP)
BNE	R2, R0, L_Flash_R_W_NVMUnlock36
NOP	
J	L_Flash_R_W_NVMUnlock8
NOP	
L_Flash_R_W_NVMUnlock36:
;Flash_R_W.c,154 :: 		EI();
EI	R30
L_Flash_R_W_NVMUnlock8:
;Flash_R_W.c,157 :: 		while(NVM_WR_Wait());
L_Flash_R_W_NVMUnlock9:
JAL	Flash_R_W_NVM_WR_Wait+0
NOP	
BNE	R2, R0, L_Flash_R_W_NVMUnlock38
NOP	
J	L_Flash_R_W_NVMUnlock10
NOP	
L_Flash_R_W_NVMUnlock38:
J	L_Flash_R_W_NVMUnlock9
NOP	
L_Flash_R_W_NVMUnlock10:
;Flash_R_W.c,160 :: 		while(NVM_WREN_Rst());
L_Flash_R_W_NVMUnlock11:
JAL	Flash_R_W_NVM_WREN_Rst+0
NOP	
BNE	R2, R0, L_Flash_R_W_NVMUnlock40
NOP	
J	L_Flash_R_W_NVMUnlock12
NOP	
L_Flash_R_W_NVMUnlock40:
J	L_Flash_R_W_NVMUnlock11
NOP	
L_Flash_R_W_NVMUnlock12:
;Flash_R_W.c,163 :: 		return (NVMCON & 0x3000)>>12;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 12288
SRL	R2, R2, 12
;Flash_R_W.c,164 :: 		}
L_end_NVMUnlock:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of Flash_R_W_NVMUnlock
Flash_R_W_NVM_ERROR_Rst:
;Flash_R_W.c,168 :: 		static unsigned int NVM_ERROR_Rst(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,169 :: 		unsigned int error= 0;
;Flash_R_W.c,170 :: 		NVMCON = 0;
SW	R0, Offset(NVMCON+0)(GP)
;Flash_R_W.c,173 :: 		NVM_WREN_Set();
JAL	Flash_R_W_NVM_WREN_Set+0
NOP	
;Flash_R_W.c,175 :: 		NVM_WR_Set();
JAL	Flash_R_W_NVM_WR_Set+0
NOP	
;Flash_R_W.c,177 :: 		while(NVM_WR_Wait());
L_Flash_R_W_NVM_ERROR_Rst13:
JAL	Flash_R_W_NVM_WR_Wait+0
NOP	
BNE	R2, R0, L_Flash_R_W_NVM_ERROR_Rst43
NOP	
J	L_Flash_R_W_NVM_ERROR_Rst14
NOP	
L_Flash_R_W_NVM_ERROR_Rst43:
J	L_Flash_R_W_NVM_ERROR_Rst13
NOP	
L_Flash_R_W_NVM_ERROR_Rst14:
;Flash_R_W.c,180 :: 		return (NVMCON & 0x3000)>>12;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 12288
SRL	R2, R2, 12
;Flash_R_W.c,181 :: 		}
L_end_NVM_ERROR_Rst:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Flash_R_W_NVM_ERROR_Rst
Flash_R_W_NVM_WR_Set:
;Flash_R_W.c,185 :: 		static unsigned int NVM_WR_Set(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,187 :: 		NVMCONSET |= 1 << 15;
LW	R2, Offset(NVMCONSET+0)(GP)
ORI	R2, R2, 32768
SW	R2, Offset(NVMCONSET+0)(GP)
;Flash_R_W.c,188 :: 		return NVM_WR_Wait();
JAL	Flash_R_W_NVM_WR_Wait+0
NOP	
;Flash_R_W.c,189 :: 		}
L_end_NVM_WR_Set:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Flash_R_W_NVM_WR_Set
Flash_R_W_NVM_WR_Wait:
;Flash_R_W.c,193 :: 		static unsigned int NVM_WR_Wait(){
;Flash_R_W.c,194 :: 		return (NVMCON & 0x8000) >> 15;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 32768
SRL	R2, R2, 15
;Flash_R_W.c,195 :: 		}
L_end_NVM_WR_Wait:
JR	RA
NOP	
; end of Flash_R_W_NVM_WR_Wait
Flash_R_W_NVM_WREN_Set:
;Flash_R_W.c,199 :: 		static unsigned int NVM_WREN_Set(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,200 :: 		NVMCONSET = 1 << 14;
ORI	R2, R0, 16384
SW	R2, Offset(NVMCONSET+0)(GP)
;Flash_R_W.c,201 :: 		while(!NVM_WREN_Wait());
L_Flash_R_W_NVM_WREN_Set15:
JAL	Flash_R_W_NVM_WREN_Wait+0
NOP	
BEQ	R2, R0, L_Flash_R_W_NVM_WREN_Set47
NOP	
J	L_Flash_R_W_NVM_WREN_Set16
NOP	
L_Flash_R_W_NVM_WREN_Set47:
J	L_Flash_R_W_NVM_WREN_Set15
NOP	
L_Flash_R_W_NVM_WREN_Set16:
;Flash_R_W.c,202 :: 		return (NVMCON & 4000)>>14;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 4000
SRL	R2, R2, 14
;Flash_R_W.c,203 :: 		}
L_end_NVM_WREN_Set:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Flash_R_W_NVM_WREN_Set
Flash_R_W_NVM_WREN_Rst:
;Flash_R_W.c,207 :: 		static unsigned int NVM_WREN_Rst(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,208 :: 		NVMCONCLR = 1<<14;
ORI	R2, R0, 16384
SW	R2, Offset(NVMCONCLR+0)(GP)
;Flash_R_W.c,209 :: 		while(NVM_WREN_Wait());
L_Flash_R_W_NVM_WREN_Rst17:
JAL	Flash_R_W_NVM_WREN_Wait+0
NOP	
BNE	R2, R0, L_Flash_R_W_NVM_WREN_Rst50
NOP	
J	L_Flash_R_W_NVM_WREN_Rst18
NOP	
L_Flash_R_W_NVM_WREN_Rst50:
J	L_Flash_R_W_NVM_WREN_Rst17
NOP	
L_Flash_R_W_NVM_WREN_Rst18:
;Flash_R_W.c,210 :: 		return (NVMCON & 4000)>>14;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 4000
SRL	R2, R2, 14
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
_NVMReadRow:
;Flash_R_W.c,230 :: 		void NVMReadRow(unsigned long addr){
ADDIU	SP, SP, -556
SW	RA, 0(SP)
;Flash_R_W.c,231 :: 		unsigned long buff[128] = {0};
ADDIU	R23, SP, 44
ADDIU	R22, R23, 512
LUI	R24, hi_addr(?ICSNVMReadRow_buff_L0+0)
ORI	R24, R24, lo_addr(?ICSNVMReadRow_buff_L0+0)
JAL	___CC2DW+0
NOP	
;Flash_R_W.c,236 :: 		ptr = (unsigned long*)addr;
SW	R25, 12(SP)
;Flash_R_W.c,239 :: 		for(j = 0;j < 128;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
MOVZ	R6, R5, R0
L_NVMReadRow19:
; j start address is: 24 (R6)
SLTIU	R2, R6, 128
BNE	R2, R0, L__NVMReadRow54
NOP	
J	L_NVMReadRow20
NOP	
L__NVMReadRow54:
;Flash_R_W.c,240 :: 		buff[j] = *(ptr+j);
ADDIU	R5, SP, 44
SLL	R4, R6, 2
ADDU	R3, R5, R4
LW	R2, 12(SP)
ADDU	R2, R2, R4
LW	R2, 0(R2)
SW	R2, 0(R3)
;Flash_R_W.c,241 :: 		if(buff[j] < 0xFFFFFFFF)
SLL	R2, R6, 2
ADDU	R2, R5, R2
LW	R2, 0(R2)
SLTIU	R2, R2, 65535
BNE	R2, R0, L__NVMReadRow55
NOP	
J	L_NVMReadRow22
NOP	
L__NVMReadRow55:
;Flash_R_W.c,242 :: 		val = ulong2flt(buff[j]);
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
;Flash_R_W.c,243 :: 		else val = 0.00;
MOVZ	R2, R0, R0
SW	R2, 16(SP)
L_NVMReadRow23:
;Flash_R_W.c,245 :: 		while(DMA_IsOn(1));
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
BNE	R2, R0, L__NVMReadRow57
NOP	
J	L_NVMReadRow25
NOP	
L__NVMReadRow57:
J	L_NVMReadRow24
NOP	
L_NVMReadRow25:
;Flash_R_W.c,246 :: 		dma_printf("val:= %f\tbuff[%l]:= %l\n",val,j,buff[j]);
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
;Flash_R_W.c,239 :: 		for(j = 0;j < 128;j++){
ADDIU	R2, R4, 1
; j end address is: 16 (R4)
; j start address is: 20 (R5)
MOVZ	R5, R2, R0
;Flash_R_W.c,247 :: 		}
MOVZ	R6, R5, R0
; j end address is: 20 (R5)
J	L_NVMReadRow19
NOP	
L_NVMReadRow20:
;Flash_R_W.c,249 :: 		}
L_end_NVMReadRow:
LW	RA, 0(SP)
ADDIU	SP, SP, 556
JR	RA
NOP	
; end of _NVMReadRow
