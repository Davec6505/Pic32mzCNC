#include "Nuts_Bolts.h"


#define MAX_INT_DIGITS 8 // Maximum number of digits in int32 (and float)


// Extracts a floating point value from a string. The following code is based loosely on
// the avr-libc strtod() function by Michael Stumpf and Dmitry Xmelkov and many freely
// available conversion method examples, but has been highly optimized for Grbl. For known
// CNC applications, the typical decimal value is expected to be in the range of E0 to E-4.
// Scientific notation is officially not supported by g-code, and the 'E' character may
// be a g-code word on some CNC systems. So, 'E' notation will not be recognized.
// NOTE: Thanks to Radu-Eosif Mihailescu for identifying the issues with using strtod().
int read_float(char *line, uint8_t *char_counter, float *float_ptr)
{
  bit isnegative,isdecimal;
  char *ptr = line + *char_counter;
  unsigned char c;
  // Extract number into fast integer. Track decimal in terms of exponent value.
  long intval = 0;
  short exp = 0;
  char ndigit = 0;
  float fval;
  
  isnegative = isdecimal = false;
  
  // Grab first character and increment pointer. No spaces assumed in line.
  c = *ptr++;

  // Capture initial positive/minus character
  isnegative = false;
  if (c == '-') {
    isnegative = true;
    c = *ptr++;
  } else if (c == '+') {
    c = *ptr++;
  }


  while(1) {
    c -= '0';
    if (c <= 9) {
      ndigit++;
      if (ndigit <= MAX_INT_DIGITS) {
        if (isdecimal) { exp--; }
        intval = (((intval << 2) + intval) << 1) + c; // intval*10 + c
      } else {
        if (!(isdecimal)) { exp++; }  // Drop overflow digits
      }
    } else if (c == (('.'-'0') & 0xff)  &&  !(isdecimal)) {
      isdecimal = true;
    } else {
      break;
    }
    c = *ptr++;
  }

  // Return if no digits have been read.
  if (!ndigit) { return(false); };

  // Convert integer into floating point.

  fval = (float)intval;

  // Apply decimal. Should perform no more than two floating point multiplications for the
  // expected range of E0 to E-4.
  if (fval != 0) {
    while (exp <= -2) {
      fval *= 0.01;
      exp += 2;
    }
    if (exp < 0) {
      fval *= 0.1;
    } else if (exp > 0) {
      do {
        fval *= 10.0;
      } while (--exp > 0);
    }
  }

  // Assign floating point value with correct sign.
  if (isnegative) {
    *float_ptr = -fval;
  } else {
    *float_ptr = fval;
  }

  *char_counter = ptr - line - 1; // Set char_counter to next statement

  return(true);
}

// Convert a floating point to a unsigned long for flash write
unsigned long flt2ulong(float f_){
unsigned long ul_ = 0;
  memcpy(&ul_,&f_,sizeof(float));

  return ul_;
}

//Convert a unsigned long back to a floating point from flash memory
float ulong2flt(unsigned long ul_){
float f_ = 0.0;
 memcpy(&f_,&ul_,sizeof(unsigned long ));
 
return f_;
}

//return the int val rounfed off to the nearest int
int round(double val){
double temp = 0.00,tempC = 0.00,tempF = 0.00,dec = 0.00;
  tempC = ceil(val);
  tempF = floor(val);
  dec = val - tempF;
  temp = (dec > 0.5)? tempC : tempF;
  return (int)temp;
}

