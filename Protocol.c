#include "protocol.h"


char gcode[arr_size][str_size];
char str[50];
char *test;



void Str_Initialize(){
int i;
  //gcode = (char**)Malloc(sizeof(char)*arr_size);
  for(i = 0; i <= arr_size;i++){
    memset(gcode[i],0,str_size);
  }
}


void Sample_Ringbuffer(){
char temp[6];
int dif = 0,i,j;
int G_Val,F_Val;
float XYZ_Val;
    // temp = (char*)Malloc(sizeof(char)*5);
    //read head and tail pointer difference
    //if there is a difference then process line
    dif = Get_Difference();
    
    if(dif > 0){

        Get_Line(str,dif);
      // dma_printf("\n%s",str);
      //  while(DMA_Busy(1));
        //Split Instruction(gcode,str,0x20);
        strsplit(gcode,str,0x20);
        switch(gcode[0][0]){
         case 'G':
              //get g instruction
              if (*(*(gcode)+0)=='G'){
                 i = cpystr(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
                 G_Val = atoi(temp);
                 G_Instruction(G_Val);
                 #if ProtoDebug == 1
                  PrintDebug(gcode[0],temp,G_Val);
                 #endif
               //get position a
               if((*(gcode+1)) != 0){
                 i = cpystr(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
                 XYZ_Val = atof(temp);
                 #if ProtoDebug == 2
                   while(DMA_Busy(1));
                   dma_printf("%s\t%s\t%f\r\n",gcode[1],temp,XYZ_Val);
                 #endif
                }
                //get position b
                if((*(gcode+2)) != 0){
                  i = cpystr(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
                  XYZ_Val = atof(temp);
                  #if ProtoDebug == 2
                    while(DMA_Busy(1));
                    dma_printf("%s\t%s\t%f\r\n",gcode[2],temp,XYZ_Val);
                  #endif
                }
                  //get F value
                if((*(gcode+3)) != 0){
                  i = cpystr(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
                  F_Val = atoi(temp);
                  #if ProtoDebug == 2
                    while(DMA_Busy(1));
                    dma_printf("%s  %s  %d\r\n",gcode[3],temp,F_Val);
                  #endif
                }
              }else if(*(*(gcode+0)+0)=='M'){
                 //m instruction is usually stand alone
              }else{
                 return;
              }
              break;
         case 'M':
              break;
        
        }

    }
     // Free(temp,5);
}


/*********************************************************************
* Split the string according to the char
*********************************************************************/
int strsplit(char arg[arr_size][str_size],char str[50], char c){
int i,ii,kk,err,lasti;
    ii=kk=err=lasti=0;
    for (i = 0; i < 50;i++){
        err = i - lasti;
        if(str[i] == c || str[i] == '\r' || err > 49){
          arg[kk][ii] = 0;
          kk++;
          ii=err=0;
          lasti = i;
          continue;//goto endb;
        }else{
          arg[kk][ii] = str[i];
          ii++;
       }
//endb:
       if(str[i]==0)
          break;
    }
    return kk;
}

int cpystr(char *strA,const char *strB,int indx,int num_of_char){
int i;
char *tmp;// = strB;
   tmp = strB+indx;
  *(tmp+num_of_char)=0;

   i = 0;
   while(*tmp != 0){
    *strA++ = *tmp++;
    i++;
   }
   *strA = '\0';

   return i;
}


/////////////////////////////////////////////////
//Convert str to int
int str2int(char *str,int base){
int  i, len;
int result = 0;
  
  len = strlen(str);

  for(i=0; i<len; i++){
     result = result * base + ( *(str+i) - 0x30 );
     while(DMA_Busy(1));
  }

   return result;
}


#if ProtoDebug == 1
void PrintDebug(char *strA,char *strB,void *ptr){
int G_Val;
  if(strA[0] == 'G'){
      G_Val = *(int*)ptr;
      while(DMA_Busy(1));
      dma_printf("%s\t%s\t%d\r\n",strA,strB,G_Val);
  }
}
#endif