#include "Stepper.h"
#include "built_in.h"
/*#include "I2C_LCD.h"
#include "Config.h"*/


unsigned char txt1[] = "       ";
unsigned char AxisNo;
unsigned int Toggle;

//////////////////////////////////
//structs
 STP STPS[NoOfAxis];
 sVars SV;
 StepTmr STmr;
 
//////////////////////////////////
//define pin modes as symbolic text
//sfr bits
//bit PLS_Step_;sfr;

sbit EN_StepX at LATG0_bit;               //LATB13_bit;   LATD9_bit
sbit EN_Step_PinDirX at TRISG0_bit;       //TRISB13_bit;  TRISD9
//sbit RST_StepX at LATA10_bit;
//sbit RST_Step_PinDirX at TRISA10_bit;
//sbit SLP_FLT_StepX at LATB15_bit;         //LATD9_bit;
//sbit SLP_FLT_Step_PinDirX at TRISB15_bit; //TRISD9_bit;
sbit PLS_StepX at LATF1_bit;                //LATB14_bit;
sbit PLS_Step_PinDirX at TRISF1_bit;
sbit DIR_StepX at LATG1_bit;               //LATB13_bit;
sbit DIR_Step_PinDirX at TRISG1_bit;

sbit EN_StepY at LATF0_bit;
sbit EN_Step_PinDirY at TRISF0_bit;
//sbit RST_StepX at LATA10_bit;
//sbit RST_Step_PinDirX at TRISA10_bit;
//sbit SLP_FLT_StepY at LATB10_bit;
//sbit SLP_FLT_Step_PinDirY at TRISB10_bit;
sbit PLS_StepY at LATD4_bit;
sbit PLS_Step_PinDirY at TRISD4_bit;
sbit DIR_StepY at LATD5_bit;
sbit DIR_Step_PinDirY at TRISD5_bit;

sbit EN_StepZ at LATG14_bit;
sbit EN_Step_PinDirZ at TRISG14_bit;
//sbit RST_StepX at LATA10_bit;
//sbit RST_Step_PinDirX at TRISA10_bit;
//sbit SLP_FLT_StepY at LATB10_bit;
//sbit SLP_FLT_Step_PinDirY at TRISB10_bit;
sbit PLS_StepZ at LATE3_bit;
sbit PLS_Step_PinDirZ at TRISE3_bit;
sbit DIR_StepZ at LATG12_bit;
sbit DIR_Step_PinDirZ at TRISG12_bit;

//////////////////////////////////
//Set up pin outs
void SetPinMode(){
  AxisNo =
//Xaxis
  EN_Step_PinDirX  = 0; //output
//  RST_Step_PinDirX = 0;
//  SLP_FLT_Step_PinDirX = 0;
  PLS_Step_PinDirX = 0;
  DIR_Step_PinDirX = 0;
//Yaxis
  EN_Step_PinDirY  = 0; //output
//  RST_Step_PinDirY = 0;
//  SLP_FLT_Step_PinDirY = 0;
  PLS_Step_PinDirY = 0;
  DIR_Step_PinDirY = 0;
//zaxis
  EN_Step_PinDirZ  = 0; //output
//  RST_Step_PinDirZ = 0;
//  SLP_FLT_Step_PinDirZ = 0;
  PLS_Step_PinDirZ = 0;
  DIR_Step_PinDirZ = 0;
  
}

/////////////////////////////////
//Setup constants
void StepperConstants(long accel,long decel){
    SV.acc = accel;
    SV.dec = decel;
}

/////////////////////////////////
//Enable Steppers
void EnStepperX(){
//  SLP_FLT_StepX = 1;
//  RST_StepX     = 1;
   EN_StepX       = 0;
}

void EnStepperY(){
//  SLP_FLT_StepY = 1;
//  RST_StepY     = 1;
   EN_StepY       = 0;
}
void EnStepperZ(){
//  SLP_FLT_StepZ = 1;
//  RST_StepZ     = 1;
   EN_StepZ       = 0;
}

void DisableStepper(){
   EN_Stepx      = 1;
   EN_StepY      = 1;
   EN_StepZ      = 1;
}


//speedRampData STPS;

