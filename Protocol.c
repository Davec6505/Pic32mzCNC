#include "protocol.h"

////////////////////////////////////////////////////
//local variables
char gcode[arr_size][str_size];


////////////////////////////////////////////////////
//reset the string array to zero
void Str_Initialize(char arg[arr_size][str_size]){
int i;
  for(i = 0; i <= arr_size;i++){
    memset(arg[i],0,str_size);
  }
}

///////////////////////////////////////////////////
//sample the ring buffer to check for data
int Sample_Ringbuffer(){
static int motion_mode;
int status;
char str[50];
char temp[9];
char xyz[6];
char F_1_Once,no_of_axis;
char axis_to_run;
int dif,i,j,num_of_strings;
int G_Val,F_Val,M_Val,S_Val;
float XYZ_Val;

    //read head and tail pointer difference
    //if there is a difference then process line
    dif = 0;
    dif = Get_Difference();

    if(dif > 0){
       G_Initialise();
       F_1_Once = no_of_axis = 0 ; //for buffer and axis refreshing
       Get_Line(str,dif);
       num_of_strings = strsplit(gcode,str,0x20);
        switch(gcode[0][0]){
         case 'G':case 'g':
              //get g instruction
              if (*(*(gcode)+0)=='G'){
                 i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
                 if(i < 3){
                   G_Val = atoi(temp);
                   if(G_Val == 28 || G_Val == 30 || G_Val == 92)
                      G_Val *= 10;
                 }else{  //counter g28.1 etc
                   G_Val = (int)(atof(temp)*10.0);
                 }
                   
                 motion_mode = G_Mode(G_Val);
                 #if ProtoDebug == 1
                  PrintDebug(*(*(gcode)+0),temp,&G_Val);
                 #endif
                 

               //get position a
               //G00/G01 X12.5 Y14.7 F0.2;
               //G02/G03 X12.5 Y14.7 I1.0 J2.0 F0.2;
               if(*(*(gcode+1)+0) != 0){
                 no_of_axis++;
                 i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
                 switch(*(*(gcode+1)+0)) {
                      case 'X':case 'x':
                      case 'Y':case 'y':
                      case 'Z':case 'z':
                      case 'A':case 'a':
                       XYZ_Val = atof(temp);
                       status = Instruction_Values(gcode[1],&XYZ_Val);
                       #if ProtoDebug == 1
                         PrintDebug(*(*(gcode+1)+0),temp,&XYZ_Val);
                       #endif
                       break;
                    case 'F':case 'f':
                    case 'P':case 'p':
                    case 'S':case 's':
                       if(!F_1_Once){
                         F_1_Once = 1;
                         F_Val = atoi(temp);
                         status = Instruction_Values(gcode[1],&F_Val);
                       #if ProtoDebug == 1
                         PrintDebug(*(*(gcode+1)+0),temp,&F_Val);
                       #endif
                       }
                       break;
                 }
                }
                //get position b
               //G00/G01 X12.5 Y14.7 F0.2;
               //G02/G03 X12.5 Y14.7 I1.0 J2.0 F0.2;
                if(*(*(gcode+2)+0) != 0){
                   no_of_axis++;
                   i = cpy_val_from_str(temp,(*(gcode+2)),1,strlen(*(gcode+2)));
                   switch(*(*(gcode+2))) {
                      case 'Y':case 'y':
                      case 'Z':case 'z':
                      case 'A':case 'a':
                         XYZ_Val = atof(temp);
                         status = Instruction_Values(gcode[2],&XYZ_Val);
                         #if ProtoDebug == 1
                           PrintDebug(*gcode[2],temp,&XYZ_Val);
                         #endif
                         break;
                      case 'F':case 'f':
                      case 'P':case 'p':  //other as msec in dwell
                      case 'S':case 's':  //other as in sec in dwell
                         if(!F_1_Once){
                           F_1_Once = 1;
                           F_Val = atoi(temp);
                           status = Instruction_Values(gcode[2],&F_Val);
                         #if ProtoDebug == 1
                           PrintDebug(*gcode[2],temp,&F_Val);
                         #endif
                         }
                         break;

                   }
                }
                  //get  pos c value
                  //G02/G03 = R2.0 /  I1.0 / F0.2;
                if(*(*(gcode+3)+0) != 0){
                  no_of_axis++;
                  i = cpy_val_from_str(temp,(*(gcode+3)),1,strlen(*(gcode+3)));
                   switch(*(*(gcode+3))) {
                      case 'R':case 'r':
                      case 'I':case 'i':
                         XYZ_Val = atof(temp);
                         status = Instruction_Values(gcode[3],&XYZ_Val);
                         #if ProtoDebug == 1
                           PrintDebug(*gcode[3],temp,&XYZ_Val);
                         #endif
                         break;
                      case 'F':
                      case 'f':
                         if(!F_1_Once){
                           F_1_Once = 1;
                           F_Val = atoi(temp);
                           status = Instruction_Values(gcode[3],&F_Val);
                         #if ProtoDebug == 1
                           PrintDebug(*gcode[3],temp,&F_Val);
                         #endif
                         }
                         break;

                   }
                }

                  //get  pos c value
                  //G02/G03 = J1.0 / F0.2;
                if(*(*(gcode+4)+0) != 0){
                  i = cpy_val_from_str(temp,(*(gcode+4)),1,strlen(*(gcode+4)));
                   switch(*(*(gcode+4))) {
                      case 'J':case 'j':
                         XYZ_Val = atof(temp);
                         status = Instruction_Values(gcode[4],&XYZ_Val);
                         #if ProtoDebug == 1
                           PrintDebug(*gcode[4],temp,&XYZ_Val);
                         #endif
                         break;
                      case 'F':
                      case 'f':
                         if(!F_1_Once){
                           F_1_Once = 1;
                           F_Val = atoi(temp);
                           status = Instruction_Values(gcode[4],&F_Val);
                         #if ProtoDebug == 1
                           PrintDebug(*gcode[4],temp,&F_Val);
                         #endif
                         }
                         break;

                   }
                }
                  //get  pos c value
                  //G02/G03 = J1.0 / F0.2;
                if(*(*(gcode+5)+0) != 0){
                  xyz[4] = *(*(gcode+5)+0);no_of_axis++;
                  i = cpy_val_from_str(temp,(*(gcode+5)),1,strlen(*(gcode+5)));
                   switch(*(*(gcode+5))) {
                      case 'J':case 'j':
                         XYZ_Val = atof(temp);
                         Instruction_Values(gcode[5],&XYZ_Val);
                         #if ProtoDebug == 1
                           PrintDebug(*gcode[5],temp,&XYZ_Val);
                         #endif
                         break;
                      case 'F':
                      case 'f':
                        if(!F_1_Once){
                         F_1_Once = 1;
                         F_Val = atoi(temp);
                         status = Instruction_Values(gcode[5],&F_Val);
                         #if ProtoDebug == 1
                           PrintDebug(*gcode[5],temp,&F_Val);
                         #endif
                        }
                         break;

                   }
                }
                  //get  pos c value
                  //G02/G03 = J1.0 / F0.2;
                if(*(*(gcode+6)+0) != 0){
                  i = cpy_val_from_str(temp,(*(gcode+6)),1,strlen(*(gcode+6)));
                   switch(*(*(gcode+6))) {
                      case 'J':case 'j':
                         XYZ_Val = atof(temp);
                         status = Instruction_Values(gcode[6],&XYZ_Val);
                         #if ProtoDebug == 1
                           PrintDebug(gcode[6],temp,&XYZ_Val);
                         #endif
                         break;
                      case 'F':
                      case 'f':
                         if(!F_1_Once){
                           F_1_Once = 1;
                           F_Val = atoi(temp);
                           status = Instruction_Values(gcode[6],&F_Val);
                         #if ProtoDebug == 1
                           PrintDebug(gcode[6],temp,&F_Val);
                         #endif
                         }
                         break;

                   }
                }
              }else {
                return;
              }
              break;
         case 'M':
         case 'm':
              //get m instruction
                 i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
                 M_Val = atoi(temp);
                 M_Instruction(M_Val);     //debugging instructions
                 #if ProtoDebug == 1
                  PrintDebug(gcode[0],temp,&M_Val);
                 #endif

                //get position a
                if((*(gcode+1)) != 0){
                     switch(*(*(gcode+1))){
                       case 'S':
                       case 's':
                       //add more cases when needing more instructions
                           i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
                           XYZ_Val = atoi(temp);
                           status = Instruction_Values(gcode[0],&XYZ_Val);
                           #if ProtoDebug == 1
                             PrintDebug(gcode[0],temp,&XYZ_Val);
                           #endif
                           break;
                     }
                }
              break;
         case 'X':case 'x':case 'Y':case 'y':
         case 'Z':case 'z':case 'A':case 'a':
              if(*(*(gcode)+0)=='X'){
                   i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
                   XYZ_Val = atof(temp);
                   status = Instruction_Values(gcode[0],&XYZ_Val);
                   #if ProtoDebug == 1
                      PrintDebug(gcode[0],temp,&XYZ_Val);
                   #endif
              }
                              //get position b
               //G00/G01 X12.5 Y14.7 F0.2;
               //G02/G03 X12.5 Y14.7 I1.0 J2.0 F0.2;
              if(*(*(gcode+1)+0) != 0){
                   xyz[1] = *(*(gcode+1)+0);no_of_axis++;
                   i = cpy_val_from_str(temp,(*(gcode+1)),1,strlen(*(gcode+1)));
                   switch(*(*(gcode+1))) {
                      case 'Y':case 'y':
                      case 'Z':case 'z':
                      case 'A':case 'a':
                         XYZ_Val = atof(temp);
                         status = Instruction_Values(gcode[1],&XYZ_Val);
                         #if ProtoDebug == 1
                           PrintDebug(gcode[1],temp,&XYZ_Val);
                         #endif
                         break;
                      case 'F':
                      case 'f':
                         if(!F_1_Once){
                           F_1_Once = 1;
                           F_Val = atoi(temp);
                           status = Instruction_Values(gcode[2],&F_Val);
                         #if ProtoDebug == 1
                           PrintDebug(gcode[1],temp,&F_Val);
                         #endif
                         }
                         break;

                   }
               }
              break;
           case 'F':
             //get g instruction
               if (*(*(gcode)+0)=='F'){
                 i = cpy_val_from_str(temp,(*(gcode+0)),1,strlen(*(gcode+0)));
                 F_Val = atoi(temp);
                 status = Instruction_Values(gcode[0],&F_Val);
                 #if ProtoDebug == 1
                    PrintDebug(gcode[6],temp,&F_Val);
                 #endif
               }
              break;

       }
       status = Check_group_multiple_violations();
      // if(!status)
      //  status =  Motion_mode();
    }
    return status;
}


///////////////////////////////////////////////////////
// Split the string according to the char
static int strsplit(char arg[arr_size][str_size],char *str, char c){
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

/////////////////////////////////////////////////////
//seperate the char and numerals from the string
static int cpy_val_from_str(char *strA,const char *strB,int indx,int num_of_char){
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
static int str2int(char *str,int base){
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
static void PrintDebug(char c,char *strB,void *ptr){
int G_Val;
float XYZ_Val;

      switch(c){
         case 'G':case 'g':
         case 'F':case 'f':
         case 'M':case 'm':
         case 'S':case 's':
         case 'P':case 'p':
              G_Val = *(int*)ptr;
              while(DMA_Busy(1));
              dma_printf("%c\t%s\t%d\n",c,strB,G_Val);
              break;
         case 'X':case 'x':
         case 'Y':case 'y':
         case 'Z':case 'z':
         case 'A':case 'a':
              XYZ_Val = *(float*)ptr;
              while(DMA_Busy(1));
              dma_printf("%c\t%s\t%f\n",c,strB,XYZ_Val);
              break;
         default:break;
      }
  return;
}

#elif ProtoDebug == 2
static void PrintStatus(int state){
  while(DMA_Busy(1));
  dma_printf("status:= %d\n",state);
}
#endif