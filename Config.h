#ifndef CONFIG_H
#define CONFIG_H

#include "mikroc_intellisense.h"

#include "Pins.h"
#include "Timers.h"
#include "built_in.h"
#include "Stepper.h"
#include "Steptodistance.h"
#include "Serial_Dma.h"
#include "Kinematics.h"
#include "GCODE.h"
#include "Globals.h"
#include "Limits.h"
#include "Protocol.h"
#include "Flash_R_W.h"
#include "Tcp_Ethernet.h"

///////////////////////////////////////////////////
//DEFINES

#define false 0
#define true 1

//Clears the watchdog: WDTCLRKEY is the upper half of WDTCON (0xBF800800) and
//must get 0x5743 in one 16 bit write. WDTCONSET = 1 would set WDTWINEN instead.
#define WDT_CLEAR() (*(volatile unsigned short *)0xBF800802 = 0x5743)


////////////////////////////////////////////////////
//constants
extern unsigned char LCD_01_ADDRESS; //PCF8574T

////////////////////////////////////////////////////
//STRUCTS and ENUMS


////////////////////////////////////////////////////
//function prototypes
void PinMode();             //pin mode configuration

void set_performance_mode();//sys clk performance setup

//void LcdI2CConfig();      //configure the i2c_lcd 4line 16ch display
void OutPutPulseXYZ();      // setup output pulse OC3

//Group 1 G4,G10,G28,G30,G53,G92,G92.1] Non-modal
static int Modal_Group_Actions0(int action);

//execute one accepted gcode line and return its status
static int Execute_Gcode_Line();
static void Compute_Target(int axes,float *target);
static void Motion_Line(int axes);
static void Run_Move(float *target,int mode);

//motion finished, leave STATE_CYCLE
void Cycle_Complete();

//answer what a TCP packet just delivered before its reply is sent
void Host_ServiceNow();

#ifdef STEP_ENGINE_READY
//Group 2 [G0,G1,G2,G3,G80] Motion
static int Modal_Group_Actions1(int action);
static int Axes_Running();
static void Wait_Motion();
static void Run_Single_Axes(float *target);
#endif




#endif