/*! \brief Move the stepper motor a given number of steps.
 *
 *  Makes the stepper motor move the given number of steps.
 *  It accelrate with given accelration up to maximum speed and decelerate
 *  with given deceleration so it stops at the given step.
 *  If accel/decel is to small and steps to move is to few, speed might not
 *  reach the max speed limit before deceleration starts.
 *
 *  \param step  Number of steps to move (pos - CW, neg - CCW).
 *  \param accel  Accelration to use, in 0.01*rad/sec^2.
 *  \param decel  Decelration to use, in 0.01*rad/sec^2.
 *  \param speed  Max speed, in 0.01*rad/sec.
 */
void speed_cntr_Move(signed long mmSteps, signed long speed, int axis_No){
int ii;
  // If moving only 1 step.
  if(mmSteps == 1){

    STPS[axis_No].accel_count = -1;        // Move one step...
    STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
    STPS[axis_No].step_delay = 20000;      // Just a short delay so main() can act on 'running'.
    SV.running = 1;                        // start running

  }
  // Only move if number of steps to move is not zero.
  else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
  
    // Set max speed limit, by calc min_delay to use in timer.
    // min_delay = (alpha / tt)/ w
    STPS[axis_No].min_delay =  A_T_x100 / speed;
    
    // Set accelration by calc the first (c0) step delay .
    // step_delay = 1/tt * sqrt(2*alpha/accel)
    // step_delay = ( tfreq*0.676/100 )*100 * sqrt( (2*alpha*10000000000) / (accel*100) )/10000
    STPS[axis_No].step_delay = abs((T1_FREQ_148 * sqrt_(A_SQ / SV.acc))/100);
    STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;

/*if(8000 < STPS[axis_No].StartUp_delay)STPS[axis_No].StartUp_delay = 2000;*/
    
    // Find out after how many steps does the speed hits the max speed limit.
    STPS[axis_No].max_step_lim = (speed*speed)/(long)(2.0*ALPHA*(double)SV.acc*100.0);
    
    //STPS.max_s_lim = (long)speed*speed/(long)(((long)A_x20000*accel)/100);
    // If we hit max speed limit before 0,5 step it will round to 0.
    // But in practice we need to move atleast 1 step to get any speed at all.
    if(STPS[axis_No].max_step_lim == 0){
      STPS[axis_No].max_step_lim = 1;
    }
    
    // Find out after how many Steps before we must start deceleration.
    // n1 = (n1+n2)decel / (accel + decel) which is 50%
    STPS[axis_No].accel_lim = (abs(mmSteps) * SV.dec) / (SV.acc + SV.dec);
    
    // We must accelrate at least 1 step before we can start deceleration.
    if(STPS[axis_No].accel_lim == 0){
       STPS[axis_No].accel_lim = 1;
    }

    // Use the limit we hit first to calc decel.
    if(STPS[axis_No].accel_lim <= STPS[axis_No].max_step_lim){
         if(mmSteps >= 0)STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps; //needs to be -ve
         else STPS[axis_No].decel_val = mmSteps + STPS[axis_No].accel_lim;
    }else{
         STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim * SV.acc) / SV.dec);
    }
    // Find step to start decleration.
    if(mmSteps >= 0){
        if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
        else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
    }
    else {
        if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = abs(mmSteps) * STPS[axis_No].decel_val;
        else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
    }
    // We must decelrate at least 1 step to stop.
    if(STPS[axis_No].decel_val == 0){
      STPS[axis_No].decel_val = -1;
    }

    // If the maximum speed is so low that we dont need to go via accelration state.
    if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
      STPS[axis_No].step_delay = STPS[axis_No].min_delay;
      STPS[axis_No].run_state = RUN;
    }else{
       STPS[axis_No].step_delay = abs(STPS[axis_No].StartUp_delay);
       STPS[axis_No].run_state = ACCEL;
    }

  }
      STPS[axis_No].step_count  = 0;
      STPS[axis_No].rest        = 0;
      STPS[axis_No].microSec    = 0;
      STPS[axis_No].accel_count = 1;

      SV.Tog   = 0;
/*SV.px    = 0;
      SV.py    = 0;
      SV.pz    = 0;*/
      SV.running = 1;
}

