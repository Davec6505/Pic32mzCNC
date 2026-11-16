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
axis_combination axis_xyz;
settings_t settings absolute 0xA0002800;
parser_state_t gc   absolute 0xA0002900;
STP STPS[NoOfAxis]  absolute 0xA0003100;
system_t sys        absolute 0xA0003500;
coord_sys coord_system[NUMBER_OF_DATUMS] absolute 0xA0003600;
//////////////////////////////////////////
//DMA specific global decleration
unsigned long rowbuff[128]={0};

//feed rate handed to the legacy kinematics for the current move
static float motion_rate;

//////////////////////////////////////////
//file scope vars
static unsigned int disable_steps;//stepper timeout
static int axis_to_home = 0;
static int send_status_once = 0;
static int status_of_gcode;
/////////////////////////////////////////
//condition externs
void Condition_Externs(){
  PinMode();
  Ethernet_Transport_Init();
  plan_init(5000.0,5000.0);//settings.acceleration,settings.acceleration);
  Init_Protocol();
  G_Initialise();
  sys_sync_current_position();
  disableSpindleOCx();
  DisableSteppers();
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
int dif;
static int cntr = 0,a = 0;

 //setup
 Condition_Externs();

 //pre condition states and variables related to the system and gcode
 cntr = a =  dif = status_of_gcode = modal_group = modal_action = 0;

 //start the dds timer8 for isr timming , this doesn't have to run continously.
 Timer8_Start();

 //All limit switches are sampled in the Timer1 10 ms ISR (Limits_Sample)for asynchronous detection

 while(1){


   //ENC28J60 is polled twice a scan, here and before the runtime checks
   Ethernet_Transport_Poll();
   
   
   //execute a newly accepted gcode line, then send its single reply
   if(status_of_gcode == STATUS_COMMAND_EXECUTE_MOTION){
     report_status_message(Execute_Gcode_Line());
     G_Begin_Block();
     status_of_gcode = STATUS_OK;
   }
   #ifdef STEP_ENGINE_READY
   else if(Get_modalgroup() == bit(HOME_ALL)){
     //homing keeps being polled until every axis has homed
     modal_action = Modal_Group_Actions1(ALL_AXIS);
     if(modal_action == 0) Rst_modalgroup();
   }
   // TODO(DDS): the step engine should call Cycle_Complete() itself when the last axis stops.
   if(sys.state == STATE_CYCLE && !Axes_Running())
     Cycle_Complete();
   #endif
   
//Debug for stepper report if not connected to unit
#if StepperDebug == 1
if(SV.mode_complete){
if(STPS[X].run_state != STOP | STPS[Y].run_state != STOP){
while(DMA_IsOn(1));
dma_printf("\
dif:= %l\t%l\t%l\t%l\t%l\t%l\t%d\n"
,STPS[X].step_count
,STPS[X].accel_count
,STPS[X].step_delay
,STPS[Y].step_count
,STPS[Y].accel_count
,STPS[Y].step_delay
,SV.mode_complete);
}
}
#endif

  //second ENC28J60 poll of the scan
  Ethernet_Transport_Poll();

  //state check for resets
  protocol_system_check();
   
  //run at end of every scan
  protocol_execute_runtime();

  //lines stay buffered in the serial ring while motion owns the machine
  //or the machine is held (M0 or '!') until cycle start
  if(sys.state != STATE_CYCLE && sys.state != STATE_HOMING && sys.state != STATE_HOLD)
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
   WDT_CLEAR();
 }
}


