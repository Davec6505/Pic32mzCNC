#include "Globals.h"

char txtL[9];
system_t sys;
sVars SV;



int GetAxisDirection(long mm2move){
 return(mm2move < 0)? CCW_:CW_;
}