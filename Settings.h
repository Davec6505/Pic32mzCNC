#ifndef SETTINGS_H
#define SETTINGS_H

////////////////////////////////////////////////////////////
//                  Global usage defines                  //
////////////////////////////////////////////////////////////

#define true 1
#define TRUE 1
#define false 0
#define FALSE 0

////////////////////////////////////////////////////////////
//              Stepper Motor Settings                    //
////////////////////////////////////////////////////////////
#define  NoOfAxis   6
//! Number of (full)steps per round on stepper motor in use.
#define SPR 188               // 200 Steps per rev
#define M_STEP 32               //Stepper drive micro steps setting


//! Belt driven systems
#define PULLEY_TOOTH_COUNT 20  //belt pully tooth count
#define BELT_PITCH 2           // Belt tooth pitch

//////////////////////////////////////////////////////////
//uncomment USE_LEADSCREW_PITCH if using N instead of pitch
#define USE_LEADSCREW_PITCH
//! Lead screw driven systems
#define N 1                    // Screw pitch tpmm
#define LEADSCREW_PITCH 1      //leadscrewm pitch

/////////////////////////////////////////////////////////
//Set the Limit Debounce  counter max count
#define X_DEBOUNCE_COUNT 1
#define Y_DEBOUNCE_COUNT 1
#define Z_DEBOUNCE_COUNT 3
#define A_DEBOUNCE_COUNT 3

///////////////////////////////////////////////////////
//Debounce timer counter base pulse uncomment the base
//value required may be usefull if using a cheap limit
// this is only a reset time base, the setting of the
//limits is instantaneous with interrupts
//#define _ms10_
#define _ms100_
//#define _ms300_
//#define _ms500_
//#define _sec1_

///////////////////////////////////////////////////////////
//            SET THE  PLATFORM DIMENSIONS               //
///////////////////////////////////////////////////////////

#define X_MAX_SIZE 290.00
#define Y_MAX_SIZE 290.00
#define Z_MAX_SIZE 100.00
#define A_MAX_SIZE 100.00
#define B_MAX_SIZE 100.00
#define C_MAX_SIZE 100.00

#define SIZE_LIST (double[]){X_MAX_SIZE, Y_MAX_SIZE, Z_MAX_SIZE, A_MAX_SIZE, B_MAX_SIZE, C_MAX_SIZE}

#endif