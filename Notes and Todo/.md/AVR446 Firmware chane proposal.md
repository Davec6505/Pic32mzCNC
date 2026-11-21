# AVR446 Cosine Envelope Overlay
## Practical Firmware Changes

This document describes the minimum firmware changes required to add a cosine envelope overlay to the current AVR446 DDS motion controller.

The objective is to preserve:

- AVR446 mathematics
- DDS step engine
- Bresenham interpolation
- Planner geometry
- Existing acceleration calculations

while smoothing acceleration transitions:

```text
0 -> +A
+A -> 0
0 -> -D
-D -> 0
```

into:

```text
A+
A
A-

RUN

D-
D
D+
```

without a complete trajectory planner rewrite.

---

# 1. Add New GRBL Setting

Add a new GRBL-style setting:

```c
uint8_t s_curve_percent;
```

Default:

```c
settings.s_curve_percent = 0;
```

Example usage:

```text
$140=0
Pure AVR446

$140=10
Light smoothing

$140=20
Moderate smoothing

$140=30
Aggressive smoothing

$140=50
Experimental
```

A value of:

```text
0
```

must produce identical behaviour to the current firmware.

---

# 2. No New STPS Members Required

The first implementation requires no changes to:

```c
typedef struct STP
{
}
```

All parameters can be derived from:

```c
STPS[axis].accel_lim
STPS[axis].step_count
STPS[axis].dist
STPS[axis].decel_start
```

and:

```c
settings.s_curve_percent
```

---

# 3. Add Cosine Envelope Function

Add to Stepper.c

```c
static float AccelEnvelope(int axis)
{
    long blend_steps;
    long n;
    float x;

    if(settings.s_curve_percent == 0)
        return 1.0f;

    blend_steps =
        (STPS[axis].accel_lim *
         settings.s_curve_percent)
        / 100;

    if(blend_steps < 4)
        return 1.0f;

    n = STPS[axis].step_count;

    /*
     * Segment A+
     */

    if(n < blend_steps)
    {
        x =
          (float)n
          /
          (float)blend_steps;

        return
           0.5f -
           0.5f*cosf(PI*x);
    }

    /*
     * Segment A
     */

    if(n <
      (STPS[axis].accel_lim -
       blend_steps))
    {
        return 1.0f;
    }

    /*
     * Segment A-
     */

    if(n < STPS[axis].accel_lim)
    {
        x =
         (float)
         (n -
         (STPS[axis].accel_lim -
          blend_steps))
         /
         (float)blend_steps;

        return
           0.5f +
           0.5f*cosf(PI*x);
    }

    return 1.0f;
}
```

---

# 4. Existing AVR446 Recurrence

Current code:

```c
new_step_delay =
step_delay -
(((step_delay<<1)+rest)
 /
((accel_count<<2)+1));
```

Mathematically:

```text
c(n+1)
=
c(n)
-
2c(n)
-------
4n+1
```

---

# 5. Proposed Injection Point

Inside:

```c
static void AccDec(int axis_No)
```

calculate:

```c
float env;
float n_eff;
```

before the recurrence.

```c
env = AccelEnvelope(axis_No);

n_eff =
 ((float)STPS[axis_No].accel_count)
 * env;
```

---

# 6. Modified Recurrence

Replace:

```c
((accel_count<<2)+1)
```

with:

```c
((((long)n_eff)<<2)+1)
```

Result:

```c
new_step_delay =
step_delay -
(((step_delay<<1)+rest)
 /
((((long)n_eff)<<2)+1));
```

---

# 7. Mathematical Interpretation

Original AVR446:

```text
4n+1
```

Modified:

```text
4(nE(x))+1
```

where:

```text
E(x)
=
0.5 - 0.5cos(πx)
```

during:

```text
A+
```

and

```text
E(1-x)
```

during:

```text
A-
```

---

# 8. Runtime Sequence

Acceleration:

```text
A+

n_eff = nE(x)
```

```text
A

n_eff = n
```

```text
A-

n_eff = nE(1-x)
```

Run:

```text
n_eff = n
```

Deceleration:

Mirror acceleration.

```text
D-

n_eff = nE(x)
```

```text
D

n_eff = n
```

```text
D+

n_eff = nE(1-x)
```

---

# 9. Computational Cost

Additional operations per step:

```text
1 cosine
1 multiply
1 float-to-long conversion
```

A PIC32MZ running at:

```text
200 MHz
```

or:

```text
252 MHz
```

can easily accommodate this.

---

# 10. Experimental Validation

Test:

```text
$140=0
```

Record:

```text
Maximum stable acceleration
Maximum stable feedrate
Motor noise
Vibration
Surface finish
```

Then repeat:

```text
$140=10
$140=20
$140=30
$140=40
```

Compare against baseline.

---

# 11. Success Criteria

Desired result:

```text
Lower resonance
Lower ringing
Lower frame excitation
Higher usable acceleration
Higher stable feedrates
```

while preserving:

```text
DDS architecture
Planner architecture
AVR446 recurrence
Interpolation engine
```

Only the effective AVR446 step index changes:

```text
n

↓

n_eff = nE(x)
```

which introduces a tunable S-curve style acceleration envelope without rewriting the motion kernel.