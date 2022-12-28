#line 1 "C:/Users/Git/Pic32mzCNC/Globals.c"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 123 "c:/users/git/pic32mzcnc/settings.h"
typedef struct {
 unsigned long p_msec;
 float steps_per_mm[ 6 ];
 float default_feed_rate;
 float default_seek_rate;
 float homing_feed_rate;
 float homing_seek_rate;
 float homing_pulloff;
 float mm_per_arc_segment;
 float acceleration;
 float junction_deviation;
 unsigned int homing_debounce_delay;
 char flags;
 char homing_dir_mask;
 char stepper_idle_lock_time;
 char decimal_places;
 char n_arc_correction;
 char microsteps;
 char pulse_microseconds;
 char invert_mask;

} settings_t;
extern settings_t settings;




void Settings_Init(char reset_all);
#line 70 "c:/users/git/pic32mzcnc/globals.h"
typedef struct {
 char abort;
 char state;
 int homing;
 int homing_cnt;
 char auto_start;
 volatile char execute;
} system_t;
extern system_t sys;