//////////////////////////////////
//interrupt cycles
void CycleStop(){
int ii;
   STmr.uSec = 0;
   for(ii = 0;ii<NoOfAxis;ii++){
    STPS[ii].microSec = 0;
    if(ii > NoOfAxis)break;
   }
}

void CycleStart(){
int ii;

  if(SV.Tog == 0){
   for(ii = 0; ii < NoOfAxis;ii++){
     if(ii > NoOfAxis)break;
     STPS[ii].microSec++;
   }
  }
}
/*****************************************************
*single axix step rate need to be doubled to compensate
*speed increase due to no 2nd axis interpolation
*use a dummy axis or increase the speed
*****************************************************/
void SingleAxisStep(long newxyz,int axis_No){
int dir;
static long dist;
       /*if(SV.psingle != newxyz)
          SV.psingle = newxyz;
       else*/
       
     switch(axis_No){
       case 0:OC5IE_bit = 1;OC5CONbits.ON = 1;
              OC3IE_bit = 0;OC3CONbits.ON = 0;
              OC8IE_bit = 0;OC8CONbits.ON = 0;
              break;
       case 1:OC5IE_bit = 0;OC5CONbits.ON = 0;
              OC3IE_bit = 1;OC3CONbits.ON = 1;
              OC8IE_bit = 0;OC8CONbits.ON = 0;
              break;
       case 2:OC5IE_bit = 0;OC5CONbits.ON = 0;
              OC3IE_bit = 0;OC3CONbits.ON = 0;
              OC8IE_bit = 1;OC8CONbits.ON = 1;
              break;
       default: break;
     }
     SV.psingle  = 0;
     dist = newxyz - SV.psingle;
     dist = abs(dist);
     
     if(newxyz < 0)
           dir = CCW;
     else
           dir = CW;

         switch(axis_No){
           case X:
                DIR_StepX = dir;
                break;
           case Y:
                DIR_StepY = dir;
                break;
           case Z:
                DIR_StepZ = dir;
                break;
           default: break;
         }
                if(SV.Tog == 0){
                  for(STPS[axis_No].step_count = 0;STPS[axis_No].step_count < dist; ++STPS[axis_No].step_count){
                    STmr.compOCxRunning = 0;
                    toggleOCx(axis_No);
                    Pulse(axis_No);
                    //wait for next time delay try modified to prevent blocking
                    while(STmr.compOCxRunning == 0);
                  }
                }
                
        disableOCx();
}

