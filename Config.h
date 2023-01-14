#ifndef CONFIG_H
#define CONFIG_H


#include "Timers.h"
#include "built_in.h"
#include "Pins.h"
#include "Stepper.h"
#include "Steptodistance.h"
#include "Serial_Dma.h"
#include "Kinematics.h"
#include "GCODE.h"
#include "Globals.h"
#include "Limits.h"
#include "Protocol.h"
#include "Flash_R_W.h"

///////////////////////////////////////////////////
//DEFINES

#define false 0
#define true 1



////////////////////////////////////////////////////
//constants
extern unsigned char LCD_01_ADDRESS; //PCF8574T
extern bit oneShotA; sfr;
extern bit oneShotB; sfr;

////////////////////////////////////////////////////
//STRUCTS and ENUMS


////////////////////////////////////////////////////
//function prototypes
void PinMode();             //pin mode configuration
void UartConfig();          //setupUart
void set_performance_mode();//sys clk performance setup
void Uart2InterruptSetup(); //uart2 interrupt on recieve turned off
//void LcdI2CConfig();      //configure the i2c_lcd 4line 16ch display
void OutPutPulseXYZ();      // setup output pulse OC3

//non modal actions from gcode instruction
int Modal_Group_Actions0(int action);
//movement from gcode instruction, mostly modal
int Modal_Group_Actions1(int action);




#endif