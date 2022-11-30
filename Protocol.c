#include "protocol.h"

char nl[] = "\r\n";

void Sample_Ringbuffer(){
char gcode[str_size][arr_size];
char str[50];
int dif = 0;
    //read head and tail pointer difference
    //if there is a difference then process line
    dif = Get_Difference();
    
    if(dif > 0){
        Get_Line(str,dif);
       // dma_printf("%s\n",str);
        SplitStr(gcode,str,0x20);
        dma_printf("\n%s \n%s \n%s \n%s",gcode[0],gcode[1],gcode[2],gcode[3]);
    }
    
}


//split up the line into usable code blocks
void SplitStr(char arg[str_size][arr_size],char *str,char c){
int i,j;
 i = j = 0;

 while(*str != '\0'){
  if(*str == c){
   // str++;  ///takes the X/Y/Z from command
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