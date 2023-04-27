/*******************************************************************************
* This firmware is free software: you can redistribute it and/or modify
*  it under the terms of the GNU General Public License as published by
*  the Free Software Foundation, either version 3 of the License, or
*  (at your option) any later version.
*
* This is a stepper interpolator / gcode interp interpreter, which is based on
* multiple documents 1st is ACC DEC  ac:AVR_Stepper_Acc_Dec to impliment the
* motion, the interpolation is based on Bresenhams algo and the Circular is at
* present using ac:grbl implimentation "thank you for this @K. Jeon & 
* @Simen Svale Skogsrud.
* The micro used is a pic32mz2048efh  ac:pic32mz , the 6 axis motion uses 6 of
* the Output compare modules  ac:OUTPUT_COMPARE and no "for or while" loops
* blocking during interpolation.
*
*for limits the external interrupts  [ ac:Interrupts ] for origins x y z &
* a b c* will most likely get polled without interrupts??
*
* Communication is Serial using the  ac:DMA_Pic32 DMA0 and DMA1 and is setup to
* transfer and recieve to two seperate buffers.
*
* The development platform used for this application is MikroC Pro for pic32
* using the Clicker2 for mz ac:Clicker2_Dwg :  ac:Clicker2_Pinouts , however
* code can easily be modified for any C compiler Ide.
* The intention is to move this on the the new Necto Studio which is now open
* source.
*
* Using Flash memory to store data instead of Eprom  ac:Flash_Prgm &  ac:Flasg_gen
*******************************************************************************/

#include "Config.h"


//////////////////////////////////////////
//external scope variables
_axis_ _axis;
axis_combination axis_xyz;
settings_t settings absolute 0xA0002800 ;
parser_state_t gc   absolute 0xA0002900;
STP STPS[NoOfAxis]  absolute 0xA0003100;
system_t sys        absolute 0xA0003500;
coord_sys coord_system[NUMBER_OF_DATUMS] absolute 0xA0003600;
//////////////////////////////////////////
//DMA specific global decleration
unsigned long rowbuff[128]={0};

//edge detection for rising edge of axis
static volatile int old_state;

//////////////////////////////////////////
//file scope vars
static unsigned int disable_steps;//stepper timeout
static int axis_to_home = 0;
static int send_status_once = 0;
/////////////////////////////////////////
//condition externs
void Conditin_Externs(){
  PinMode();
  plan_init(5000.0,5000.0);//settings.acceleration,settings.acceleration);
  Init_Protocol();
  G_Initialise();
  disableOCx();
  DisableStepper();
  //stepper timeout counter
  disable_steps = 0;
}
/////////////////////////////////////////
//main function

