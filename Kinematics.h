#ifndef KINEMATICS_H
#define KINEMATICS_H

#include <stdint.h>
#include "Config_adv.h"
#include "Settings.h"
#include "Planner.h"
#include "Stepper.h"
#include  "Serial_Dma.h"
#include "GCODE.h"
#include "Globals.h"

/////////////////////////////////////////////////////////
//                       MACROS                        //
/////////////////////////////////////////////////////////

//Direction counts values for absolute values
//count addition values for absolute values
#define CW_   1
#define CCW_ -1
#define zero 0

#define Direction(a) (((a) < (0))? (CCW_) : (CW_))
//Bresenhams differential calculation
#define BresIncVal(a) ((2)*(a))
#define BresDiffVal(a,b) ((2)*((a) - (b)))

/////////////////////////////////////////////////////////
//       Direction of stepper motor movement           //
/////////////////////////////////////////////////////////
//Bit direction for outputs
#define CW  0
#define CCW 1

//axis >> 1 to Home all axis 1 at a time
#define ALL_AXIS (((NoOfAxis*NoOfAxis)*2)-1)

//rising or falling edge triggers
//#define POSITIVE_EDGE
#define NEGATIVE_EDGE

//Homing control
#define HOME_SET         1
#define HOME             2
#define HOME_REV         3
#define HOME_BACK        4
#define HOME_COMPLETE    5


//bitflags defined
#define BIT_HOME_SET      bit(1)
#define BIT_HOME          bit(2)
#define BIT_HOME_REV      bit(3)
#define BIT_HOME_BACK     bit(4)
#define BIT_HOME_COMPLETE bit(5)

/////////////////////////////////////////////////////////
//sbits and bit types
extern char stepper_state;
extern sfr stp_stopped;
extern sfr stp_run;
extern sfr stp_pause;

/////////////////////////////////////////////////////////
//Structs enums consts etc
typedef struct {
unsigned int home_state;
unsigned int home_cnt;
}homing_t;


typedef struct Steps{
 //! the master axis indicator
 char master: 1;
  //! Step bit check
  unsigned short CheckStep: 1;
  //! Direction stepper motor should move.
  unsigned short PLS_Step_ : 1;
  //!
  unsigned short StepBits:  1;
  //! axis to stop 1st
  unsigned short stopAxis: 1;
  //! Track the direction of the axis for absolute value tracking
  int  axis_dir;
  //! What part of the speed ramp we are in.
  int run_state ;
   //! micro sec  count value for clock pluse compare
  long microSec;
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
  //! aaceleration and decelleration constants
  long acc;
  long dec;
  //! Counter used when accelerateing/decelerateing to calculate step_delay.
  long step_count;
  //! Distance calculated to travel
  long dist;
  //! if a change of speed is required from dir change or any other
  long psingle;
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
 long mmToTravel;
 //!  Real-time machine (aka home) abs position vector in steps.
 long steps_abs_position;
 //! Real-time machine positions in mm or inches
// float mm_position;
 //! Home positions saved if offsets are needed for limit switches
// float mm_home_position;
 //! Max axis size to travel from origin 0,0
 float max_travel;
}STP;
extern STP STPS[NoOfAxis];


///////////////////////////////////////////
//         FUNCTION PROTOTYPES           //
///////////////////////////////////////////

//initialize the axis values
void SetInitialSizes(STP axis[6]);

//set the direction of axis
static void Set_Axisdirection(long temp,int axis);

//Move inline
void DualAxisStep(float axis_a,float axis_b,int axisA,int axisB,float speed);//,int xyza);
void SingleAxisStep(float newxyz,float speed,int axis_No);
static void SingleAxisStart(long dist,float speed,int axis_No);

//Circle move axis
void mc_arc(float *position, float *target, float *offset, int axis_0,
            int axis_1,int axis_linear, float feed_rate,char invert_feed_rate,
            float radius, char isclockwise);

float hypot(float angular_travel, float linear_travel);

//Directional values
int GetAxisDirection(long mm2move);


//homing cycle
void ResetHoming();
int Home(int axis);
static void Home_Axis(double distance,float speed,int axis);
static void Inv_Home_Axis(double distance,float speed,int axis);
void mc_dwell(float sec);
void mc_reset();



#endif