void DualAxisStep(long newx,long newy,int axis_combo){
 long i;
 static long d2;
   SV.over=0;
   d2 = 0;
   //will need to change these 3 lines when implimenting position referenc??
   SV.px = 0;
   SV.py = 0;
   SV.pz = 0;
/*!
 *use Bressenhams algorithm here
 */

  switch(axis_combo){
    case xy:
              OC5IE_bit = 1;OC5CONbits.ON = 1;
              OC3IE_bit = 1;OC3CONbits.ON = 1;
              OC8IE_bit = 0;OC8CONbits.ON = 0;
          SV.dx   = newx - SV.px;           // distance to move (delta)
          SV.dy   = newy - SV.py;
          // direction to move
          SV.dirx = SV.dx > 0?1:-1;
          SV.diry = SV.dy > 0?1:-1;
            // Set direction from sign on step value.
          if(SV.dirx < 0)DIR_StepX = CCW;
          else DIR_StepX = CW;
          if(SV.diry < 0) DIR_StepY = CCW;
          else DIR_StepY = CW;
          SV.dx = abs(SV.dx);
          SV.dy = abs(SV.dy);
          
         if(SV.dx > SV.dy) d2 = 2*(SV.dy - SV.dx);
         else d2 = 2* (SV.dx - SV.dy);
         if(SV.Tog == 0){  //? round this start up bit
             LATE7_bit = 1;
             if(SV.dx > SV.dy){
                for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count){
                    STmr.compOCxRunning = 0;
                    toggleOCx(X);
                    Pulse(X);
                    if(d2 < 0)d2 += 2*SV.dy;
                    else{
                      d2 += 2 * (SV.dy - SV.dx);
                      toggleOCx(Y);
                      Pulse(Y);
                    }
                   //wait for next time delay try modified to prevent blocking
                    while(STmr.compOCxRunning == 0);
                }
            }else{
                for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count){
                   STmr.compOCxRunning = 0;
                   toggleOCx(Y);
                   Pulse(Y);
                   if(d2 < 0)d2 += 2 * SV.dx;
                   else{
                       d2 += 2 * (SV.dx - SV.dy);
                       toggleOCx(X);
                       Pulse(X);
                   }
                   //wait for next time delay try modified to prevent blocking
                    while(STmr.compOCxRunning == 0);
                }
            }
         }
         break;
    case xz:
              OC5IE_bit = 1;OC5CONbits.ON = 1;
              OC3IE_bit = 0;OC3CONbits.ON = 0;
              OC8IE_bit = 1;OC8CONbits.ON = 1;
          SV.dx   = newx - SV.px;           // distance to move (delta)
          SV.dz   = newy - SV.pz;
          // direction to move
          SV.dirx = SV.dx > 0?1:-1;
          SV.dirz = SV.dz > 0?1:-1;
          // Set direction from sign on step value.
          if(SV.dirx < 0)DIR_StepX = CCW;
          else DIR_StepX = CW;
          if(SV.dirz < 0) DIR_StepZ = CCW;
          else DIR_StepZ = CW;
          SV.dx = abs(SV.dx);
          SV.dz = abs(SV.dz);
          
        if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
        else d2 = 2* (SV.dx - SV.dz);
        if(SV.Tog == 0){  //? round this start up bit
            LATE7_bit = 1;
            if(SV.dx > SV.dz){
                for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count){
                    STmr.compOCxRunning = 0;
                    toggleOCx(X);
                    Pulse(X);
                    if(d2 < 0)d2 += 2*SV.dz;
                    else{
                      d2 += 2 * (SV.dz - SV.dx);
                      toggleOCx(Z);
                      Pulse(Z);
                    }
                   //wait for next time delay
                    while(STmr.compOCxRunning == 0);
                }
            }else{
                for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dz; ++STPS[Z].step_count){
                   STmr.compOCxRunning = 0;
                   toggleOCx(Z);
                   Pulse(Z);
                   if(d2 < 0)d2 += 2 * SV.dx;
                   else{
                       d2 += 2 * (SV.dx - SV.dz);
                       toggleOCx(X);
                       Pulse(X);
                   }
                   //wait for next time delay
                    while(STmr.compOCxRunning == 0);
                }
             }
        }
         break;
    case yz:
              OC5IE_bit = 0;OC5CONbits.ON = 0;
              OC3IE_bit = 1;OC3CONbits.ON = 1;
              OC8IE_bit = 1;OC8CONbits.ON = 1;
          SV.dy   = newx - SV.pz;           // distance to move (delta)
          SV.dz   = newy - SV.py;
          // direction to move
          SV.diry = SV.dy > 0?1:-1;
          SV.dirz = SV.dz > 0?1:-1;
          // Set direction from sign on step value.
          if(SV.diry < 0)DIR_StepY = CCW;
          else DIR_StepY = CW;
          if(SV.dirz < 0) DIR_StepZ = CCW;
          else DIR_StepZ = CW;
          SV.dy = abs(SV.dy);
          SV.dz = abs(SV.dz);
          
         if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
         else d2 = 2* (SV.dy - SV.dz);
         if(SV.Tog == 0){  //? round this start up bit
              LATE7_bit = 1;
              if(SV.dy > SV.dz){
                  for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count){
                      STmr.compOCxRunning = 0;
                      toggleOCx(Y);
                      Pulse(Y);
                      if(d2 < 0)d2 += 2*SV.dz;
                      else{
                        d2 += 2 * (SV.dz - SV.dy);
                        toggleOCx(Z);
                        Pulse(Z);
                      }
                     //wait for next time delay
                      while(STmr.compOCxRunning == 0);
                  }
              }else{
                  for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dz; ++STPS[Z].step_count){
                     STmr.compOCxRunning = 0;
                     toggleOCx(Z);
                     Pulse(Z);
                     if(d2 < 0)d2 += 2 * SV.dy;
                     else{
                         d2 += 2 * (SV.dy - SV.dz);
                         toggleOCx(Y);
                         Pulse(Y);
                     }
                     //wait for next time delay
                      while(STmr.compOCxRunning == 0);
                  }
               }
         }
         
         break;
    default: break;

  }
  

  
  disableOCx();

