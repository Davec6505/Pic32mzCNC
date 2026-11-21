# Complete AVR446 Derivation, DDS Mapping, and Cosine Envelope Overlay (Extended)

## Scope
This document contains:

- Full AVR446 mathematical derivation.
- Exact relationship between velocity, distance, steps and timer periods.
- Derivation of the recurrence used in AVR446.
- Mapping of AVR446 to the current PIC32 DDS implementation.
- Cosine-envelope overlay proposal.
- Area-preservation proof.
- Numerical worked examples.
- Discussion of injection points.

---

# 1. Kinematics

Starting from:

v = ds/dt

a = dv/dt

Using the chain rule:

a = dv/dt = (dv/ds)(ds/dt)

Therefore:

a = v dv/ds

Integrating:

∫a ds = ∫v dv

Assuming constant acceleration:

as = v²/2 - u²/2

Giving:

v² = u² + 2as

For a move beginning from rest:

u = 0

Hence:

v² = 2as

and

s = v²/(2a)

---

# 2. Convert to Stepper Space

For a stepper:

s = nα

where:

n = step index
α = step angle

Substitute:

v² = 2aαn

Thus:

v = √(2aαn)

and:

n = v²/(2aα)

This is the origin of the planner's:

max_step_lim

calculation.

---

# 3. Timer Period Relationship

Step frequency:

f = v/α

Step period:

c = 1/f

Therefore:

c = α/v

Substitute v:

c = α / √(2aαn)

Collect constants:

c = K/√n

where:

K = √(α/(2a))

and after timer scaling:

K = f_timer √(2α/a)

---

# 4. Exact Successive Delay Expression

Exact delay:

c(n)=K n^(-1/2)

Next delay:

c(n+1)=K (n+1)^(-1/2)

Take ratio:

c(n+1)/c(n) = √(n/(n+1))

Thus:

c(n+1) = c(n)√(n/(n+1))

This is exact.

---

# 5. Binomial Expansion

Rewrite:

√(n/(n+1)) = (1+1/n)^(-1/2)

General binomial:

(1+x)^p = 1 + px + p(p-1)x²/2! + p(p-1)(p-2)x³/3! + ...

For:

p = -1/2

x = 1/n

Result:

(1+1/n)^(-1/2) = 1 - 1/(2n) + 3/(8n²) - 5/(16n³) + 35/(128n⁴)

-...

Therefore:

c(n+1) = c(n)[1-1/(2n)+3/(8n²)-5/(16n³)+...]

---

# 6. AVR446 Rational Approximation

Atmel wanted an integer-only approximation.

Consider:

2/(4n+1)

Expand: 

2/(4n+1) = 1/(2n)-1/(8n²)+1/(32n³)

-...

Therefore:

1 - 2/(4n+1) = 1-1/(2n)+1/(8n²)-1/(32n³)

+...

Compare:

Exact:

1-1/(2n)+3/(8n²)-5/(16n³)

+...

Approximation:

1-1/(2n)+1/(8n²)-1/(32n³)

+...

The dominant term is identical.

Therefore:

c(n+1) ≈ c(n)(1-2/(4n+1))

Expanding:

c(n+1) = c(n)-2c(n)/(4n+1)

This is the AVR446 recurrence.

---

# 7. AVR446 Initial Delay

The exact first delay from rest requires a correction.

AVR446 derives:

c0 = 0.676 f_timer √(2α/a)

The 0.676 factor compensates initial recurrence error.

Your implementation:

step_delay = (T1_FREQ_148 * sqrt_(a_sq/acc))/100

is the scaled form of c0.

---

# 8. Mapping To Current Firmware

AVR446:

c(n+1) = c(n)-2c(n)/(4n+1)

Firmware:

new_step_delay = step_delay - (((step_delay<<1)+rest)  / ((accel_count<<2)+1));

Mapping:

c(n)               -> step_delay
2c(n)              -> step_delay<<1
n                  -> accel_count
4n+1               -> (accel_count<<2)+1
fraction remainder -> rest

Thus the implementation is mathematically AVR446 with fractional error accumulation.

---

# 9. Short Move Planning

Given:

Distance = N

Acceleration = A

Deceleration = D

Current planner:

accel_lim = ND/(A+D)

For:

N=10000
A=1000
D=1000

accel_lim = 5000

The move becomes triangular.

---

# 10. Why The Existing Ramp Is Good

Velocity:

v = √(2aαn)

The shape is already smooth.

The discontinuity is acceleration.

Current profile:

 0 -> +A
+A ->  0
 0 -> -D
-D ->  0

These transitions contain significant high-frequency energy.

---

# 11. Overlay Concept

Keep:

- AVR446 recurrence
- DDS
- Bresenham interpolation
- accel_lim
- max_step_lim
- decel_start

Only alter the acceleration envelope.

---

# 12. Acceleration Envelope

Desired acceleration:

A+
A
A-

where:

A+ : smooth entry
A  : full acceleration
A- : smooth exit

Deceleration mirrors this.

---

# 13. Blend Region Example

Assume:

accel_lim = 5000
blend = 20%

Then:

blend_steps = 1000

Segments:

A+ = 1000
A  = 3000
A- = 1000

Total remains:

5000

---

# 14. Cosine Envelope

Define:

x = step/blend_steps

0 <= x <= 1

Envelope:

E(x) = 0.5-0.5cos(πx)

Properties:

E(0)=0
E(1)=1
E'(0)=0
E'(1)=0

Smooth entry and exit.

---

# 15. Numerical Example

x      E(x)
0.0    0.000
0.1    0.024
0.2    0.095
0.3    0.206
0.4    0.345
0.5    0.500
0.6    0.655
0.7    0.794
0.8    0.905
0.9    0.976
1.0    1.000

---

# 16. Area Preservation

The average value of E(x):

Integral from 0 to 1:

∫(0.5-0.5cos(πx))dx = [x/2 - sin(πx)/(2π)] 
0→1 
= 0.5

Thus average(E)=0.5.

For blend width B:

Area(A+) = 0.5AB

Area(A-) = 0.5AB

Combined:

Area(A+) + Area(A-) = AB

Exactly equal to a rectangular section of width B and height A.

Therefore:

0.5AB + A(accel_lim-B) + 0.5AB
=
A accel_lim

Planner energy assumptions remain unchanged.

---

# 17. Injection Point Analysis

Method 1:

c' = cE(x)

Not recommended.

Directly distorts velocity.

Method 2:

a' = aE(x)

Physically intuitive but not directly represented by AVR446 state variables.

Method 3:

Effective step domain:

n_eff = nE(x)

Because:

v² = 2aαn

becomes:

v² = 2aα(nE(x))

Thus:

c(n+1) = c(n)-2c(n)/(4n_eff+1)

This is the closest extension to the original derivation.

---

# 18. Proposed Runtime Form

A+:

n_eff = nE(x)

A:

n_eff = n

A-:

n_eff = nE(1-x)

Then:

c(n+1) = c(n)-2c(n)/(4n_eff+1)

The DDS engine remains unchanged.

---

# 19. Expected Benefits

Reduced:

- resonance
- ringing
- frame excitation
- motor shock loading

Potentially allowing:

- higher acceleration
- more reliable high-speed operation
- higher feedrate before instability

while retaining the existing AVR446 and DDS architecture.

# 20. Objective
AVR446 recurrence
DDS engine
Planner mathematics
Bresenham interpolation

Replacing:
- Constant acceleration transitions

# 21. Code replacements and or additions
 
[AVR446 Derivation](AVR446 Firmware chane proposal.md)

