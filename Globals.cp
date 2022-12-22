#line 1 "C:/Users/Git/Pic32mzCNC/Globals.c"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 92 "c:/users/git/pic32mzcnc/settings.h"
typedef struct {
 float steps_per_mm[3];
 char microsteps;
 char pulse_microseconds;
 float default_feed_rate;
 float default_seek_rate;
 char invert_mask;
 float mm_per_arc_segment;
 float acceleration;
 float junction_deviation;
 char flags;
 char homing_dir_mask;
 float homing_feed_rate;
 float homing_seek_rate;
 unsigned int homing_debounce_delay;
 float homing_pulloff;
 char stepper_idle_lock_time;
 char decimal_places;
 char n_arc_correction;

} settings_t;
extern settings_t settings;




void Settings_Init();
#line 60 "c:/users/git/pic32mzcnc/globals.h"
typedef struct {
 char abort;
 char state;
 int homing;
 int homing_cnt;
 char auto_start;
 volatile char execute;
} system_t;
extern system_t sys;
#line 3 "C:/Users/Git/Pic32mzCNC/Globals.c"
char txtL[9];
system_t sys;