/*!
 * update the logical position. We don't just = newx because
 * px + dx * dirx == newx could be false by a tiny margin and we don't want rounding errors.
 */
  /*SV.px += SV.dx * SV.dirx;
    SV.py += SV.dy * SV.diry;*/
}

/////////////////////////////////////////////////
//Circular Interpolation
void CalcRadius(Circle* cir){
 float xRad,yRad,X,Y,angA,angB;

   cir->xRad = fabs(cir->xStart + cir->I);
   cir->yRad = fabs(cir->yStart + cir->J);
   cir->radius = sqrt((cir->xRad*cir->xRad) + (cir->yRad*cir->yRad));
   angA = atan2(cir->yRad,cir->xRad);
   
   
   cir->degreeDeg = angA * rad2deg;
   
   cir->quadrant_start = QuadrantStart(cir->I,cir->J);
    //deg is 360 or 0 and subtract the actual from deg
   if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
       angB = cir->deg - cir->degreeDeg;
   if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
       angB = cir->deg + cir->degreeDeg;
       
   cir->degreeRadians = angB * deg2rad;
}

int QuadrantStart(float i,float j){
    if((i <= 0)&&(j >= 0))
          return 1;
    else if((i > 0)&&(j > 0))
         return 2;
    else if((i > 0)&&(j < 0))
         return 3;
    else if((i < 0)&&(j < 0))
         return 4;
    else
        return 0;
}

void CircDir(Circle* cir){
float newDeg;
   if(cir->dir == CW){
        newDeg = 360 / cir->deg;
        cir->N = (2*Pi*cir->radius)/newDeg;
        cir->divisor = cir->deg / newDeg;
   }

   if(cir->dir == CW)
       cir->deg = 0.00;
   if(cir->dir == CCW)
       cir->deg = 360.00;
}

void Cir_Interpolation(float xPresent,float yPresent,Circle* cir){
static int quad = 1;
      cir->xStart = xPresent;
      cir->yStart = yPresent;
      CalcRadius(cir);
    //  quad = QuadrantStart(cir);
    
    while(quad){
       break;//!!!
       if(quad == 1 || quad == 4){
         cir->xFin = cir->xRad + (cir->radius * cos(cir->degreeRadians));
         cir->yFin = cir->yRad + (cir->radius * sin(cir->degreeRadians));
       }
       if(quad == 2 || quad == 3){
         cir->xFin = cir->xRad - (cir->radius * cos(cir->degreeRadians));
        // cir->yFin = cir>-yRad - (cir->radius * sin(cir->degreeRadians));
       }
       
     }
}

//////////////////////////////////////////////////
//toggle the OCxCON regs
void toggleOCx(int axis_No){
      switch(axis_No){
        case 0: OC5R   = 0x5;
                OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
                TMR2   =  0xFFFF;
                OC5CON =  0x8004; //restart the output compare module
             break;
        case 1: OC3R   = 0x5;
                OC3RS  = STPS[Y].step_delay & 0xFFFF;
                TMR4   =  0xFFFF;
                OC3CON =  0x8004; //restart the output compare module
             break;
        case 2: OC8R   = 0x5;
                OC8RS  = STPS[Z].step_delay & 0xFFFF;
                TMR6   =  0xFFFF;
                OC8CON =  0x8004; //restart the output compare module
             break;
        default:
             break;
      }

}


