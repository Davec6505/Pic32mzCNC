#include "Globals.h"

//coordinates struct - easier to work when extracted from flash
//holds coord[] and coord_offset[]
volatile coord_sys coord_system[NUMBER_OF_DATUMS];

//temp buffer to save flash settings to
unsigned long volatile buffA[512]= {0} absolute 0xA0000000 ;


void Settings_Init(short reset_all){
 if(!reset_all){
    //defaults for statuses
     sys.abort           = 0;
     sys.state           = 0;
     sys.homing          = 0;
     sys.execute         = 0;
     sys.auto_start      = 0;
 }else if(reset_all == 1){
  //defaults for settings
  settings.steps_per_mm[X] = DEFAULT_X_STEPS_PER_MM;
  settings.steps_per_mm[Y] = DEFAULT_Y_STEPS_PER_MM;
  settings.steps_per_mm[Z] = DEFAULT_Z_STEPS_PER_MM;
  settings.steps_per_mm[A]    = DEFAULT_A_STEPS_PER_MM;
  settings.mm_per_arc_segment = DEFAULT_MM_PER_ARC_SEGMENT;
  settings.default_feed_rate  = DEFAULT_FEEDRATE;
  settings.default_seek_rate  = DEFAULT_RAPID_FEEDRATE;
  settings.acceleration       = DEFAULT_ACCELERATION;
  settings.junction_deviation = DEFAULT_JUNCTION_DEVIATION;
  settings.homing_feed_rate   = DEFAULT_HOMING_FEEDRATE;
  settings.homing_seek_rate   = DEFAULT_HOMING_RAPID_FEEDRATE ;
  settings.homing_debounce_delay = DEFAULT_HOMING_DEBOUNCE_DELAY;
  settings.homing_pulloff     = DEFAULT_HOMING_PULLOFF;
  settings.stepper_idle_lock_time = DEFAULT_STEPPER_IDLE_LOCK_TIME; // If max value 255, steppers do not disable.
  settings.decimal_places = DEFAULT_DECIMAL_PLACES;
  settings.n_arc_correction = DEFAULT_N_ARC_CORRECTION;

 }
}

////////////////////////////////////////////////////////////////////
//    G54, G55, G56, G57, G58 and G59 are datum shift G-Codes     //
////////////////////////////////////////////////////////////////////
/*** Table 1. Coordinate System  *********
P      Value        Coordinate System        G code
0      Active     n/a
1      1          G54
2      2          G55
3      3          G56
4      4          G57
5      5          G58
6      6          G59
7      7          G59.1
8      8          G59.2
9      9          G59.3
*****************************************/
/*************************G Recipes **********************************
 *Gnnn:= The X and Y values represent the distance from the machine home
 *to part datum XY. The Z value is the distance from the tool reference 
 *point (for example, the top of a 1-2-3 block) and the part Z-datum
 *Gnnn holds the datum’s distance in relations with the tip of the tool.
 *These work offsets are registered into the machine to hold the distance 
 *from the X, Y, Z position to part of the datum.
*******************************************************************/
///////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////
//Save current page to a temp buffAer, this is to
//push original setting back after a page errase
int Save_Row_From_Flash(unsigned long addr){
unsigned long i,j,data_count;
unsigned long *ptr;
 ptr = addr;
 data_count = 0;
 for(j = 0;j < 512;j++){
    buffA[j] = *(ptr+j);
    if(buffA[j] != -1)data_count++;
    #if FlashDebug == 1
     while(DMA_IsOn(1));
     dma_printf("buffA[%l]:= %l\n",j,buffA[j]);
    #endif
 }
 //return the number of indices that hold data
 return data_count;
}

