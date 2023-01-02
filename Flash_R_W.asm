_NVMWriteWord:
;Flash_R_W.c,51 :: 		unsigned int NVMWriteWord (unsigned long address, unsigned long _data){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Flash_R_W.c,53 :: 		unsigned long padd = address;
; padd start address is: 12 (R3)
MOVZ	R3, R25, R0
;Flash_R_W.c,56 :: 		NVM_ERROR_Rst();
JAL	Flash_R_W_NVM_ERROR_Rst+0
NOP	
;Flash_R_W.c,59 :: 		padd &= FLASH_PADDRESS_OFFSET;
LUI	R2, 8191
ORI	R2, R2, 65535
AND	R2, R3, R2
; padd end address is: 12 (R3)
;Flash_R_W.c,62 :: 		NVMADDR = padd;
SW	R2, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,63 :: 		while(DMA_IsOn(1));
L_NVMWriteWord0:
SW	R26, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 8(SP)
LW	R26, 4(SP)
BNE	R2, R0, L__NVMWriteWord30
NOP	
J	L_NVMWriteWord1
NOP	
L__NVMWriteWord30:
J	L_NVMWriteWord0
NOP	
L_NVMWriteWord1:
;Flash_R_W.c,64 :: 		dma_printf("address:= %l\n",NVMADDR);
ADDIU	R23, SP, 12
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr1_Flash_R_W+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Flash_R_W+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 12
LW	R2, Offset(NVMADDR+0)(GP)
SW	R26, 4(SP)
SW	R25, 8(SP)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 8
LW	R25, 8(SP)
LW	R26, 4(SP)
;Flash_R_W.c,67 :: 		NVMDATA0 = _data; // value
SW	R26, Offset(NVMDATA0+0)(GP)
;Flash_R_W.c,70 :: 		res = NVMUnlock (0x4001);
SW	R26, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 16385
JAL	Flash_R_W_NVMUnlock+0
NOP	
LW	R25, 8(SP)
LW	R26, 4(SP)
;Flash_R_W.c,73 :: 		return res;
;Flash_R_W.c,74 :: 		}
L_end_NVMWriteWord:
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _NVMWriteWord
_NVMWriteRow:
;Flash_R_W.c,77 :: 		unsigned int NVMWriteRow (void* address, void* _data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,80 :: 		NVMADDR = (unsigned long)address;
SW	R25, 4(SP)
SW	R25, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,83 :: 		NVMSRCADDR = (unsigned long) _data;
SW	R26, Offset(NVMSRCADDR+0)(GP)
;Flash_R_W.c,86 :: 		res = NVMUnlock(0x4003);
ORI	R25, R0, 16387
JAL	Flash_R_W_NVMUnlock+0
NOP	
;Flash_R_W.c,88 :: 		return res;
;Flash_R_W.c,89 :: 		}
;Flash_R_W.c,88 :: 		return res;
;Flash_R_W.c,89 :: 		}
L_end_NVMWriteRow:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMWriteRow
_NVMErasePage:
;Flash_R_W.c,91 :: 		unsigned int NVMErasePage(void* address){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,94 :: 		NVMADDR = (unsigned long) address;
SW	R25, 4(SP)
SW	R25, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,96 :: 		res = NVMUnlock(0x4004);
ORI	R25, R0, 16388
JAL	Flash_R_W_NVMUnlock+0
NOP	
;Flash_R_W.c,98 :: 		return res;
;Flash_R_W.c,99 :: 		}
;Flash_R_W.c,98 :: 		return res;
;Flash_R_W.c,99 :: 		}
L_end_NVMErasePage:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMErasePage
Flash_R_W_NVMUnlock:
;Flash_R_W.c,103 :: 		static unsigned int NVMUnlock (unsigned int nvmop){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Flash_R_W.c,105 :: 		unsigned int dma_susp=0;   // storage for current DMA state
MOVZ	R30, R0, R0
SH	R30, 8(SP)
;Flash_R_W.c,108 :: 		I_status = (unsigned int)DI();
DI	R30
SH	R30, 6(SP)
;Flash_R_W.c,111 :: 		while(!dma_susp)
L_Flash_R_W_NVMUnlock2:
LHU	R2, 8(SP)
BEQ	R2, R0, L_Flash_R_W_NVMUnlock34
NOP	
J	L_Flash_R_W_NVMUnlock3
NOP	
L_Flash_R_W_NVMUnlock34:
;Flash_R_W.c,112 :: 		dma_susp = DMA_Suspend();
SH	R25, 4(SP)
JAL	_DMA_Suspend+0
NOP	
LHU	R25, 4(SP)
SH	R2, 8(SP)
J	L_Flash_R_W_NVMUnlock2
NOP	
L_Flash_R_W_NVMUnlock3:
;Flash_R_W.c,115 :: 		NVM_WREN_Set();
JAL	Flash_R_W_NVM_WREN_Set+0
NOP	
;Flash_R_W.c,118 :: 		while(!NVM_WREN_Wait());
L_Flash_R_W_NVMUnlock4:
JAL	Flash_R_W_NVM_WREN_Wait+0
NOP	
BEQ	R2, R0, L_Flash_R_W_NVMUnlock35
NOP	
J	L_Flash_R_W_NVMUnlock5
NOP	
L_Flash_R_W_NVMUnlock35:
J	L_Flash_R_W_NVMUnlock4
NOP	
L_Flash_R_W_NVMUnlock5:
;Flash_R_W.c,121 :: 		Delay_us(20);
LUI	R24, 0
ORI	R24, R24, 1332
L_Flash_R_W_NVMUnlock6:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Flash_R_W_NVMUnlock6
NOP	
NOP	
NOP	
;Flash_R_W.c,124 :: 		NVMKEY = 0x0;
SW	R0, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,125 :: 		NVMKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,126 :: 		NVMKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,128 :: 		NVMCONSET = 1 << 15;
ORI	R2, R0, 32768
SW	R2, Offset(NVMCONSET+0)(GP)
;Flash_R_W.c,131 :: 		while(dma_susp){
L_Flash_R_W_NVMUnlock8:
LHU	R2, 8(SP)
BNE	R2, R0, L_Flash_R_W_NVMUnlock37
NOP	
J	L_Flash_R_W_NVMUnlock9
NOP	
L_Flash_R_W_NVMUnlock37:
;Flash_R_W.c,132 :: 		dma_susp = DMA_Resume();
SH	R25, 4(SP)
JAL	_DMA_Resume+0
NOP	
LHU	R25, 4(SP)
SH	R2, 8(SP)
;Flash_R_W.c,133 :: 		}
J	L_Flash_R_W_NVMUnlock8
NOP	
L_Flash_R_W_NVMUnlock9:
;Flash_R_W.c,136 :: 		if (I_status)
LHU	R2, 6(SP)
BNE	R2, R0, L_Flash_R_W_NVMUnlock39
NOP	
J	L_Flash_R_W_NVMUnlock10
NOP	
L_Flash_R_W_NVMUnlock39:
;Flash_R_W.c,137 :: 		EI();
EI	R30
L_Flash_R_W_NVMUnlock10:
;Flash_R_W.c,140 :: 		while(NVM_WR_Wait());
L_Flash_R_W_NVMUnlock11:
JAL	Flash_R_W_NVM_WR_Wait+0
NOP	
BNE	R2, R0, L_Flash_R_W_NVMUnlock41
NOP	
J	L_Flash_R_W_NVMUnlock12
NOP	
L_Flash_R_W_NVMUnlock41:
J	L_Flash_R_W_NVMUnlock11
NOP	
L_Flash_R_W_NVMUnlock12:
;Flash_R_W.c,143 :: 		while(NVM_WREN_Rst());
L_Flash_R_W_NVMUnlock13:
JAL	Flash_R_W_NVM_WREN_Rst+0
NOP	
BNE	R2, R0, L_Flash_R_W_NVMUnlock43
NOP	
J	L_Flash_R_W_NVMUnlock14
NOP	
L_Flash_R_W_NVMUnlock43:
J	L_Flash_R_W_NVMUnlock13
NOP	
L_Flash_R_W_NVMUnlock14:
;Flash_R_W.c,146 :: 		return (NVMCON & 0x3000)>>12;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 12288
SRL	R2, R2, 12
;Flash_R_W.c,147 :: 		}
L_end_NVMUnlock:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of Flash_R_W_NVMUnlock
Flash_R_W_NVM_ERROR_Rst:
;Flash_R_W.c,151 :: 		static unsigned int NVM_ERROR_Rst(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,152 :: 		unsigned int error= 0;
;Flash_R_W.c,153 :: 		NVMCON = 0;
SW	R0, Offset(NVMCON+0)(GP)
;Flash_R_W.c,156 :: 		NVM_WREN_Set();
JAL	Flash_R_W_NVM_WREN_Set+0
NOP	
;Flash_R_W.c,158 :: 		NVM_WR_Set();
JAL	Flash_R_W_NVM_WR_Set+0
NOP	
;Flash_R_W.c,160 :: 		while(NVM_WR_Wait());
L_Flash_R_W_NVM_ERROR_Rst15:
JAL	Flash_R_W_NVM_WR_Wait+0
NOP	
BNE	R2, R0, L_Flash_R_W_NVM_ERROR_Rst46
NOP	
J	L_Flash_R_W_NVM_ERROR_Rst16
NOP	
L_Flash_R_W_NVM_ERROR_Rst46:
J	L_Flash_R_W_NVM_ERROR_Rst15
NOP	
L_Flash_R_W_NVM_ERROR_Rst16:
;Flash_R_W.c,163 :: 		return (NVMCON & 0x3000)>>12;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 12288
SRL	R2, R2, 12
;Flash_R_W.c,164 :: 		}
L_end_NVM_ERROR_Rst:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Flash_R_W_NVM_ERROR_Rst
Flash_R_W_NVM_WR_Set:
;Flash_R_W.c,168 :: 		static unsigned int NVM_WR_Set(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,170 :: 		NVMCONSET |= 1 << 15;
LW	R2, Offset(NVMCONSET+0)(GP)
ORI	R2, R2, 32768
SW	R2, Offset(NVMCONSET+0)(GP)
;Flash_R_W.c,171 :: 		return NVM_WR_Wait();
JAL	Flash_R_W_NVM_WR_Wait+0
NOP	
;Flash_R_W.c,172 :: 		}
L_end_NVM_WR_Set:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Flash_R_W_NVM_WR_Set
Flash_R_W_NVM_WR_Wait:
;Flash_R_W.c,176 :: 		static unsigned int NVM_WR_Wait(){
;Flash_R_W.c,177 :: 		return (NVMCON & 0x8000) >> 15;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 32768
SRL	R2, R2, 15
;Flash_R_W.c,178 :: 		}
L_end_NVM_WR_Wait:
JR	RA
NOP	
; end of Flash_R_W_NVM_WR_Wait
Flash_R_W_NVM_WREN_Set:
;Flash_R_W.c,182 :: 		static unsigned int NVM_WREN_Set(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,183 :: 		NVMCONSET = 1 << 14;
ORI	R2, R0, 16384
SW	R2, Offset(NVMCONSET+0)(GP)
;Flash_R_W.c,184 :: 		while(!NVM_WREN_Wait());
L_Flash_R_W_NVM_WREN_Set17:
JAL	Flash_R_W_NVM_WREN_Wait+0
NOP	
BEQ	R2, R0, L_Flash_R_W_NVM_WREN_Set50
NOP	
J	L_Flash_R_W_NVM_WREN_Set18
NOP	
L_Flash_R_W_NVM_WREN_Set50:
J	L_Flash_R_W_NVM_WREN_Set17
NOP	
L_Flash_R_W_NVM_WREN_Set18:
;Flash_R_W.c,185 :: 		return (NVMCON & 4000)>>14;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 4000
SRL	R2, R2, 14
;Flash_R_W.c,186 :: 		}
L_end_NVM_WREN_Set:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Flash_R_W_NVM_WREN_Set
Flash_R_W_NVM_WREN_Rst:
;Flash_R_W.c,190 :: 		static unsigned int NVM_WREN_Rst(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Flash_R_W.c,191 :: 		NVMCONCLR = 1<<14;
ORI	R2, R0, 16384
SW	R2, Offset(NVMCONCLR+0)(GP)
;Flash_R_W.c,192 :: 		while(NVM_WREN_Wait());
L_Flash_R_W_NVM_WREN_Rst19:
JAL	Flash_R_W_NVM_WREN_Wait+0
NOP	
BNE	R2, R0, L_Flash_R_W_NVM_WREN_Rst53
NOP	
J	L_Flash_R_W_NVM_WREN_Rst20
NOP	
L_Flash_R_W_NVM_WREN_Rst53:
J	L_Flash_R_W_NVM_WREN_Rst19
NOP	
L_Flash_R_W_NVM_WREN_Rst20:
;Flash_R_W.c,193 :: 		return (NVMCON & 4000)>>14;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 4000
SRL	R2, R2, 14
;Flash_R_W.c,194 :: 		}
L_end_NVM_WREN_Rst:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of Flash_R_W_NVM_WREN_Rst
Flash_R_W_NVM_WREN_Wait:
;Flash_R_W.c,198 :: 		static unsigned int NVM_WREN_Wait(){
;Flash_R_W.c,199 :: 		return (NVMCON & 0x4000) >> 14;
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 16384
SRL	R2, R2, 14
;Flash_R_W.c,200 :: 		}
L_end_NVM_WREN_Wait:
JR	RA
NOP	
; end of Flash_R_W_NVM_WREN_Wait
_NVMReadWord:
;Flash_R_W.c,205 :: 		unsigned long NVMReadWord(void *addr){
;Flash_R_W.c,208 :: 		val = *((unsigned long*)addr);
LW	R2, 0(R25)
;Flash_R_W.c,210 :: 		return val;
;Flash_R_W.c,211 :: 		}
L_end_NVMReadWord:
JR	RA
NOP	
; end of _NVMReadWord
_NVMReadRow:
;Flash_R_W.c,213 :: 		void NVMReadRow(unsigned long addr){
ADDIU	SP, SP, -556
SW	RA, 0(SP)
;Flash_R_W.c,214 :: 		unsigned long buff[128] = {0};
ADDIU	R23, SP, 44
ADDIU	R22, R23, 512
LUI	R24, hi_addr(?ICSNVMReadRow_buff_L0+0)
ORI	R24, R24, lo_addr(?ICSNVMReadRow_buff_L0+0)
JAL	___CC2DW+0
NOP	
;Flash_R_W.c,219 :: 		ptr = (unsigned long*)addr;
SW	R25, 12(SP)
;Flash_R_W.c,222 :: 		for(j = 0;j < 128;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
MOVZ	R6, R5, R0
L_NVMReadRow21:
; j start address is: 24 (R6)
SLTIU	R2, R6, 128
BNE	R2, R0, L__NVMReadRow57
NOP	
J	L_NVMReadRow22
NOP	
L__NVMReadRow57:
;Flash_R_W.c,223 :: 		buff[j] = *(ptr+j);
ADDIU	R5, SP, 44
SLL	R4, R6, 2
ADDU	R3, R5, R4
LW	R2, 12(SP)
ADDU	R2, R2, R4
LW	R2, 0(R2)
SW	R2, 0(R3)
;Flash_R_W.c,224 :: 		if(buff[j] < 0xFFFFFFFF)
SLL	R2, R6, 2
ADDU	R2, R5, R2
LW	R2, 0(R2)
SLTIU	R2, R2, 65535
BNE	R2, R0, L__NVMReadRow58
NOP	
J	L_NVMReadRow24
NOP	
L__NVMReadRow58:
;Flash_R_W.c,225 :: 		val = ulong2flt(buff[j]);
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
J	L_NVMReadRow25
NOP	
L_NVMReadRow24:
;Flash_R_W.c,226 :: 		else val = 0.00;
MOVZ	R2, R0, R0
SW	R2, 16(SP)
L_NVMReadRow25:
;Flash_R_W.c,228 :: 		while(DMA_IsOn(1));
MOVZ	R4, R6, R0
; j end address is: 24 (R6)
L_NVMReadRow26:
; j start address is: 16 (R4)
SW	R4, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_DMA_IsOn+0
NOP	
LW	R25, 8(SP)
LW	R4, 4(SP)
BNE	R2, R0, L__NVMReadRow60
NOP	
J	L_NVMReadRow27
NOP	
L__NVMReadRow60:
J	L_NVMReadRow26
NOP	
L_NVMReadRow27:
;Flash_R_W.c,229 :: 		dma_printf("val:= %f\tbuff[%l]:= %l\n",val,j,buff[j]);
ADDIU	R3, SP, 44
SLL	R2, R4, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
ADDIU	R23, SP, 20
ADDIU	R22, R23, 24
LUI	R24, hi_addr(?ICS?lstr2_Flash_R_W+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Flash_R_W+0)
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
;Flash_R_W.c,222 :: 		for(j = 0;j < 128;j++){
ADDIU	R2, R4, 1
; j end address is: 16 (R4)
; j start address is: 20 (R5)
MOVZ	R5, R2, R0
;Flash_R_W.c,230 :: 		}
MOVZ	R6, R5, R0
; j end address is: 20 (R5)
J	L_NVMReadRow21
NOP	
L_NVMReadRow22:
;Flash_R_W.c,232 :: 		}
L_end_NVMReadRow:
LW	RA, 0(SP)
ADDIU	SP, SP, 556
JR	RA
NOP	
; end of _NVMReadRow
