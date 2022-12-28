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
void PinMode(); //pin mode configuration
void UartConfig();//setupUart
void set_performance_mode();//sys clk performance setup
void Uart2InterruptSetup();//uart2 interrupt on recieve
void LcdI2CConfig();//configure the i2c_lcd 4line 16ch display
void OutPutPulseXYZ(); // setup output pulse OC3

//movement from gcode instruction, mostly modal
int Temp_Move(int a);
//non modal actions from gcode instruction
int Non_Modal_Actions(int action);



#endif