void main() {
int error = 0;
int has_flash = 0;
int modal_group = 0;
int modal_action = 0;
int dif,status_of_gcode;
static int cntr = 0,a = 0;

 //setup
 Conditin_Externs();
 //pre condition
 cntr = a =  dif = status_of_gcode = modal_group = modal_action = 0;
 
 while(1){

   //continously test the limits
   Debounce_Limits(X);
   Debounce_Limits(Y);
   Debounce_Limits(Z);
   
   
   //continously check the communication channel
   //if STATUS_OK because some modal functions here keep their value for 
   //-> functionality like homing, therefor we continously need to pol
   //-> homing "this is  non-blocking of motion"
   //r STATUS_COMMAND_EXECUTE_MOTION
   if(status_of_gcode == STATUS_COMMAND_EXECUTE_MOTION ||
      status_of_gcode == STATUS_OK){
    int axis_to_run = 0;
    //get the modal_group
     modal_group = Get_modalgroup();
     #if MainDebug == 10
     while(DMA_IsOn(1));
     dma_printf("modal_group:= %d\n",modal_group);
     #endif
     //could impliment a minimal state m/c for modal group control rather
     //than this switch statement
     switch(modal_group){
        case 0:break;
        case 2://MODAL_GROUP_0: // [G4,G10,G28,G30,G53,G92,G92.1] Non-modal
             modal_action = Modal_Group_Actions0(Get_non_modalword());
             modal_action = modal_group = Rst_modalgroup();
             report_status_message(STATUS_OK);
             break;
        case 4://MODAL_GROUP_1: // [G0,G1,G2,G3,G80] Motion
            axis_to_run = Get_Axisword();

            if(axis_to_run){
                //Execute this once only, once the axis are started the
                //OCx interrupts take control of the axis
                EnableSteppers(ALL_AXIS);
                Modal_Group_Actions1(axis_to_run);
                axis_to_run = Rst_Axisword();
                modal_group = Rst_modalgroup();
             }else{
               int report = GET_FAIL();
                if(!report){
                   report_status_message(STATUS_OK);
                   SET_FAIL(STATUS_NO_REPORT);
                }
             }
             break;
        case 8: // [G17,G18,G19] Plane selection [report status set in GCODE]
        case 16:// [G90,G91] Distance mode  [not conditioned here]
             report_status_message(GET_FAIL());
             modal_group = Rst_modalgroup();
             break;
        case 32://MODAL_GROUP_4 [M0,M1,M2,M30] Stopping
             Modal_Group_Actions4(1);//implimentation needed
             modal_group = Rst_modalgroup();
             break;
        case 64:// [G93,G94] Feed rate mode [not conditioned here]
        case 128:// [G20,G21] Units [not conditioned here]
             report_status_message(GET_FAIL());
             modal_group = Rst_modalgroup();
             break;
        case 256://MODAL_GROUP_7 [M3,M4,M5] Spindle turning
             Modal_Group_Actions7(1);//implimentation needed
             modal_group = Rst_modalgroup();
             break;
        case 512:// [G54,G55,G56,G57,G58,G59] Coordinate system selection
             Modal_Group_Actions12(gc.coord_select);//implimentation needed
             modal_group = Rst_modalgroup();
             break;
        case 1024: //$H Home all axis
             //temp debug for steppers
             modal_action = Modal_Group_Actions1(ALL_AXIS);
             #if HomeDebug == 10
             while(DMA_IsOn(1));
             dma_printf("modal_action:= %d\n",modal_action);
            #endif
             if(modal_action == 0)modal_group = Rst_modalgroup();
 //            bit_true(SV.mode_complete,bit(7));
             break;
     }
   }
   
//Debug for stepper report if not connected to unit
#if StepperDebug == 1
if(SV.mode_complete){
if(STPS[X].run_state != STOP | STPS[Y].run_state != STOP | STPS[Z].run_state != STOP){
while(DMA_IsOn(1));
dma_printf("\
%l\t%l\t%l\t%l\t%l\t%l\t%l\t%l\t%l\t%d\n"
,STPS[X].step_count
,STPS[X].accel_count
,STPS[X].step_delay
,STPS[Y].step_count
,STPS[Y].accel_count
,STPS[Y].step_delay
,STPS[Z].step_count
,STPS[Z].accel_count
,STPS[Z].step_delay
,(SV.mode_complete&0x00FF));
}
}
#endif
#if StepperDebug == 2
if(SV.mode_complete){
if(STPS[X].run_state != STOP | STPS[Y].run_state != STOP | STPS[Z].run_state != STOP){
while(DMA_IsOn(1));
dma_printf("\
Get_Axis_IEnable_States():= %d\t\
SV.mode_complete:= %d\n"
,Get_Axis_IEnable_States()
,SV.mode_complete
,STPS[X].step_count
,STPS[Y].step_count
,STPS[Z].step_count);
}
}
#endif
  //state check for resets
  protocol_system_check();
   
  //run at end of every scan
  protocol_execute_runtime();
  
  //sanity check incase SV.mode_complete is not resetin the correct places
  // if(!Get_Axis_IEnable_States()){SV.mode_complete = 0;}
  old_state = SV.mode_complete;
  //respond ok if movement is finished
  if((old_state > 0) && (SV.mode_complete == 0)){// && (!SV.homed)){
     old_state = 1;
     LED2 = false;
     //debug STATUS_OK response after moves complete
     status_of_gcode == STATUS_OK;
     report_status_message(status_of_gcode);
     
    #if MainDebug == 13
    while(DMA_IsOn(1));
    dma_printf("old_state:= %d\tSV.mode_complete:= %d\tstepX:= %l\tstepY:= %l\tstepZ= %l\n"
    ,old_state ,SV.mode_complete,STPS[X].step_count
    ,STPS[Y].step_count,STPS[Z].step_count);
    #endif
  }

  //check ring buffer for data transfer
  status_of_gcode = Sample_Gocde_Line();
  //status_of_gcode = Sample_Ringbuffer();

  //code execution confirmation led on clicker2 board
  #ifdef LED_STATUS
  LED1 = TMR.clock >> 4;
  #endif
    
  //disable the steppers after a long idle state, switch off in "Settings.h"
  #ifdef RESET_STEPPER_TIME
  if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
      disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
  #endif

   //on system failure reset the device
   WDTCONSET = 0x01;
 }
}