void disableOCx(){
     OC5IE_bit = 0;OC5CONbits.ON = 0;
     OC3IE_bit = 0;OC3CONbits.ON = 0;
     OC8IE_bit = 0;OC8CONbits.ON = 0;
}
//////////////////////////////////////////////////
//reset the pulse
int Pulse(int axis_No){

    if(!STPS[axis_No].PLS_Step_ ){
      STPS[axis_No].PLS_Step_   = 1;
    }
    
    switch(STPS[axis_No].run_state) {
      case STOP:
           LATE7_bit = 0;
           T8IE_bit         = 0;
           SV.Tog = 1;
        break;

      case ACCEL:
        AccDec(axis_No);
        /*
        * Chech if we should start decelration.
        * Check if we hit max speed.
        */
        if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
        //  STPS.last_accel_delay = STPS.new_step_delay;
             STPS[axis_No].step_delay = STPS[axis_No].min_delay;
             STPS[axis_No].run_state  = RUN;
        }
        if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
             STPS[axis_No].run_state  = RUN;
        }
        if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
          STPS[axis_No].accel_count = STPS[axis_No].decel_val;
          STPS[axis_No].rest        = 0;
          STPS[axis_No].run_state   = DECEL;
        }
        break;

      case RUN:
        STPS[axis_No].step_delay = STPS[axis_No].min_delay;
        // Chech if we should start decelration.
        if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
             STPS[axis_No].accel_count = STPS[axis_No].decel_val;
             STPS[axis_No].rest        = 0;
        // Start decelration with same delay as accel ended with.
             STPS[axis_No].run_state   =  DECEL;
        }
        break;

      case DECEL:
        // else STPS[axis_No].new_step_delay = STPS[axis_No].StartUp_delay;
        // Check if we at last step
        AccDec(axis_No);
        if(STPS[axis_No].accel_count >= -2 ){
         STPS[axis_No].run_state = STOP;
        }
        break;
      default:break;
    }
  return axis_No;
}

void AccDec(int axis_No){
          STPS[axis_No].accel_count++;
          STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
          STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
          STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;

}

/*!  
 *    brief Square root routine.
 *    sqrt routine, from comp.sys.ibm.pc.programmer
 *    Subject: Summary: SQRT(int) algorithm (with profiling)
 *    From: warwick@cs.uq.oz.au (Warwick Allison)
 *    Date: Tue Oct 8 09:16:35 1991
 *    param x  Value to find square root of.
 *    return  Square root of x.
 */
static unsigned long sqrt_(unsigned long x){

  register unsigned long xr;  // result register
  register unsigned long q2;  // scan-bit register
  register unsigned char f;   // flag (one bit)

  xr = 0;                     // clear result
  q2 = 0x40000000L;           // higest possible result bit
  do
  {
    if((xr + q2) <= x)
    {
      x -= xr + q2;
      f = 1;                  // set flag
    }
    else{
      f = 0;                  // clear flag
    }
    xr >>= 1;
    if(f){
      xr += q2;               // test flag
    }
  } while(q2 >>= 2);          // shift twice
  if(xr < x){
    return xr +1;             // add for rounding
  }
  else{
    return xr;
  }
}

/*!
 *  brief Find minimum value.
 *  Returns the smallest value.
 *  return  Min(x,y).
 */
unsigned int min_(unsigned int x, unsigned int y)
{
  if(x < y){
    return x;
  }
  else{
    return y;
  }
}

//////////////////////////////////////////////////////////////
//output compare 3 pin RF1 interrupt
void StepX() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_AUTO {

     STmr.compOCxRunning = 1;
     TMR4 =  0xFFFF;
     OC3IF_bit = 0;
   //  OC3CON    =  0x8004; //restart the output compare module
}
void StepY() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_AUTO {

     STmr.compOCxRunning = 2;
     TMR2 =  0xFFFF;
     OC5IF_bit = 0;
    // OC5CON    =  0x8004; //restart the output compare module
}
void StepZ() iv IVT_OUTPUT_COMPARE_8 ilevel 3 ics ICS_AUTO {

     STmr.compOCxRunning = 3;
     TMR6 =  0xFFFF;
     OC8IF_bit = 0;
    // OC8CON    =  0x8004; //restart the output compare module
}





///////////////////////////////////////////////////////////////////////////////
//TEST CODE
 /*if(OC3RS > 2000)OC3RS -= 100;
     else{
         OC3RS -= 1;
         if(OC3RS < 350)OC3RS = 350;
     }*/


/*if(OC6RS > 2000)OC6RS -= 100;
     else{
         OC6RS -= 1;
         if(OC6RS < 350)OC6RS = 350;
     }*/