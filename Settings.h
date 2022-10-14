#ifndef SETTINGS_H
#define SETTINGS_H


////////////////////////////////////////////////////////////
//              Stepper Motor Settings                    //
////////////////////////////////////////////////////////////
#define  NoOfAxis   6
//! Number of (full)steps per round on stepper motor in use.
#define SPR 200                // 200 Steps per rev
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










#endif