///////////////////////////////////////////////////////////////////
//here we want to write the new recipe to flash and set the coordinate
unsigned int Settings_Write_Coord_Data(int coord_select,float *coord){
float ptr;
unsigned int error = 0;
int res=0,recipe = 0;
unsigned long wdata[4]={0};
unsigned long j,i;
unsigned long add;
unsigned long temp[4] = {0};

 add = (unsigned long)FLASH_Settings_VAddr_P1;

//save the coordinate P value
 recipe = coord_select;

//Read the saved Row from flash first
 Save_Row_From_Flash(add);

//Erase the page in order to over write the values
// add = (unsigned long)FLASH_Settings_VAddr_P1;
 error = (int)NVMErasePage(add);

 if(error){
   #if FlashDebug == 1
     while(DMA_IsOn(1));
     dma_printf("error:= %d\n",error);
   #endif
   return error;
 }

 switch(recipe){
   case 0:break;
   //P1,2,3,4,5,6,7,8,9
   case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
   case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
   case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
   case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
   case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
   case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
   case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
   case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
   case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
   //G54,55,56,57,58,59
   case 10: add = (unsigned long)FLASH_Settings_VAddr_G54;break;
   case 11: add = (unsigned long)FLASH_Settings_VAddr_G55;break;
   case 12: add = (unsigned long)FLASH_Settings_VAddr_G56;break;
   case 13: add = (unsigned long)FLASH_Settings_VAddr_G57;break;
   case 14: add = (unsigned long)FLASH_Settings_VAddr_G58;break;
   case 15: add = (unsigned long)FLASH_Settings_VAddr_G59;break;
 }

 j = i = 0;
 for (i=0;i<3;i++){
   wdata[i] = flt2ulong(coord[i]);
   #if FlashDebug == 1
    while(DMA_IsOn(1));
    dma_printf("%f\t%l\n",coord[i],wdata[i]);
   #endif
    //in order to write single word change the addresses from0x10 incraments
    //to 0x4 incraments
    //res = NVMWriteWord(add+i*4,wdata[i]);
 }
 
 i = (recipe-1)*4 ; //place the new data into the correct position
  //put the new data into the relevant slot e.g. P1,2,3,4...
 for(j = 0;j<4;j++){
   buffA[i] =  wdata[j];
   i++;
 }
  
  //Write 4 double words at once
  //res = NVMWriteQuad(&add,wdata);
 // add = (unsigned long)FLASH_Settings_VAddr_P1;
  res = NVMWriteRow(&add,buffA);

  #if FlashDebug == 5
    add = (unsigned long)FLASH_Settings_VAddr_P1;
    //used todebug by printing out row to serial am going
    //to optomise this
    NVMReadQuad(add,temp);
    for(i = 0;i< 4;i++){
      if(temp[i] < 0xFFFFFFFF)  //print conversion??
        ptr = ulong2flt(temp[i]);
      else ptr = 0.00;
       while(DMA_IsOn(1));
       dma_printf("val:= %f\tbuff[%l]:= %l\n",ptr,i,temp[i]);
    }
  #endif

   return res;
}

//////////////////////////////////////////////////////
//read back the coordinate data and place into coord
//struct for processing, coordinate system is 36longs
//indexed by number of axis
void settings_read_coord_data(){
float ptr;
unsigned int error = 0;
unsigned long j,i,res;
unsigned long temp;
  //read from the buffer and place into coordinate system
  for(i = 0; i < 9; i++){
    for(j = 0 ; j < NoOfAxis; j++){
      temp = buffA[(i*NoOfAxis) + j];
      ptr = ulong2flt(temp);
      coord_system[i].coord[j] = ptr;
      
      #if FlashDebug == 2
       while(DMA_IsOn(1));
       dma_printf("cord[%l].[%l]:= %f\n"
       ,i,j,coord_system[i].coord[j]);
       //coord_system[(coord_select*NoOfAxis)].coord[i]);
      #endif
    }
  }
}

/////////////////////////////////////////////////////////
//write 1 coordinate to flash QUAD_WORD
//1st update buffA incase of row write then write to flash
unsigned int settings_write_one_coord(int coord_select,float *coord){
float coord_data[NoOfAxis];
int recipe;
unsigned int error = 0;
unsigned long j,i,add;
unsigned long temp[NoOfAxis];

 //calculate the index of the Pnnn section of the buffA[]
 recipe = coord_select * NoOfAxis;
 
 //individually update buffA[] which is ulong in preperation for flash
  j=0;
  for(i = recipe;i< recipe+NoOfAxis;i++){
     //prepare this to pass to quad word write
      coord_data[j] = *(coord+j);
      temp[j] = flt2ulong(coord_data[j]);
      buffA[i] = temp[j];
      j++;
      #if FlashDebug == 2
       while(DMA_IsOn(1));
       dma_printf("buffA[%l]:= %l\n",i,j,buffA[i]);//coord_system[(coord_select*NoOfAxis)].coord[i]);
      #endif
  }
  
 switch(coord_select){
   //P1,2,3,4,5,6,7,8,9 [4 dbl wrd boundries]
   case 1: add = (unsigned long)FLASH_Settings_VAddr_P1;break;
   case 2: add = (unsigned long)FLASH_Settings_VAddr_P2;break;
   case 3: add = (unsigned long)FLASH_Settings_VAddr_P3;break;
   case 4: add = (unsigned long)FLASH_Settings_VAddr_P4;break;
   case 5: add = (unsigned long)FLASH_Settings_VAddr_P5;break;
   case 6: add = (unsigned long)FLASH_Settings_VAddr_P6;break;
   case 7: add = (unsigned long)FLASH_Settings_VAddr_P7;break;
   case 8: add = (unsigned long)FLASH_Settings_VAddr_P8;break;
   case 9: add = (unsigned long)FLASH_Settings_VAddr_P9;break;
   //G54,55,56,57,58,59
   case 10: add = (unsigned long)FLASH_Settings_VAddr_G54;break;
   case 11: add = (unsigned long)FLASH_Settings_VAddr_G55;break;
   case 12: add = (unsigned long)FLASH_Settings_VAddr_G56;break;
   case 13: add = (unsigned long)FLASH_Settings_VAddr_G57;break;
   case 14: add = (unsigned long)FLASH_Settings_VAddr_G58;break;
   case 15: add = (unsigned long)FLASH_Settings_VAddr_G59;break;
 }
 //write the coord to flash as a quad word, if more axis are added
 //may need to add 2 quad word writes or wait for row write???
 error =  NVMWriteQuad (add, temp);

 return error;
}