////////////////////////////////////////////////////////////////////////////////
//         GROUP_0  NON MODAL ACTIONS [G4,G10,G28,G30,G53,G92,G92.1]          //
////////////////////////////////////////////////////////////////////////////////
static int Modal_Group_Actions0(int action){
//[b0=10ms | b1=100ms | b2 = 300ms | b4=500ms | b5 = 1sec]
int dly_time,i,j,result,axis_words,indx,temp_axis,axis_cnt,temp;
unsigned int home_select = 0;
unsigned long _data;
unsigned long _flash,*addr;
float coord_data[NoOfAxis];
float a_val;

//actions below are focused on the bit positions hence the
//numbering system grows 2^n

   switch(action){
     case 2:  //NON_MODAL_DWELL
           i = 0;
           //G04 [P/S] PAUSE MACHINE INSTRUCTION
           if(gc.S > 0){ //wait in seconds
             dly_time = gc.S * 1000;
             while(i < dly_time){
              LED2 = TMR.clock >> 1;
              Delay_ms(1);
              i++;
             }
           }else if(gc.P > 0){ //wait in msec
             dly_time = (unsigned long)gc.P;
             while(i < dly_time){
              LED2 = TMR.clock >> 1;
              Delay_ms(1);
              i++;
             }
           }
          // SV.mode_complete = 1;
           LED2 = false;
          break;
     case 4:  //NON_MODAL_SET_COORDINATE_DATA
          /******************************************************************
           *! L1 sets the offsets of the specified tool relative to the head
           *  reference point to the specified values.
           *! L2 sets the current workplace coordinate offsets to the specified
           *  values.
           *! L20 adjusts the current workplace coordinate offsets so
           *  that the current tool head position has the specified coordinates.
           ******************************************************************/
          //G10 setting of offsets
          //[G10 L1 P2 X17.8 Y-19.3 Z0.0]
          //[G10 P1 R140 S205]
          //P index is EEPROM coordinate data indexing / recipe.
          if(gc.L != 2 && gc.L != 20)
             return -1;
          if (gc.L == 20) {
              //write the Pnn coordinates to flash recipe for active system
              result = settings_write_coord_data((int)gc.P,gc.next_position );
              
              if(result){ //response if write to flash failed new result
                return NVM_COORDINATE_WRITE_ERROR;
              }
              
              // Update system coordinate system if currently active with G54 - G59
              if (gc.coord_select > 0) {
                 memcpy(gc.coord_system,gc.next_position,sizeof(gc.next_position));
              }
              
          } else {
            //Retrieve the data from flash into buff in case its been updated
            //if(!Save_Row_From_Flash(FLASH_Settings_VAddr_P1))return;

            //use P to get to the start of the rescipe P1,2,3... in the buff
            //array in Globals.c which is indexed by 4 for now a axis x,y,z,a
            temp = indx = (gc.P-1) & 0xFF;
            indx *= 4;
            axis_cnt = 0;
            
           // Update axes defined only in block. Always in machine coordinates.
           //Can change non-active system.
             axis_words = Get_Axisword();
             for(i = 0; i < 3;i++){
                temp_axis = (axis_words >> i) & 1;
                //find missing axis
                if(temp_axis == 0){
                   axis_cnt++;
                   if(axis_cnt > 2)break;
                   //using buff to find index
                   _flash = buffA[indx];
                   //???still need to undestand this update instruction, does
                   //it update current coordinate in which case use gc.coord_data[]
                   //as this is the current machine units
                   coord_data[i] = ulong2flt(_flash);

                #if MainDebug == 1
                 while(DMA_IsOn(1));
                 dma_printf("temp_axis:= %d\tcoord_data[%d]:=%f\tindx:= %d\n",
                             temp_axis,i,coord_data[i],indx);
                #endif

                }else{
                
                 //???? should be gc.coord_data
                  coord_data[i] = gc.next_position[i];
                  
                  #if MainDebug == 1
                   while(DMA_IsOn(1));
                   dma_printf("gc.next_position[%d]:= %f\n"
                               ,i,gc.next_position[i]);
                  #endif
                
                }
                indx++;
             }

            result = settings_write_coord_data((int)gc.P,coord_data);

          // Update current coordinate system if currently active.
            memcpy(gc.coord_system,coord_data,sizeof(coord_data));
          }

          break;
     case  8:  //NON_MODAL_GO_HOME_0_BIT
     case 32:  //NON_MODAL_GO_HOME_1_BIT
          // Move to intermediate position before going home. 
          //Obeys current coordinate system and offsets and absolute and incremental modes.
          axis_words = Get_Axisword();
          
          #if MainDebug == 1
           while(DMA_IsOn(1));
           dma_printf("axis_words:= %d\n",axis_words);
          #endif
          
          //We need to ensure that coordinates have been read prior to this
          //being implimented
          if (axis_words) {
            // Apply absolute mode coordinate offsets or incremental mode offsets.
            for (i=0; i<NoOfAxis; i++){ 
              // Axes indices are consistent, so loop may be used.
              if ( bit_istrue(axis_words,bit(i)) ) {
                if (gc.absolute_mode) {
                  gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i];
                } else {
                  gc.next_position[i] += gc.position[i];
                }
              } else {
                gc.next_position[i] = gc.position[i];
              }
              
              //move each axis to the intermediate position prior to homing
              //this is in the loop to ensure that Z then X then Y to avoid
              //tool smashing into work piece
              SingleAxisStep(gc.next_position[i],settings.default_seek_rate,i);
              while(GET_RunState(i));
            }
          }
          // Retreive G28/30 go-home position data (in machine coordinates) from FLASH
          temp = SETTING_INDEX_G28;  //home to zero pos / at limits
          //home to 1st index P1
          if (action == NON_MODAL_GO_HOME_1_BIT){temp = SETTING_INDEX_G30;}
          i = (temp)*4 ; //place the new data into the correct position
          //put the new data into the relevant slot e.g. P1,2,3,4...
          //and run to these coordinates
          for(j = 0;j<4;j++){
               _data = buffA[i];
               coord_system[temp].coord[j] = ulong2flt(_data);
               #if MainDebug == 1
               while(DMA_IsOn(1));
               dma_printf("coord[%d]:= %f\n",j,_data);
               #endif
               i++;
               //this will take the axis Home without bounce may still need to
               //impliment plan ahead
               SingleAxisStep(coord_system[temp].coord[j],settings.default_seek_rate,j);
               while(GET_RunState(j));
          }
          axis_words = 0; // Axis words used. Lock out from motion modes by clearing flags.
          break;
     case 16:
           //Store G28 and G30 1st move prior to going Home positions
           home_select = SETTING_INDEX_G28;
          if (action == NON_MODAL_SET_HOME_1) { home_select = SETTING_INDEX_G30; }
          settings_write_coord_data(home_select,gc.position);
          break;
     case 53:
           axis_words = Get_Axisword();
          // Convert all target position data to machine coordinates for executing motion. Apply
          // absolute mode coordinate offsets or incremental mode offsets.
          // NOTE: Tool offsets may be appended to these conversions when/if this feature is added.
          // Axes indices are consistent, so loop may be used to save flash space.
          for (i=0; i<=2; i++) {
            if ( bit_istrue(axis_words,bit(i)) ) {
             if (!gc.absolute_override) {
              if (!gc.absolute_mode) { // Do not update target in absolute override mode
                  gc.next_position[i] += gc.coord_system[i] + gc.coord_offset[i]; // Absolute mode
              } else {
                  gc.next_position[i] += gc.position[i]; // Incremental mode
              }
             } else {
              gc.next_position[i] = gc.position[i]; // No axis word in block. Keep same axis position.
             }
            }
          }
          break;
     case 64:   //NON_MODAL_SET_HOME_1
          temp = SETTING_INDEX_G28;
          if (action == NON_MODAL_SET_HOME_1_BIT) { temp = SETTING_INDEX_G30; }
          settings_write_coord_data(temp,gc.position);
          break;
     case 128:  //NON_MODAL_SET_COORDINATE_OFFSET NOT WRITTEN TO FLASH LOST ON RESET
          axis_words = Get_Axisword();
          
          if (!axis_words) { // No axis words
             FAIL(STATUS_INVALID_STATEMENT);
          } else {
          // Update axes defined only in block. Offsets current system to defined value. 
          //Does not update when active coordinate system is selected, but is still 
          //active unless G92.1 disables it.
           for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used.
            if (bit_istrue(axis_words,bit(i)) ) {
              gc.coord_offset[i] = gc.position[i]-gc.coord_system[i]-gc.next_position[i];
            }
           }
          }
          axis_words = 0; // Axis words used. Lock out from motion modes by clearing flags.
     case 256: //NON_MODAL_RESET_COORDINATE_OFFSET
          // Disable G92 offsets by zeroing offset vector.
          clear_vector(gc.coord_offset);
          break;
     default: action = -1; //error in action msg ???
          break;
   }
  return action;
}

