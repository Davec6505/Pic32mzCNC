# Pic32mzCNC
This is a 4 axis interpolation / cnc control application using MikroC pro for Pic32mz2048efh, the basis of this code is taken from GRBL [thanks to Simen Svale Skogsrud]
only this implimentation has a slight twist in it, all axis are interpolatred using Output compare modules with individual timers.

The reason behind doing this is to have the flexability to run the axis for a given distance with time/speed rather than distance/speed, this will "HOPEFULLY" result in
better individual acceleration and deceleration control. 

The "MIPS" Mikroc implimentation initially led me down a slippery road whilst trying to port the grbl implimentation of gcode across, the optomizations on MikroC are
set to level4 with SSA enabled, I had to change many of the variable listing in the source file to have the volatile keyword, this was to stop the compiler from 
optomising them out, whilst porting the grbl code accross I  put a slight different spin on the implimentation, mostly due to a lack of gcode knowledge  of 
which I have gained in leaps and bounds, thanks to grbl and LinuxCNC. 

Flash memory is used inplace of EEPROM memory, as pic32mz has more than enough spare.

Key Features:
1) Serial DMA with ring buffer.
2) All axis impliment Output Compare module using individual timers.
3) Flash memory is used for retentative data.