//////////////////////////////////////////////////////
// Reads startup line from EEPROM. Updated pointed line string data.
int settings_read_startup_line(int n, char *line){
unsigned long line1[16],offset,add,add_offset;
char *char_add;
char str[] = "Hello";
unsigned long len0,len1,i,j,mod_;
char temp_char,addc;
  //Row bundry starting at 0xBD1BC400
 // ptr = (unsigned long)FLASH_Settings_VAddr_Page3;
 
 switch(n){
  case 0: char_add = (char*)FLASH_Settings_VAddr_Row2;break;
  case 1: char_add = (char*)FLASH_Settings_VAddr_Row3;break;
 }

  memcpy(line,char_add,64);

 //read the 3rd Row which holds the startup lines, using this row
 //potentially means we canstore up to 8 startup lines
 
 //  Save_Row_From_Flash(add);
   // char c = 0;
 /*  for(i = 0; i < offset*2; i++){
    line1[i] =  buffA[i+add_offset];
    for(j = 3; j >= 0; j--){

    } */
     #if GlobalsDebug == 10
     while(DMA_IsOn(1));
     dma_printf("%s\n",line);
     #endif
  // }
     return STATUS_OK;
}

// Method to store startup lines into EEPROM
int settings_store_startup_line(int n, char *line){
unsigned long line1[16] = {0};
unsigned long start_offset,offset,addA;
unsigned long len0,len1,i,j;
int error,str_len;
char temp_char;
  str_len = strlen(line);
 #if FlashDebug == 1
   while(DMA_IsOn(1));
   dma_printf("*line:= %s\n",line);
 #endif
 addA    = (unsigned long)FLASH_Settings_VAddr_P1;
 start_offset = (unsigned long)FLASH_Startup_Line_Offset;
 offset  = (unsigned long)n;
 offset  *= LINE_BUFFER_SIZE_WORDS;
 
 //read the 3rd Row which holds the startup lines, using this row
 //potentially means we canstore up to 8 startup lines
 //Read the saved Row from flash first
 Save_Row_From_Flash(addA);

//Erase the page in order to over write the values
// add = (unsigned long)FLASH_Settings_VAddr_P1;
 error = (int)NVMErasePage(addA);

 if(error){
   #if FlashDebug == 1
     while(DMA_IsOn(1));
     dma_printf("error:= %d\n",error);
   #endif
   return error;
 }
 
 //string length for eff conversion
 len0 = LINE_BUFFER_SIZE ;
 len1 = LINE_BUFFER_SIZE_WORDS;
 
 #if GlobalsDebug == 10
 while(DMA_IsOn(1));
 dma_printf("offset:= %l\n",offset);
 #endif

 for(i = 0;i < len1;i++){
 //extract 4 bytes from str and insert into line1
  for(j = 0;j < 16;j++){
     if((i*4)+j < str_len)
         temp_char = (line[(i*4)+j]);
     else
        temp_char = 0;
        
     line1[i] |= temp_char;
     if(j < 3)
         line1[i] = line1[i] << 8;
     #if GlobalsDebug == 1
     while(DMA_IsOn(1));
     dma_printf("%c\n",temp_char);
     #endif
     if(line[(i*4)+j]==0)break;
   }
   buffA[i+start_offset+offset] = line1[i];
 }
 
 //put line1 back into buffC
// memcpy(buffA+0x180,line1,len1);

 for(i = 0; i < offset + len1;i++){
  #if GlobalsDebug == 10
  while(DMA_IsOn(1));
  dma_printf("buffA[%l]:= %l\n",i+start_offset,buffA[i+start_offset]);
  #endif
 }
 //write buffC back to Row3
 error = (int)NVMWriteRow(&addA,buffA);
 #if GlobalsDebug == 10
 while(DMA_IsOn(1));
 dma_printf("error:= %d\n",error);
 #endif
}