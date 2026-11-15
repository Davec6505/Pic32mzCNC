# DDS motion experiment

## Purpose

The MikroC project is a learning project for redesigning motion in small,
understandable steps. Pic32mzCNC_V3 with XC32 remains the go-to CNC solution
and a reference for desired behaviour. This work is on the `dds-motion`
branch.

## Earlier timer experiment

- The old step-generation output-compare mappings and interrupt-driven motion
  code are being removed. Spindle PWM is deferred; OC8 is currently reserved
  in the configuration, but its setup is not yet a completed spindle PWM.
- Timer8 is initialized from `Config.c` with its interrupt enabled but the
  timer stopped. Its ISR in `Timers.c` calls the callback registered by
  `SetPinMode()` in `Stepper.c`.
- With a nominal 200 MHz system clock, PBCLK3 divided by four and a 1:1 timer
  prescaler, Timer8 has a 50 MHz input. `PR8 = 500` gives 501 counts, or
  approximately 10.02 microseconds per tick. `PR8 = 499` would give 500
  counts, or 10 microseconds, under those clock assumptions.
- In the earlier experiment, the user observed a faint flicker at an increment
  of `42949637`, and a visible change of LED state approximately once per
  second with `42950`. This was a visual check, not an instrumented frequency
  measurement. That LED experiment has since been replaced by the STEP
  engine described below.

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

## Hardware checks

1. Verify the timer tick and event rate with a scope or logic analyser if
   available.
2. Keep the driver disabled or disconnected while checking the signal. Check
   the driver's STEP pulse width and direction setup/hold requirements before
   connecting it. Ensure the STEP output starts low.
3. Check step counts and coordinated motion, and measure worst-case ISR time.

## Interim engine (plumbed in, untested on hardware)

Steps 2 and 4 are now in `Stepper.c`. `dds_tick()` runs every 10 us in the
Timer8 interrupt:

- `dds_master` holds the single phase accumulator; per-axis state is in
  `STPS[]`, and per-follower Bresenham errors are in `eng_err[]`.
- It clears all STEP pins, so each pulse is high for one tick (10 us). The
  maximum rate is one step every two ticks, 50 kHz.
- It adds the master axis increment to the phase accumulator. On overflow it
  raises the master STEP pin and counts the step.
- It steps up to three follower axes with separate Bresenham errors (`eng_err`).
- It calls `Pulse()`, the Austin/AVR446 ramp, and converts the new
  `step_delay` into the next increment (`Dds_Increment`, integer only).
- When the master reaches its step count, it stops all moving axes.

`Start_Interpolation()` starts a move, `Stepper_Abort()` stops it at once
(reset or hard limit), and `Stepper_Busy()` reports a running move. The old
motion path now uses this engine. Homing stays disabled behind `HOMING_READY`
until it is reworked. Do not treat this as a working CNC controller; spindle
control and motion safety remain to be developed and verified.
