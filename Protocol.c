#include "protocol.h"

char nl[] = "\n\r";
char gcode[arr_size][str_size];
char *test;

void Str_Initialize(){
int i;
 // gcode = (char**)Malloc(sizeof(char)*arr_size);
  for(i = 0; i <= arr_size;i++){
    memset(gcode[i],0,str_size);
  }
}


void Sample_Ringbuffer(){
char str[50];
char temp[20];
int dif = 0,i,j;
int G_Val;
    //read head and tail pointer difference
    //if there is a difference then process line
    dif = Get_Difference();
    
    if(dif > 0){

        Get_Line(str,dif);
        dma_printf("\n%s",str);
        while(DMA_Busy(1));
        SplitInstruction(gcode,str,0x20);
        switch(gcode[0][0]){
         case 'G':
              //strcpy(temp,(gcode[0]));
              CopyStr(temp,"01", 2);
              for(i=0;i<2;i++){
                dma_printf("\n%c",temp[i]);
                while(DMA_Busy(1));
              }
             //G_Val = atoi(temp+1);
             // G_Instruction(G_Val);
              dma_printf("\n%s\n%s\n%s\n%s",gcode[0],gcode[1],gcode[2],gcode[3]);
              while(DMA_Busy(1));
              break;
         case 'M':
              break;
        
        }

    }
    
}



//split up the line into usable code blocks
void SplitInstruction(char arg[arr_size][str_size],char *str,char c){
int i,j;
 i = j = 0;
 while(*str != '\0'){
  if(*str == c){
    *(arg[i]+j)='\0';
    j = 0;
    i++;
    str++;
  }
  *(arg[i]+j) = *str;
  j++;
  str++;
 }
 *(arg[i]+j)='\0';
}

int CopyStr(char *to,char *from, int len){

     strcpy(to,from);
  return  1;
}