////////////////////////////////////////////////////////////////////////////////
//               GROUP_1 MODAL ACTIONS [G0,G1,G2,G3,G80] MOTION               //
////////////////////////////////////////////////////////////////////////////////
static int Modal_Group_Actions1(int action){
    #if MainDebug == 10
    while(DMA_IsOn(1));
    dma_printf("action:= %d\tgc.frequency:= %l\n",action,gc.frequency);
    #endif
    switch(action){
      case 1: //b0000 0001
             SingleAxisStep(gc.next_position[X],gc.feed_rate,X);
             break;
      case 2://b0000 0010
             SingleAxisStep(gc.next_position[Y],gc.feed_rate,Y);
             break;
       case 3://b0000 0011
             DualAxisStep(gc.next_position[X], gc.next_position[Y],X,Y,gc.feed_rate);
             break;
      case 4://b0000 0100
            SingleAxisStep(gc.next_position[Z],gc.feed_rate,Z);
             break;
       case 5://b0000 0101
             DualAxisStep(gc.next_position[X], gc.next_position[Z],X,Z,gc.feed_rate);
             break;
       case 6://b0000 0110
             DualAxisStep(gc.next_position[Y], gc.next_position[Z],Y,Z,gc.feed_rate);
             break;
       case 8://b0000 1000
            SingleAxisStep(gc.next_position[A],gc.feed_rate,A);
             break;
       case 9://b0000 1001
            DualAxisStep(gc.next_position[X], gc.next_position[A],X,A,gc.feed_rate);
            break;
       case 10://b0000 1010
            DualAxisStep(gc.next_position[Y], gc.next_position[A],Y,A,gc.feed_rate);
            break;
       case 12://b0000 1100
            DualAxisStep(gc.next_position[Z], gc.next_position[A],Z,A,gc.feed_rate);
            break;
       case 15://Circle interpolation
            sys_sync_current_position();
            r_or_ijk(gc.position[X],gc.position[Y],gc.next_position[X],gc.next_position[Y],gc.R,gc.I,gc.J,gc.K,X,Y,gc.DIR);
            break;
       case ALL_AXIS://Homing X axis
            axis_to_home = Home(axis_to_home);
            LED2 = TMR.clock >> 3;
            #if HomeDebug == 10
            while(DMA_IsOn(1));
            dma_printf("axis_to_home:= %d\n",axis_to_home);
            #endif
            if(axis_to_home < 3){

              //will need to test for abort!!!
              if (sys.abort) {
                  action =(ALARM_ABORT_CYCLE);
              }
            }else{
              int l = 0;
              // Execute startup scripts after successful homing????.
              LED2 = false;
              mc_reset();
              action = 0;
              for(l=0;l<NoOfAxis;l++){
                 //may need to condition this further for coord system
                 //to Home to!!!!
                 STPS[l].steps_abs_position = 0;
                 sys.position[l] = STPS[l].steps_abs_position;
                 
                //force the axis into stop mode after homing
                if(STPS[l].run_state != STOP)
                    STPS[l].run_state = STOP;
              }

              //sync the homing position to zero
              sys_sync_current_position();
              
              //axis_to_home must be reset at end
              while(axis_to_home)
                  axis_to_home = Rst_Axisword();
              
              //return the number of axis completed
              sys.state = STATE_IDLE;
              SV.mode_complete = 0;
            }
            break;
        default: return action = 0;
              break;
    }

    return action;
}


