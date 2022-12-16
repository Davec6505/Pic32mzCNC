#line 1 "C:/Users/Git/Pic32mzCNC/Globals.c"
#line 1 "c:/users/git/pic32mzcnc/globals.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
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
#line 50 "c:/users/git/pic32mzcnc/globals.h"
typedef struct {
 uint8_t abort;
 uint8_t state;
 int homing;
 int homing_cnt;
 uint8_t auto_start;
 volatile uint8_t execute;
} system_t;
extern system_t sys;
#line 3 "C:/Users/Git/Pic32mzCNC/Globals.c"
char txtL[9];
system_t sys;
