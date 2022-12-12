#include "GCODE.h"

parser_state_t gc;

#define FAIL(status) gc.status_code = status;

// {G 0,1,2,3,80}
void G_Mode(int mode){
   gc.motion_mode = mode;
   #if GcodeDebug == 1
      while(DMA_Busy(1));
      dma_printf("gc.motion_mode:= %d\n",mode);
  #endif
}

//{M 0,1,2,30}
void M_Instruction(int flow){
  gc.program_flow = flow;
   #if GcodeDebug == 1
      while(DMA_Busy(1));
      dma_printf("gc.program_flow:= %d\n",flow);
  #endif
}

//{X,Y,Z,A} Movement values
void G_Instruction(char *c,void *any){
float XYZ_Val;
int F_Val;

   switch(c[0]){
      case 'X':
            XYZ_Val = *(float*)any;
            gc.next_position[X] = XYZ_Val;
            break;
      case 'Y':
            XYZ_Val = *(float*)any;
            gc.next_position[Y] = XYZ_Val;
            break;
      case 'Z':
            XYZ_Val = *(float*)any;
            gc.next_position[Z] = XYZ_Val;
            break;
      case 'A':
            XYZ_Val = *(float*)any;
            gc.next_position[A] = XYZ_Val;
            break;
      case 'E':
            XYZ_Val = *(float*)any;
            gc.next_position[B] = XYZ_Val;
            break;
      case 'F':
            F_Val = *(int*)any;
            gc.frequency = F_Val;
            break;
   }
  #if GcodeDebug == 1
      while(DMA_Busy(1));
      if(c[0] != 'F')
         dma_printf("\t%c\t%f\n",c[0],XYZ_Val);
      else
         dma_printf("\t%c\t%d\n",c[0],F_Val);
  #endif
}

