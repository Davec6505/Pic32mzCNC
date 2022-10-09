#ifndef KINEMATICS_H
#define KINEMATICS_H

#include <stdint.h>
#include "Stepper.h"
#include  "SErial_Dma.h"
#include "GCODE.h"


//Circle defines and consts
// Decide how many axis you would like to run

#define  NoOfAxis   6

#define X_AXIS 0 // Axis indexing value
#define Y_AXIS 1
#define Z_AXIS 2

#define DEFAULT_FEEDRATE 250.0
#define DEFAULT_MM_PER_ARC_SEGMENT 0.1
// Useful macros
#define clear_vector(a) memset(a, 0, sizeof(a))
#define clear_vector_float(a) memset(a, 0.0, sizeof(float)*N_AXIS)
#define max(a,b) (((a) > (b)) ? (a) : (b))
#define min(a,b) (((a) < (b)) ? (a) : (b))
/*
 *FUNCTION POINTER ARRAY FOR TOGGLING BETWEEN LINEAR
 *OUTPUT COMPARE AND CIRCULAR OUTPUT COMPARE
 */
extern volatile void (*AxisPulse[3])();

////////////////////////////////////////////////////
//       ******LINEAR INTERPOLATION******         //
////////////////////////////////////////////////////
typedef struct Steps{
   //! micro sec  count value for clock pluse compare
  signed long microSec;
  //! Step bit check
  unsigned short CheckStep: 1;
  //! Direction stepper motor should move.
  unsigned short PLS_Step_ : 1;
  //!
  unsigned short StepBits:  1;
  //! axis to stop 1st
  unsigned short stopAxis: 1;
  //! What part of the speed ramp we are in.
  unsigned char run_state ;
  //! Peroid of next timer delay. At start this value set the accelration rate.
   long step_delay;
  //! What step_pos to start decelaration
   long decel_start;
  //! Sets deceleration rate.
   long decel_val;
  //! Minimum time delay (max speed)
   long min_delay;
  //! Counter used when accelerateing/decelerateing to calculate step_delay.
   long accel_count;
   long deccl_count;
  //! Counter used when accelerateing/decelerateing to calculate step_delay.
   long step_count;
  //! Distance calculated to travel
   long dist;
  //! Counter used when accelerateing/decelerateing to calculate step_delay.
   long new_step_delay;
  //! Counter used when accelerateing/decelerateing to calculate step_delay.
   long last_accel_delay;
 //! Limit accelleration
   long accel_lim;
 // Limit the number of steps
   long max_step_lim;
 // calculation modulo value
   long rest;
 // Generate a startup delay to accellerate from
  long StartUp_delay;
 //!  the mm to travel
 signed long mmToTravel;
}STP;
extern STP STPS[NoOfAxis];


////////////////////////////////////////////////////
//     ******CIRCULAR INTERPOLATION******         //
////////////////////////////////////////////////////




// Global persistent settings (Stored from byte EEPROM_ADDR_GLOBAL onwards)
typedef struct {
  float steps_per_mm[3];
  uint8_t microsteps;
  uint8_t pulse_microseconds;
  float default_feed_rate;
  float default_seek_rate;
  uint8_t invert_mask;
  float mm_per_arc_segment;
  float acceleration;
  float junction_deviation;
  uint8_t flags;  // Contains default boolean settings
  uint8_t homing_dir_mask;
  float homing_feed_rate;
  float homing_seek_rate;
  uint16_t homing_debounce_delay;
  float homing_pulloff;
  uint8_t stepper_idle_lock_time; // If max value 255, steppers do not disable.
  uint8_t decimal_places;
  uint8_t n_arc_correction;
//  uint8_t status_report_mask; // Mask to indicate desired report data.
} settings_t;
extern settings_t settings;

///////////////////////////////////////////
//FUNCTION PROTOTYPES
//Move inline
void DualAxisStep(long newx,long newy,int axis_combo);
void SingleAxisStep(long newxyz,int axis_No);
//Circle move axis
void mc_arc(float *position, float *target, float *offset, uint8_t axis_0, uint8_t axis_1,
  uint8_t axis_linear, float feed_rate, uint8_t invert_feed_rate, float radius, uint8_t isclockwise);
float hypot(float angular_travel, float linear_travel);
void SerialPrint(float r);
void r_or_ijk(float xCur,float yCur,float xFin,float yFin,float r, float i, float j, float k);
#endif