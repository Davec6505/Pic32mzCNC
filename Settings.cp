#line 1 "C:/Users/Git/Pic32mzCNC/Settings.c"
#line 1 "c:/users/git/pic32mzcnc/settings.h"
#line 130 "c:/users/git/pic32mzcnc/settings.h"
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
#line 3 "C:/Users/Git/Pic32mzCNC/Settings.c"
settings_t settings;


void Settings_Init(char reset_all){
 if(reset_all){
 settings.steps_per_mm[ 0 ] =  250.0 ;
 settings.steps_per_mm[ 1 ] =  250.0 ;
 settings.steps_per_mm[ 2 ] =  250.0 ;
 settings.steps_per_mm[ 3 ] =  250.0 ;
 settings.mm_per_arc_segment =  0.1 ;
 settings.default_feed_rate =  250.0 ;
 settings.default_seek_rate =  500.0 ;
 settings.acceleration =  (10.0*60*60) ;
 settings.junction_deviation =  0.05 ;
 settings.homing_feed_rate =  25.0 ;
 settings.homing_seek_rate =  250.0  ;
 settings.homing_debounce_delay =  100 ;
 settings.homing_pulloff =  1.0 ;
 settings.stepper_idle_lock_time =  25 ;
 settings.decimal_places =  3 ;
 settings.n_arc_correction =  25 ;
 }
}
