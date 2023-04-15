#ifndef SETTINGS_H
#define SETTINGS_H


///////////////////////////////////////////////////////////////////////////////
//                             DEFINES                                       //
///////////////////////////////////////////////////////////////////////////////
typedef __attribute__((aligned (32))) float afloat;

#define FIRMWARE "Grbl "
#define GRBL_VERSION "0.8c "
#define GRBL_HELP "['$' for help]"


//G54, G55, G56, G57, G58 and G59 are datum shift G-Codes.
//This series of commands tell the CNC control which datum we are using.
//Once the machine reads one of these codes it will continue to work
//from this position until a new one is called upon
#define NUMBER_OF_DATUMS 9

/////////////////////////////////////////////////////////////////
// Define bit flag masks for the boolean settings in settings.flag.

//indices of flags in word
#define FLAG_REPORT_INCHES            1
#define FLAG_AUTO_START               2
#define FLAG_INVERT_ST_ENABLE         4
#define FLAG_HARD_LIMIT_ENABLE        8
#define FLAG_HOMING_ENABLE            16


#define BITFLAG_REPORT_INCHES         bit(0)
#define BITFLAG_AUTO_START            bit(1)
#define BITFLAG_INVERT_ST_ENABLE      bit(2)
#define BITFLAG_HARD_LIMIT_ENABLE     bit(3)
#define BITFLAG_HOMING_ENABLE         bit(4)

//flags
#define DEFAULT_REPORT_INCHES          false
#define DEFAULT_AUTO_START             true
#define DEFAULT_INVERT_ST_ENABLE       true
#define DEFAULT_HARD_LIMIT_ENABLE      true
#define DEFAULT_HOMING_ENABLE          true

//default values of words and flags
#define DEFAULT_X_STEPS_PER_MM         186.750
#define DEFAULT_Y_STEPS_PER_MM         186.750
#define DEFAULT_Z_STEPS_PER_MM         186.750
#define DEFAULT_A_STEPS_PER_MM         186.750
#define DEFAULT_B_STEPS_PER_MM         186.750
#define DEFAULT_C_STEPS_PER_MM         186.750
#define DEFAUT_P_USEC                  100
#define DEFAULT_MM_PER_ARC_SEGMENT     0.20
#define DEFAULT_RAPID_FEEDRATE         500.00 // mm/min
#define DEFAULT_FEEDRATE               250.00
#define DEFAULT_ACCELERATION           5000.00//(3.50*secXsec) // 10 mm/min^2
#define DEFAULT_JUNCTION_DEVIATION     0.05 // mm
#define DEFAULT_HOMING_RAPID_FEEDRATE  1000.00 // mm/min
#define DEFAULT_HOMING_FEEDRATE        500.00 // mm/min
#define DEFAULT_HOMING_DEBOUNCE_DELAY  100 // msec (0-65k)
#define DEFAULT_HOMING_PULLOFF         1.00 // mm
#define DEFAULT_STEPPER_IDLE_LOCK_TIME 25 // msec (0-255)
#define DEFAULT_DECIMAL_PLACES         3
#define DEFAULT_N_ARC_CORRECTION       25
#define DEFAULT_HOME_DIR_MASK          15 // move positive dir
#define DEFAULT_INVERT_MASK            15 // move positive dir



////////////////////////////////////////////////////////////////
// NOTE: Work coordinate indices are (0=G54, 1=G55, ... , 6=G59)
#define N_COORDINATE_SYSTEM  9  //supported work coordinate systems (from index 0)
#define SETTING_INDEX_NCOORD N_COORDINATE_SYSTEM+1 // Total number of system stored (from index 0)

/////////////////////////////////////////////////////////////////
// NOTE: Home coordinate indices are (10=G281, 11=G301)
#define SETTING_INDEX_G28  SETTING_INDEX_NCOORD      //Home position 1
#define SETTING_INDEX_G30  SETTING_INDEX_NCOORD + 1  // Home position 2
// #define SETTING_INDEX_G92    2  // Coordinate offset (G92.2,G92.3 not supported)