////////////////////////////////////////////////////////////////////////////////
//               GROUP_3 MODAL ACTIONS  [G90,G91] DISTANCE MODE               //
////////////////////////////////////////////////////////////////////////////////
static int Modal_Group_Actions3(int action){
    //char is unsigned short in MikroC can be > 1 in faulty value
    if(gc.inches_mode > 1)
        FAIL(STATUS_SETTING_READ_FAIL);
   
   return action;
}

////////////////////////////////////////////////////////////////////////////////
//                GROUP_4 MODAL ACTIONS [M0,M1,M2,M30] STOPPING               //
////////////////////////////////////////////////////////////////////////////////
static int Modal_Group_Actions4(int action){
    #if MainDebug == 1
    while(DMA_IsOn(1));
    dma_printf("gc.program_flow:= %d\n",gc.program_flow);
    #endif
      if(gc.program_flow < PROGRAM_FLOW_RUNNING  || 
         gc.program_flow > PROGRAM_FLOW_COMPLETED)
           FAIL(STATUS_INVALID_STATEMENT);
    SV.mode_complete = 1;
    return action;
}

////////////////////////////////////////////////////////////////////////////////
//                GROUP_7 MODAL ACTIONS [M3,M4,M5] SPINDLE TURNING            //
////////////////////////////////////////////////////////////////////////////////
static int Modal_Group_Actions7(int action){
    #if MainDebug == 1
    while(DMA_IsOn(1));
    dma_printf("gc.spindle_direction:= %d\n",gc.spindle_direction);
    #endif
      if(gc.spindle_direction < -1 || gc.spindle_direction > 1)
           FAIL(STATUS_INVALID_STATEMENT);
    SV.mode_complete = 1;
    return action;
}

////////////////////////////////////////////////////////////////////////////////
//       GROUP_12 MODAL ACTIONS [G54,G55,G56,G57...] COORDINATE SYSTEM        //
////////////////////////////////////////////////////////////////////////////////
static int Modal_Group_Actions12(int action){
    #if MainDebug == 1
    while(DMA_IsOn(1));
    dma_printf("GROUP_12 modal actions\taction:= %d\n",action);
    #endif
    return action;
}