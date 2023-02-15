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
//settings_t settings;
//parser_state_t gc;
volatile system_t sys;
volatile coord_sys coord_system[NUMBER_OF_DATUMS];
STP STPS[NoOfAxis];
volatile settings_t settings;

bit oneShotA; sfr;
bit oneShotB; sfr;


unsigned long rowbuff[128]={0};
//////////////////////////////////////////
//file scope vars
static unsigned int disable_steps;//stepper timeout

/////////////////////////////////////////
//condition externs
void Conditin_Externs(){
  PinMode();
  plan_init(15000,15000);
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
int axis_to_run,dif = 0,status_of_gcode,modal_group,modal_action;
static int cntr = 0,a = 0;

 Conditin_Externs();
  
 cntr = a = axis_to_run = dif = status_of_gcode = 0;
 

 //if there is memory in flash use this otherwise use default settings
// if(read_ram_loaded_indicator()){
//    settings_read_coord_data();
// }


  while(1){
     //continously test the limits
     Debounce_Limits(X);
     Debounce_Limits(Y);
     
     //continously check the communication channel
    if(!status_of_gcode){
      //get the modal_group
      modal_group = Get_modalgroup();
       switch(modal_group){
          case 0:break;
          case 2://MODAL_GROUP_0: // [G4,G10,G28,G30,G53,G92,G92.1] Non-modal
               modal_action = Modal_Group_Actions0(Get_modalword());
               modal_group = Rst_modalgroup();
               break;
          case 4://MODAL_GROUP_1: // [G0,G1,G2,G3,G80] Motion
              axis_to_run = Get_Axisword();
              if(axis_to_run){
                EnableSteppers(2);
                Modal_Group_Actions1(axis_to_run);
                axis_to_run = Rst_Axisword();
              }
               break;
          //case 8:break;// [G17,G18,G19] Plane selection
          //case 16:break;// [G90,G91] Distance mode
          case 32://MODAL_GROUP_4 [M0,M1,M2,M30] Stopping
               Modal_Group_Actions4(1);//implimentation needed
               break;
          //case 64:break;// [G93,G94] Feed rate mode
          //case 128:break;// [G20,G21] Units
          case 256://MODAL_GROUP_7 [M3,M4,M5] Spindle turning
               Modal_Group_Actions7(1);//implimentation needed
               break;
          case 512:// [G54,G55,G56,G57,G58,G59] Coordinate system selection
               Modal_Group_Actions12(gc.coord_select);//implimentation needed
               break;
       }
     }else{
        report_status_message(status_of_gcode);
     }
     
     status_of_gcode = Sample_Ringbuffer();


      //code execution confirmation led on clicker2 board
      #ifdef LED_STATUS
       LED1 = TMR.clock >> 4;
      #endif
      
      //disable the steppers after a long idle state, switch off in "Settings.h"
      #ifdef RESET_STEPPER_TIME
       if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
           disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
           
      #endif


     //temp debug for steppers
     #if StepperDebug == 1
     if(STPS[X].run_state != STOP || STPS[Y].run_state != STOP){
       while(DMA_IsOn(1));
       dma_printf("run_state:= %d\t%l\t%l\t%l\t%l\t%d\n",
                 (STPS[X].run_state&0xff),STPS[X].step_count,
                  SV.dA,STPS[Y].step_count,SV.dB,STPS[X].step_delay);
      }
     #endif
     
     //run at end of every scan
     protocol_execute_runtime();
     WDTCONSET = 0x01;
  }
}

