#include "protocol.h"


char gcode[arr_size][str_size];

void Str_Initialize(char arg[arr_size][str_size]){
int i;
  //gcode = (char**)Malloc(sizeof(char)*arr_size);
  for(i = 0; i <= arr_size;i++){
    memset(arg[i],0,str_size);
   // while(DMA_Busy(1));
   // dma_printf("gcode[i]:= %s\r\n",gcode[i]);
  }
}


void Sample_Ringbuffer(){
char str[50];
char temp[6];
char xyz[5];
int dif,i,j,num_of_strings;
int G_Val,F_Val,M_Val,S_Val;
float XYZ_Val;

    //read head and tail pointer difference
    //if there is a difference then process line
    dif = 0;
    dif = Get_Difference();

    if(dif > 0){
       Get_Line(str,dif);
       num_of_strings = strsplit(gcode,str,0x20);
        switch(gcode[0][0]){
         case 'G':
              //get g instruction
              if (*(*(gcode)+0)=='G'){
                 i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
                 G_Val = atoi(temp);
                 G_Mode(G_Val);
                 #if ProtoDebug == 1
                  PrintDebug(gcode[0],temp,&G_Val);
                 #endif
                 

               //get position a
               if(*(*(gcode+1)+0) != 0){
                 i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
                 switch(*(*(gcode+1))) {
                    case 'X':
                    case 'x':
                    case 'Y':
                    case 'y':
                    case 'Z':
                    case 'z':
                    case 'A':
                    case 'a':
                    case 'E':
                    case 'e':
                       XYZ_Val = atof(temp);
                       G_Instruction(gcode[1],&XYZ_Val);
                       #if ProtoDebug == 1
                         PrintDebug(gcode[1],temp,&XYZ_Val);
                       #endif
                       break;
                    case 'F':
                    case 'f':
                       F_Val = atoi(temp);
                       G_Instruction(*gcode[1],&F_Val);
                       #if ProtoDebug == 1
                         PrintDebug(gcode[1],temp,&F_Val);
                       #endif
                       break;
                 }
                }
                //get position b
                if(*(*(gcode+2)+0) != 0){
                   xyz[1] = *(*(gcode+2)+0);
                   i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
                   switch(*(*(gcode+2))) {
                      case 'X':
                      case 'x':
                      case 'Y':
                      case 'y':
                      case 'Z':
                      case 'z':
                      case 'A':
                      case 'a':
                      case 'E':
                      case 'e':
                         XYZ_Val = atof(temp);
                         G_Instruction(gcode[2],&XYZ_Val);
                         #if ProtoDebug == 1
                           PrintDebug(gcode[2],temp,&XYZ_Val);
                         #endif
                         break;
                      case 'F':
                      case 'f':
                         F_Val = atoi(temp);
                         G_Instruction(gcode[2],&F_Val);
                         #if ProtoDebug == 1
                           PrintDebug(gcode[2],temp,&F_Val);
                         #endif
                         break;

                   }
                }
                  //get F value
                if(*(*(gcode+3)+0) != 0){
                  xyz[2] = *(*(gcode+3)+0);
                  i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
                   switch(*(*(gcode+3))) {
                      case 'X':
                      case 'x':
                      case 'Y':
                      case 'y':
                      case 'Z':
                      case 'z':
                      case 'A':
                      case 'a':
                      case 'E':
                      case 'e':
                         XYZ_Val = atof(temp);
                         G_Instruction(gcode[3],&XYZ_Val);
                         #if ProtoDebug == 1
                           PrintDebug(gcode[3],temp,&XYZ_Val);
                         #endif
                         break;
                      case 'F':
                      case 'f':
                         F_Val = atoi(temp);
                         G_Instruction(gcode[3],&F_Val);
                         #if ProtoDebug == 1
                           PrintDebug(gcode[3],temp,&F_Val);
                         #endif
                         break;

                   }
                }
              }else{
                 return;
              }
              break;
         case 'M':
         case 'm':
              //get m instruction
                 i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
                 M_Val = atoi(temp);
                 //M_Instruction(M_Val);     //?? notneeded yet! debugging instructions
                 #if ProtoDebug == 1
                  PrintDebug(gcode[0],temp,&M_Val);
                 #endif

                //get position a
                if((*(gcode+1)) != 0){
                     switch(*(*(gcode+1))){
                       case 'S':
                       case 's':
                       //add more cases when needing more instructions
                           i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
                           S_Val = atoi(temp);
                           #if ProtoDebug == 1
                             PrintDebug(gcode[1],temp,&S_Val);
                           #endif
                           break;
                     }
                }
              break;
       }

    }
     // Free(temp,5);
     memset(str,0,30);
}


/*********************************************************************
* Split the string according to the char
*********************************************************************/
int strsplit(char arg[arr_size][str_size],char *str, char c){
int i,ii,kk,err,lasti,len;
    Str_Initialize(arg);
    len = strlen(str);
    ii=kk=err=lasti=0;
    for (i = 0; i < len;i++){
        err = i - lasti; //test if string in string is < 49
        if(*(str+i) == c || *(str+i) == '\n'  || err > 49){
          arg[kk++][ii] = 0;
          ii=err=0;
          lasti = i;
          continue;
        }else{
          arg[kk][ii++] = *(str+i);
       }
       if(*(str+i)==0)
          break;
    }
    arg[kk][0] = 0;
    return kk;
}

int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
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
float XYZ_Val;

      switch(strA[0]){
         case 'G':
         case 'g':
         case 'F':
         case 'f':
         case 'M':
         case 'm':
         case 'S':
         case 's':
         case 'E':
         case 'e':
              G_Val = *(int*)ptr;
              while(DMA_Busy(1));
              dma_printf("%c\t%s\t%d\n",strA[0],strB,G_Val);
              break;
         case 'X':
         case 'x':
         case 'Y':
         case 'y':
         case 'Z':
         case 'z':
         case 'A':
         case 'a':
              XYZ_Val = *(float*)ptr;
              while(DMA_Busy(1));
              dma_printf("%c\t%s\t%f\n",strA[0],strB,XYZ_Val);
              break;
      }

}
#endif