////////////////////////////////////////////////////////////
//              Stepper Motor Settings                    //
////////////////////////////////////////////////////////////
#define NoOfAxis 4

//Number of planes must be adjusted acording to NoOfAxis
//4 axis has 4 planes XY XZ YZ [XA YA ZA]
#define NO_OF_PLANES 4

//! Stepper drive micro steps setting.
#define M_STEP   32.00

//! Maximun mm/min needed for calculation
#define MAX_SPEED 300,00 //In mm/min
/**************************************************
* ! Belt driven systems
**************************************************/
#define PULLEY_TOOTH_COUNT 20.00  //belt pully tooth count
#define BELT_PITCH 2.00           // Belt tooth pitch


/**************************************************
* uncomment USE_LEADSCREW_PITCH if using N instead of pitch
**************************************************/
//#define USE_LEADSCREW_PITCH
//! Lead screw driven systems
#define N 1                    // Screw pitch tpmm
#define LEADSCREW_PITCH 1      //leadscrewm pitch


///////////////////////////////////////////////////////////
//            TIMER AND TIMEOUT VALUES                   //
///////////////////////////////////////////////////////////

/***************************************************
* Set the Limit switch Debounce counter [max count]
***************************************************/
#define DEBOUNCE_COUNT 5

/***************************************************
 * Define the Timer value in seconds to reset
 * the Steppers if no calls to run steppers
 * and all output compares are set to off
 **************************************************/
#define SEC_TO_DISABLE_STEPPERS 10

/******************************************************
* Debounce timer counter base pulse uncomment the base
* value required may be usefull if using a cheap limit
* this is only a reset time base, the setting of the
* limits is instantaneous with interrupts
******************************************************/
#define _ms10_
//#define _ms100_
//#define _ms300_
//#define _ms500_
//#define _sec1_

///////////////////////////////////////////////////////////
//            SET THE  PLATFORM DIMENSIONS               //
///////////////////////////////////////////////////////////

#define X_MAX_SIZE 300.00
#define Y_MAX_SIZE 300.00
#define Z_MAX_SIZE 100.00
#define A_MAX_SIZE 100.00
#define B_MAX_SIZE 100.00
#define C_MAX_SIZE 100.00

#define SIZE_LIST (double[]){X_MAX_SIZE, Y_MAX_SIZE, Z_MAX_SIZE, A_MAX_SIZE, B_MAX_SIZE, C_MAX_SIZE}

////////////////////////////////////////////////////////////
//          M CODE SETTINGS AND COMMANDS                  //
////////////////////////////////////////////////////////////
//uncomment for coolent
//#define ENABLE_M7

#define COOLANT_CONTROL_h
#define COOLANT_MIST_ENABLE 2
#define COOLANT_FLOOD_ENABLE 1
#define COOLANT_DISABLE 0 // Must be zero.

///////////////////////////////////////////////////////////////////////////////
//                          STRUCTS UNIONS & ENUMS                           //
///////////////////////////////////////////////////////////////////////////////
 // Global persistent settings (Stored from byte EEPROM_ADDR_GLOBAL onwards)
typedef struct {
  float steps_per_mm[NoOfAxis];
  float default_feed_rate;
  float default_seek_rate;
  float homing_feed_rate;
  float homing_seek_rate;
  float homing_pulloff;
  float mm_per_arc_segment;
  float acceleration;
  float junction_deviation;
  unsigned int n_arc_correction;
  unsigned int flags;  // Contains default boolean settings
  unsigned int step_idle_delay;
  unsigned int homing_debounce_delay;
  unsigned int stepper_idle_lock_time; // If max value 255, steppers do not disable.
  unsigned int microsteps;
  unsigned int p_usec;
  unsigned int decimal_places;
  unsigned int homing_dir_mask;
  unsigned int invert_mask;
//  uint8_t status_report_mask; // Mask to indicate desired report data.
}  settings_t;

extern settings_t settings;


#endif