////////////////////////////////////////////////////////////////////////////////
//         GROUP_0  NON MODAL ACTIONS [G4,G10,G28,G30,G53,G92,G92.1]          //
////////////////////////////////////////////////////////////////////////////////
static int Modal_Group_Actions0(int action){
//[b0=10ms | b1=100ms | b2 = 300ms | b4=500ms | b5 = 1sec]
int dly_time,i,j,result,axis_words,indx,temp_axis,axis_cnt,temp;
unsigned long _data;
float coord_data[NoOfAxis];
float a_val;
unsigned int home_select = 0;
//actions below are focused on the bit positions hence the
//numbering system grows 2^n
unsigned long _flash,*addr;
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
          for (i=0; i<=2; i++) { // Axes indices are consistent, so loop may be used to save flash space.
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
    switch(action){
      case 1: //b0000 0001
             SingleAxisStep(gc.next_position[X],gc.frequency,X);
             break;
      case 2://b0000 0010
             SingleAxisStep(gc.next_position[Y],gc.frequency,Y);
             break;
       case 3://b0000 0011
             //while(DMA_IsOn(1));
             //dma_printf("X:= %f | Y:=%f\n",gc.next_position[X],gc.next_position[Y]);
             DualAxisStep(gc.next_position[X], gc.next_position[Y],X,Y,gc.frequency);
             //while(DMA_IsOn(1));
             //dma_printf("SdlyX:=%l\taccX:=%l\tdecX:=%l\n",STPS[X].StartUp_delay,STPS[X].max_step_lim,STPS[X].decel_start);
             break;
      case 4://b0000 0100
            SingleAxisStep(gc.next_position[Z],gc.frequency,Z);
             break;
       case 5://b0000 0101
             DualAxisStep(gc.next_position[X], gc.next_position[Z],X,Z,gc.frequency);
             break;
       case 6://b0000 0110
             DualAxisStep(gc.next_position[Y], gc.next_position[Z],Y,Z,gc.frequency);
             break;
       case 8://b0000 1000
            SingleAxisStep(gc.next_position[A],gc.frequency,A);
             break;
       case 9://b0000 1001
            DualAxisStep(gc.next_position[X], gc.next_position[A],X,A,gc.frequency);
            break;
       case 10://b0000 1010
            DualAxisStep(gc.next_position[Y], gc.next_position[A],Y,A,gc.frequency);
            break;
       case 12://b0000 1100
            DualAxisStep(gc.next_position[Z], gc.next_position[A],Z,A,gc.frequency);
            break;
       case 13://Homing X axis
            Home(X);
            break;
       case 14://Homing Y axis
            Home(Y);
            break;
       case 15://Homing Y axis
            r_or_ijk(150.00, 30.00, 150.00, 30.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
            break;
        default: action = 0;
              break;
    }
    
    return action;
}


////////////////////////////////////////////////////////////////////////////////
//               GROUP_3 MODAL ACTIONS  [G90,G91] DISTANCE MODE               //
////////////////////////////////////////////////////////////////////////////////
static int Modal_Group_Actions3(int action){
    //char is unsigned short in MikroC can be > 1 in faulty value
   // if(gc.inches_mode > 1)
   //     FAIL(STATUS_SETTING_READ_FAIL);
   
   return action;
}

////////////////////////////////////////////////////////////////////////////////
//                GROUP_4 MODAL ACTIONS [M0,M1,M2,M30] STOPPING               //
////////////////////////////////////////////////////////////////////////////////
static int Modal_Group_Actions4(int action){
    #if MainDebug == 1
    while(DMA_IsOn(1));
    dma_printf("GROUP_4 modal actions\n");
    #endif
    return action;
}

////////////////////////////////////////////////////////////////////////////////
//                GROUP_7 MODAL ACTIONS [M3,M4,M5] SPINDLE TURNING            //
////////////////////////////////////////////////////////////////////////////////
static int Modal_Group_Actions7(int action){
    #if MainDebug == 1
    while(DMA_IsOn(1));
    dma_printf("GROUP_7 modal actions\n");
    #endif
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


////////////////////////////////////////////////////////////////////////////////
//      PROTOCOL EXECUTE RUNTIME FROM GRBL [STILL IMPLIMENTING ???]           //
////////////////////////////////////////////////////////////////////////////////

// Executes run-time commands, when required. This is called from various check points in the main
// program, primarily where there may be a while loop waiting for a buffer to clear space or any
// point where the execution time from the last check point may be more than a fraction of a second.
// This is a way to execute runtime commands asynchronously (aka multitasking) with grbl's g-code
// parsing and planning functions. This function also serves as an interface for the interrupts to
// set the system runtime flags, where only the main program handles them, removing the need to
// define more computationally-expensive volatile variables. This also provides a controlled way to
// execute certain tasks without having two or more instances of the same task, such as the planner
// recalculating the buffer upon a feedhold or override.
// NOTE: The sys.execute variable flags are set by any process, step or serial interrupts, pinouts,
// limit switches, or the main program.
void protocol_execute_runtime(){
  if (sys.execute) { // Enter only if any bit flag is true
    uint8_t rt_exec = sys.execute; // Avoid calling volatile multiple times

    // System alarm. Everything has shutdown by something that has gone severely wrong. Report
    // the source of the error to the user. If critical, Grbl disables by entering an infinite
    // loop until system reset/abort.
    if (rt_exec & (EXEC_ALARM | EXEC_CRIT_EVENT)) {
      sys.state = STATE_ALARM; // Set system alarm state

      // Critical event. Only hard limit qualifies. Update this as new critical events surface.
      if (rt_exec & EXEC_CRIT_EVENT) {
        report_alarm_message(ALARM_HARD_LIMIT);
        report_feedback_message(MESSAGE_CRITICAL_EVENT);
        bit_false(sys.execute,EXEC_RESET); // Disable any existing reset
        do {
          // Nothing. Block EVERYTHING until user issues reset or power cycles. Hard limits
          // typically occur while unattended or not paying attention. Gives the user time
          // to do what is needed before resetting, like killing the incoming stream.
        } while (bit_isfalse(sys.execute,EXEC_RESET));

      // Standard alarm event. Only abort during motion qualifies.
      } else {
        // Runtime abort command issued during a cycle, feed hold, or homing cycle. Message the
        // user that position may have been lost and set alarm state to enable the alarm lockout
        // to indicate the possible severity of the problem.
        report_alarm_message(ALARM_ABORT_CYCLE);
      }
      bit_false(sys.execute,(EXEC_ALARM | EXEC_CRIT_EVENT));
    }

    // Execute system abort.
    if (rt_exec & EXEC_RESET) {
      sys.abort = true;  // Only place this is set true.
      return; // Nothing else to do but exit.
    }

    // Execute and serial print status
    if (rt_exec & EXEC_STATUS_REPORT) {
      report_realtime_status();
      bit_false(sys.execute,EXEC_STATUS_REPORT);
    }

    // Initiate stepper feed hold
    if (rt_exec & EXEC_FEED_HOLD) {
      //st_feed_hold(); // Initiate feed hold.
      bit_false(sys.execute,EXEC_FEED_HOLD);
    }

    // Reinitializes the stepper module running state and, if a feed hold, re-plans the buffer.
    // NOTE: EXEC_CYCLE_STOP is set by the stepper subsystem when a cycle or feed hold completes.
    if (rt_exec & EXEC_CYCLE_STOP) {
      //st_cycle_reinitialize();
      bit_false(sys.execute,EXEC_CYCLE_STOP);
    }

    if (rt_exec & EXEC_CYCLE_START) {
      //st_cycle_start(); // Issue cycle start command to stepper subsystem
      if (bit_istrue(settings.flags,BITFLAG_AUTO_START)) {
        sys.auto_start = true; // Re-enable auto start after feed hold.
      }
      bit_false(sys.execute,EXEC_CYCLE_START);
    }
  }

  // Overrides flag byte (sys.override) and execution should be installed here, since they
  // are runtime and require a direct and controlled interface to the main stepper program.
}



////////////////////////////////////////////////////////////////////////////////
//                    OBSOLETE CODE FROM INITIAL TESTS                        //
////////////////////////////////////////////////////////////////////////////////
//KEEPING FOR REFERENCE
/* 
 *temp disabled code to get gcode send working
     if(!SW2){
       Toggle  = 0;
       disable_steps = 0;
       disableOCx();
     }

     if((!SW1)&&(!Toggle)){
        LED1 = 0;
        Toggle = 1;
        EnStepperX();
        EnStepperY();
        EnStepperZ();
        EnStepperA();
        ResetHoming();
        a = 0;
     }
     //X Y Z
     if(Toggle){

       if((a > 19)){
         if(STPS[X].homing.home_cnt >= 2){
            STPS[X].homing.home_cnt = 0;
            a = 11;
            dma_printf("\nXCnt:= %d : a:= %d",STPS[X].homing.home_cnt,a);
         }
         if(STPS[Y].homing.home_cnt >= 2){
            STPS[Y].homing.home_cnt = 0;
            a = 12;
            dma_printf("\nXCnt:= %d : a:= %d",STPS[Y].homing.home_cnt,a);
         }
        // Modal_Group1(a);
       }else{
          if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
            // a = Modal_Group1(a);
#if DMADebug == 1
             dma_printf("\na:= %d : Step:=\t%l mm2mve:=\t%l : Step:=\t%l",
                     a,STPS[X].dist,STPS[X].mmToTravel,
                     STPS[X].step_count);
#endif
          }
       }
}*/