// A TCP reply can only go out with the packet being answered, so answer it
// now: the status request and any complete lines. Lines wait for the main
// loop while the machine is busy or a reset or hold is pending.
void Host_ServiceNow(){
  int n;
  if(Serial_TakeStatusRequest()) report_realtime_status();
  if(Serial_PeekRealtime() & (EXEC_RESET | EXEC_FEED_HOLD)) return;
  for(n = 0; n < 16; n++){
    if(status_of_gcode == STATUS_COMMAND_EXECUTE_MOTION){
      report_status_message(Execute_Gcode_Line());
      G_Begin_Block();
      status_of_gcode = STATUS_OK;
    }
    if(sys.abort || Get_Difference() == 0) return;
    if(sys.state == STATE_CYCLE || sys.state == STATE_HOMING || sys.state == STATE_HOLD)
      return;
    status_of_gcode = Sample_Gocde_Line();
  }
}

////////////////////////////////////////////////////////////////////////////////
//                      EXECUTE ONE ACCEPTED GCODE LINE                       //
////////////////////////////////////////////////////////////////////////////////
// Modal state (G17-19, G20/21, G54-59, G90/91, F...) was applied while parsing,
// this runs the actions in Grbl order and returns the line's single status.
static int Execute_Gcode_Line(){
int axes = Get_Axisword();
int nm   = Get_non_modalword();
  SET_FAIL(STATUS_OK);
  if(nm){
    Modal_Group_Actions0(nm);
    //G10, G28, G30 and G92 consume the axis words
    if(nm & ~bit(NON_MODAL_DWELL)) axes = 0;
  }
  if(GET_FAIL() == STATUS_OK && axes)
    Motion_Line(axes);
  if(GET_FAIL() == STATUS_OK && gc.program_flow == PROGRAM_FLOW_COMPLETED)
    G_Program_End();
  //M0: hold after the block's motion, as Grbl does; cycle start '~' resumes
  // TODO(DDS): wait for the queued motion to finish before holding.
  if(GET_FAIL() == STATUS_OK && gc.program_flow == PROGRAM_FLOW_PAUSED)
    sys.state = STATE_HOLD;
  return GET_FAIL();
}

////////////////////////////////////////////////////////////////////////////////
//                          MOTION AND CYCLE STATE                            //
////////////////////////////////////////////////////////////////////////////////
// Machine coordinate target for the axes in the block, others stay put
static void Compute_Target(int axes,float *target){
int i;
  for(i=0;i<NoOfAxis;i++){
    if(bit_istrue(axes,bit(i))){
      if(gc.absolute_override)
        target[i] = gc.next_position[i];
      else if(gc.absolute_mode)
        target[i] = gc.next_position[i] + gc.coord_system[i] + gc.coord_offset[i];
      else
        target[i] = gc.position[i] + gc.next_position[i];
    }else{
      target[i] = gc.position[i];
    }
  }
}

// G0/G1/G2/G3 with axis words
static void Motion_Line(int axes){
float target[NoOfAxis];
int mode = Get_motionmode();
  if(mode != MOTION_MODE_SEEK && mode != MOTION_MODE_LINEAR &&
     mode != MOTION_MODE_CW_ARC && mode != MOTION_MODE_CCW_ARC){
    FAIL(STATUS_INVALID_STATEMENT);
    return;
  }
  if(gc.absolute_override && mode != MOTION_MODE_SEEK && mode != MOTION_MODE_LINEAR){
    FAIL(STATUS_INVALID_STATEMENT);
    return;
  }
  if(mode != MOTION_MODE_SEEK && gc.feed_rate <= 0.0){
    FAIL(STATUS_UNDEFINED_FEED_RATE);
    return;
  }
  // TODO: arcs in the G18/G19 planes.
  if((mode == MOTION_MODE_CW_ARC || mode == MOTION_MODE_CCW_ARC) && axis_xyz != AXIS_XY){
    FAIL(STATUS_UNSUPPORTED_STATEMENT);
    return;
  }
  if((mode == MOTION_MODE_CW_ARC || mode == MOTION_MODE_CCW_ARC) &&
     (axes & (bit(Z) | bit(A)))){
    FAIL(STATUS_UNSUPPORTED_STATEMENT);
    return;
  }
  Compute_Target(axes,target);
  Run_Move(target,mode);
}

