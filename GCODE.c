#include "GCODE.h"

parser_state_t gc;

void G_Instruction(int mode){
   while(DMA_Busy(1));
   dma_printf("%d\r\n",mode);
}