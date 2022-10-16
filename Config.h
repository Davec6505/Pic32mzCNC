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



///////////////////////////////////////////////////
//DEFINES
/* Define the Timer value in seconds to reset
 * the Steppers if no calls to run steppers
 * and all output compares are set to off
 */
#define SEC_TO_DISABLE_STEPPERS 10
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
void Temp_Move(int a);
void LCD_Display();


#endif