// Starts a move to a machine coordinate target. sys.state is STATE_CYCLE until
// Cycle_Complete() is called.
static void Run_Move(float *target,int mode){
int i, axes = 0;
int arc = (mode == MOTION_MODE_CW_ARC || mode == MOTION_MODE_CCW_ARC);
  for(i=0;i<NoOfAxis;i++){
    if(target[i] != gc.position[i]) bit_true(axes,bit(i));
  }
  if(!axes && !arc) return;

  sys.state = STATE_CYCLE;
#ifdef STEP_ENGINE_READY
  //legacy kinematics take absolute mm in G90 and a delta in G91
  motion_rate = (mode == MOTION_MODE_SEEK) ? settings.default_seek_rate : gc.feed_rate;
  for(i=0;i<NoOfAxis;i++){
    if(bit_istrue(axes,bit(i)))
      gc.next_position[i] = gc.absolute_mode ? target[i] : target[i] - gc.position[i];
  }
  EnableSteppers();
  if(arc)
    Modal_Group_Actions1(15);
  else
    MultiAxisStep(gc.next_position,axes,motion_rate);
#else
  // TODO(DDS): hand target[] to the step engine instead of jumping there.
  for(i=0;i<NoOfAxis;i++)
    STPS[i].steps_abs_position = belt_steps(target[i],i);
#endif
  for(i=0;i<NoOfAxis;i++)
    gc.position[i] = target[i];
#ifndef STEP_ENGINE_READY
  Cycle_Complete();
#endif
}

// Called once the last axis of a move has stopped.
// TODO(DDS): call from the step engine when the last axis stops.
void Cycle_Complete(){
  if(sys.state == STATE_CYCLE)
    sys.state = STATE_IDLE;
}

#ifdef STEP_ENGINE_READY
static int Axes_Running(){
int i;
  for(i=0;i<NoOfAxis;i++){
    if(GET_RunState(i)) return 1;
  }
  return 0;
}

static void Wait_Motion(){
  while(Axes_Running()){
    protocol_execute_runtime();
    if(sys.abort) return;
  }
  Cycle_Complete();
}

//G28/G30 intermediate moves run axes separately, Z first.
static void Run_Single_Axes(float *target){
int order[NoOfAxis];
int k,i;
float step_target[NoOfAxis];
  order[0] = Z; order[1] = X; order[2] = Y; order[3] = A;
  for(k=0;k<NoOfAxis;k++){
    for(i=0;i<NoOfAxis;i++) step_target[i] = gc.position[i];
    step_target[order[k]] = target[order[k]];
    Run_Move(step_target,MOTION_MODE_SEEK);
    Wait_Motion();
    if(sys.abort) return;
  }
}
#endif

