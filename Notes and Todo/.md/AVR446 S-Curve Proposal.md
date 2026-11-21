# AVR446 DDS Planner Analysis and Proposed S-Curve Extension

## Overview

This document describes:

1. Current AVR446-derived trajectory calculations used by the planner.
2. Existing DDS execution model.
3. Proposed acceleration shaping approach.
4. Additional calculations required for A+, A, A- and mirrored deceleration.
5. Why the existing planner can be retained.

---

# Current Motion Model

The current planner implements a trapezoidal velocity profile:

```text
ACCEL -> RUN -> DECEL
```

The DDS engine executes step timing while the planner computes the transition points.

---

# Existing Planner Equations

## Step Angle

```text
alpha = 2*pi / steps_per_mm
```

Code:

```c
alpha[i] = (PIx2 / settings.steps_per_mm[i]);
```

---

## Maximum Velocity Delay

Desired step rate:

```text
speed_steps = rpm_or_rps * steps_per_unit
```

Converted delay:

```text
c_min = alpha * T1_FREQ / velocity
```

Code:

```c
STPS[axis].min_delay =
    a_t_x100[axis] / temp_speed;
```

---

## Initial Delay c0

AVR446:

```text
c0 = 0.676 * f_timer * sqrt(2*alpha/a)
```

Code:

```c
STPS[axis].step_delay =
    T1_FREQ_148 * sqrt_(a_sq[axis]/acc)/100;
```

---

## Number of Steps to Reach Maximum Velocity

Using:

```text
v² = 2*a*s
```

Therefore:

```text
s = v² / (2*a)
```

Code:

```c
max_step_lim =
(temp_speed*temp_speed)
/
((alpha*x20000*acc)/100)
```

---

## Acceleration Limit

The move may be too short to reach full speed.

Current planner computes:

```text
accel_lim =
(total_steps * dec)
/
(acc + dec)
```

Code:

```c
STPS[axis].accel_lim =
(abs_mmSteps*dec)/(acc+dec);
```

---

## Deceleration Start

Current planner computes:

```text
decel_start =
distance + decel_val
```

Code:

```c
STPS[axis].decel_start =
mmSteps + STPS[axis].decel_val;
```

---

# AVR446 Recursive Delay Update

Current implementation:

```c
new_delay =
old_delay -
((2*old_delay)+rest)
/
((4*n)+1);
```

Code:

```c
new_step_delay =
step_delay -
(((step_delay<<1)+rest)
/
((accel_count<<2)+1));
```

This is the heart of the acceleration profile.

---

# Current Acceleration Shape

Acceleration:

```text
+A
+A
+A
+A
+A
```

Velocity:

```text
       /
      /
     /
    /
___/
```

Acceleration changes abruptly at transitions.

```text
0 -> +A
+A -> 0
0 -> -D
-D -> 0
```

These discontinuities create excitation energy.

---

# Proposed Extension

Retain:

```text
AVR446 recurrence
DDS engine
Bresenham interpolation
accel_lim
max_step_lim
decel_start
```

Only modify:

```text
Effective acceleration
```

---

# New Acceleration Form

Acceleration phase becomes:

```text
A+
A
A-
```

Deceleration becomes:

```text
D-
D
D+
```

Full profile:

```text
A+ -> A -> A- -> RUN -> D- -> D -> D+
```

---

# Segment Calculation

Let:

```text
accel_steps = accel_lim
```

Choose smoothing percentage:

```text
s_curve_pct
```

Example:

```text
20%
```

Then:

```text
blend_steps =
(accel_steps * s_curve_pct)
/ 100
```

Acceleration region:

```text
seg1_end = blend_steps
seg2_end = accel_steps - blend_steps
seg3_end = accel_steps
```

Example:

```text
accel_steps = 1000
s_curve_pct = 20
blend_steps = 200
```

Produces:

```text
0-200     A+
200-800   A
800-1000  A-
```

---

# Raised Cosine Scale Function

For Segment 1:

```text
x = step_count / blend_steps
```

```text
scale =
0.5 - 0.5*cos(pi*x)
```

Behaviour:

```text
0 -> 1
```

Example:

```text
0.00
0.02
0.08
0.18
0.31
0.50
0.69
0.82
0.92
0.98
1.00
```

---

# Effective Acceleration

Instead of:

```text
acc_eff = acc
```

Use:

```text
acc_eff = acc * scale
```

---

# Segment 2

Full acceleration:

```text
acc_eff = acc
```

---

# Segment 3

Mirror Segment 1:

```text
scale =
0.5 + 0.5*cos(pi*x)
```

Behaviour:

```text
1 -> 0
```

---

# Deceleration

Identical calculation applied using:

```text
remaining = dist - step_count
```

instead of:

```text
step_count
```

Giving:

```text
D-
D
D+
```

---

# Minimal Data Structure Changes

Add to STPS:

```c
long blend_steps;
long accel_seg1;
long accel_seg2;
```

Everything else can be derived.

---

# Why This Fits The Existing Architecture

No changes to:

```text
dds_tick()
Step_Cycle()
Start_Interpolation()
Bresenham error accumulation
Arc interpolation
```

Only the acceleration scaling entering AVR446 changes.

---

# Expected Benefits

Reduced:

```text
Mechanical resonance
Frame excitation
Stepper ringing
Mid-band instability
```

Potentially allowing:

```text
Higher acceleration
Higher top speed
Reduced lost-step risk
```

while preserving the proven characteristics of the existing DDS planner.
