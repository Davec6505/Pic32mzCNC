#ifndef PRINT_H
#define PRINT_H

// Define Grbl status codes.
#define STATUS_OK 0
#define STATUS_BAD_NUMBER_FORMAT 1
#define STATUS_EXPECTED_COMMAND_LETTER 2
#define STATUS_UNSUPPORTED_STATEMENT 3
#define STATUS_ARC_RADIUS_ERROR 4
#define STATUS_MODAL_GROUP_VIOLATION 5
#define STATUS_INVALID_STATEMENT 6
#define STATUS_SETTING_DISABLED 7
#define STATUS_SETTING_VALUE_NEG 8
#define STATUS_SETTING_STEP_PULSE_MIN 9
#define STATUS_SETTING_READ_FAIL 10
#define STATUS_IDLE_ERROR 11
#define STATUS_ALARM_LOCK 12

// Define Grbl alarm codes. Less than zero to distinguish alarm error from status error.
#define ALARM_HARD_LIMIT -1
#define ALARM_ABORT_CYCLE -2

// Define Grbl feedback message codes.
#define MESSAGE_CRITICAL_EVENT 1
#define MESSAGE_ALARM_LOCK 2
#define MESSAGE_ALARM_UNLOCK 3
#define MESSAGE_ENABLED 4
#define MESSAGE_DISABLED 5


//Prints status msg
void report_status_message(int status_code);
// Prints alarm messages.
void report_alarm_message(int alarm_code);
//Feed back messages
void report_feedback_message(int message_code);
// Welcome message
void report_init_message();
//Report the start up lines
void report_startup_line(int n, char *line);
// Grbl help message
void report_grbl_help();
// Grbl global settings print out.
// NOTE: The numbering scheme here must correlate to storing in settings.c
void report_grbl_settings();

void report_gcode_parameters();
// Print current gcode parser mode state
void report_gcode_modes();
// Executes user startup script, if stored.
void protocol_execute_startup();
// Report realtime status
void report_realtime_status();

#endif