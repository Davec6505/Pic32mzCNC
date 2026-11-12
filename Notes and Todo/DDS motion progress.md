# DDS motion experiment

## Purpose

The MikroC project is a learning project for redesigning motion in small,
understandable steps. Pic32mzCNC_V3 with XC32 remains the go-to CNC solution
and a reference for desired behaviour. This work is on the `dds-motion`
branch.

## Current checkpoint

- The old step-generation output-compare mappings and interrupt-driven motion
  code are being removed. Spindle PWM is deferred; OC8 is currently reserved
  in the configuration, but its setup is not yet a completed spindle PWM.
- Timer8 is initialized from `Config.c`; its interrupt is enabled. Its ISR
  in `Timers.c` runs the first single-axis DDS experiment.
- With a nominal 200 MHz system clock, PBCLK3 divided by four and a 1:1 timer
  prescaler, Timer8 has a 50 MHz input. `PR8 = 500` gives 501 counts, or
  approximately 10.02 microseconds per tick. `PR8 = 499` would give 500
  counts, or 10 microseconds, under those clock assumptions.
- The experiment uses an unsigned 32-bit `phase_x` accumulator and adds
  `incrament_x` on each timer interrupt. Wraparound is detected by comparing
  the new phase with its previous value:

  ```c
  old_phase = phase_x;
  phase_x += incrament_x;
  if (phase_x < old_phase) {
    LED2 = !LED2;
  }
  ```

- The user observed a faint flicker at `incrament_x = 42949637`, and verified
  a visible change of LED state approximately once per second with `42950`.
  This is a visual check, not an instrumented frequency measurement. The
  current experiment toggles LED2; it does not generate motor STEP pulses.

## DDS concepts learned

The timer tick remains fixed. A larger increment reaches unsigned wraparound
in fewer ticks, producing a higher event rate. A smaller increment takes more
ticks and produces a lower rate.

For a 32-bit accumulator, the approximate average relationship is:

```text
event rate = timer tick rate * increment / 2^32
increment  = desired event rate * 2^32 / timer tick rate
```

Each overflow toggles the LED, so one complete on/off cycle takes two
overflows. At a nominal 100 kHz tick, an increment of about 42950 gives about
one overflow per second, while 42949673 gives about 1000 per second.

Do not reset the phase after each overflow: unsigned wraparound retains the
remainder and therefore preserves the intended average rate. Phase may be
initialized once at the start of a test for a predictable initial state.

## Next steps

1. Verify the timer tick and event rate with a scope or logic analyser if
   available.
2. Design a single-axis STEP pulse with explicit high and low times. A DDS
   overflow schedules a step; toggling a pin on each overflow alone is not a
   complete STEP pulse.
3. Keep the driver disabled or disconnected while checking the signal. Check
   the driver's STEP pulse width and direction setup/hold requirements before
   connecting it. Ensure the STEP output starts low.
4. Add exact step counts and stopping before exploring coordinated axes and
   acceleration.

The old motion path has not yet been replaced by DDS. Do not treat this
checkpoint as a working CNC controller; spindle control and motion safety
remain to be developed and verified.