////////////////////////////////////////////////////////////////////////////////
//         GROUP_0  NON MODAL ACTIONS [G4,G10,G28,G30,G53,G92,G92.1]          //
////////////////////////////////////////////////////////////////////////////////
//actions are the non modal bit positions hence the numbering grows 2^n
static int Modal_Group_Actions0(int action){
int i,temp,axis_words;
unsigned long dly_time;
float coord_data[NoOfAxis];
float target[NoOfAxis];

   switch(action){
     case 2:  //G4 dwell, P in seconds as in Grbl 1.1, or S in seconds
          if(gc.S > 0)
             dly_time = (unsigned long)gc.S * 1000;
          else if(gc.dwell >= 0.0)
             dly_time = (unsigned long)(gc.dwell * 1000.0 + 0.5);
          else{
             FAIL(STATUS_INVALID_STATEMENT);
             break;
          }
          while(dly_time > 0){
             LED2 = TMR.clock >> 1;
             Delay_ms(1);
             protocol_execute_runtime();
             if(sys.abort) break;
             WDT_CLEAR();
             dly_time--;
          }
          LED2 = false;
          break;
     case 4:  //G10 L2 / L20 Pn, P0 = active system, P1..P6 = G54..G59
          // TODO: G10 L1 tool table offsets.
          if(gc.L != 2 && gc.L != 20){
             FAIL(STATUS_UNSUPPORTED_STATEMENT);
             break;
          }
          temp = (gc.P == 0) ? gc.coord_select : gc.P;
          if(temp < 1 || temp > 6){
             FAIL(STATUS_INVALID_STATEMENT);
             break;
          }
          axis_words = Get_Axisword();
          settings_read_coord_data();
          for(i=0;i<NoOfAxis;i++){
             coord_data[i] = (i < 3) ? coord_system[temp-1].coord[i] : 0.0;
             if(i < 3 && bit_istrue(axis_words,bit(i))){
                //L20 makes the current position read as the given value
                if(gc.L == 20)
                   coord_data[i] = gc.position[i] - gc.coord_offset[i] - gc.next_position[i];
                else
                   coord_data[i] = gc.next_position[i];
             }
          }
          if(settings_write_coord_data(temp,coord_data)){
             FAIL(STATUS_SETTING_READ_FAIL);
             break;
          }
          if(temp == gc.coord_select)
             memcpy(gc.coord_system,coord_data,sizeof(coord_data));
          break;
     case  8:  //G28 go to the stored G28 position
     case 32:  //G30 go to the stored G30 position
          //axis words give an intermediate point, and only those axes go home
          temp = (action == NON_MODAL_GO_HOME_1_BIT) ? SETTING_INDEX_G30 : SETTING_INDEX_G28;
          axis_words = Get_Axisword();
          if(axis_words){
             Compute_Target(axis_words,target);
             #ifdef STEP_ENGINE_READY
             Run_Single_Axes(target);
             #else
             Run_Move(target,MOTION_MODE_SEEK);
             #endif
          }
          settings_read_coord_data();
          for(i=0;i<NoOfAxis;i++){
             target[i] = gc.position[i];
             if(i < 3 && (!axis_words || bit_istrue(axis_words,bit(i))))
                target[i] = coord_system[temp-1].coord[i];
          }
          #ifdef STEP_ENGINE_READY
          Run_Single_Axes(target);
          #else
          Run_Move(target,MOTION_MODE_SEEK);
          #endif
          break;
     case 16:  //G28.1 store the current machine position
     case 64:  //G30.1
          temp = (action == NON_MODAL_SET_HOME_1_BIT) ? SETTING_INDEX_G30 : SETTING_INDEX_G28;
          if(settings_write_coord_data(temp,gc.position))
             FAIL(STATUS_SETTING_READ_FAIL);
          break;
     case 128:  //G92 offsets, not written to flash so lost on reset
          axis_words = Get_Axisword();
          if (!axis_words) {
             FAIL(STATUS_INVALID_STATEMENT);
             break;
          }
          for (i=0; i<=2; i++) {
             if (bit_istrue(axis_words,bit(i)) )
                gc.coord_offset[i] = gc.position[i]-gc.coord_system[i]-gc.next_position[i];
          }
          break;
     case 256: //G92.1 clear the G92 offsets
          clear_vector(gc.coord_offset);
          break;
     default:
          FAIL(STATUS_UNSUPPORTED_STATEMENT);
          break;
   }
  return action;
}

#ifdef STEP_ENGINE_READY
////////////////////////////////////////////////////////////////////////////////
//                       ARC AND LEGACY HOMING DISPATCH                       //
////////////////////////////////////////////////////////////////////////////////
static int Modal_Group_Actions1(int action){
    #if MainDebug == 10
    while(DMA_IsOn(1));
    dma_printf("action:= %d\tgc.frequency:= %l\n",action,gc.frequency);
    #endif
    switch(action){
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
              report_status_message(STATUS_OK);
            }
            break;
        default: return action = 0;
              break;
    }

    return action;
}
#endif
