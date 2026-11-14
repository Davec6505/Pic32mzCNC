# Motion planner plan

This is the design plan for the lookahead planner that will sit between the
G-code parser and the DDS step engine. Nothing in it is implemented yet.
Grbl 1.1 is the reference design, because UGS expects Grbl behaviour.

## Where the code is today

- The main loop reads one line, parses it, executes it, then sends `ok`.
- `Run_Move()` (Main.c) jumps straight to the target. The old kinematics under
  `STEP_ENGINE_READY` ran one move at a time, from rest to rest, with no
  junction speeds.
- While `sys.state` is `STATE_CYCLE`, no lines are read. The next move is not
  known before the current one ends, so every move must stop at its end.
- Settings hold one `acceleration` and one `default_seek_rate` for all axes.
  `$110`-`$122` are printed from these single values.

The planner changes this: lines are parsed **while** motion runs, and moves
are queued so the machine only slows down as much as each corner needs.

## The layers

```text
 UART RX ISR --> serial ring (1024 B)
                     |  main loop: Serial_ReadLine, only while the planner has room
                     v
               G-code parser --> gc (modal state, gc.position in mm)
                     |
                     v
               motion feeder  (mc_line / mc_arc: arcs become short lines)
                     |  plan_buffer_line(target_mm, feed, flags)
                     v
               planner ring   block_buffer[PLANNER_SIZE], lookahead recalc
                     |
                     v
               segment prep   (main loop) cuts the running block into short
                     |        time slices, each with one constant rate
                     v
               segment ring   small, for example 8 slices
                     |
                     v
               DDS ISR (Timer8, fixed tick) --> STEP/DIR pins, sys.position
```

Each layer talks only to its neighbours, through a ring with a head and a tail
index. The ISR never touches the planner, and the parser never touches the ISR.

## 1. Data structure for motion

### The block

One block is one straight line, already converted to steps:

```c
typedef struct {
  // used by the step engine
  uint32_t steps[NoOfAxis];      // step count per axis, always positive
  uint32_t step_event_count;     // the largest of steps[]: the dominant axis
  uint8_t  direction_bits;       // bit set = negative direction
  uint8_t  flags;                // BLOCK_RAPID, BLOCK_SYSTEM_MOTION, ...
  uint16_t pad;

  // used by the planner; speeds are kept squared to avoid sqrt
  float entry_speed_sqr;         // planned speed at the block start (mm/min)^2
  float max_entry_speed_sqr;     // junction limit, capped by both nominal speeds
  float max_junction_speed_sqr;  // from the corner angle only
  float nominal_speed;           // programmed feed capped by axis max rates (mm/min)
  float acceleration;            // capped by axis accelerations (mm/min^2)
  float millimeters;             // length; the prep counts it down while running

  long  line_number;             // N word, for later reporting
} plan_block_t;
```

About 80 bytes with the jerk fields, so 64 blocks are about 5 KB. RAM is not a concern on the
PIC32MZ2048 (512 KB).

The planner keeps its own state apart from the blocks:

```c
typedef struct {
  long  position[NoOfAxis];      // in steps, at the end of the last queued block
  float previous_unit_vec[NoOfAxis];
  float previous_nominal_speed;
} planner_t;
```

Three positions now exist, each ahead of the next:

- `gc.position` (mm): where the parser is.
- `pl.position` (steps): the end of the queue.
- `sys.position` (steps): where the motors are.

Status reports must show `sys.position`, not `gc.position`.

### Array of structs or one array per field?

| | Array of structs (`plan_block_t block_buffer[N]`) | One array per field (`float entry_speed_sqr[N]; ...`) |
|---|---|---|
| Reading one block | All fields together, `&block_buffer[i]` | Same index into many arrays |
| Passing a block around | One pointer | An index, then many arrays |
| Adding a field | Edit the struct | A new array, and every user changes |
| Cache (the PIC32MZ has one) | Fields of one block are adjacent | Good only for loops over one field |

**Recommendation: one static array of structs, used through indexes and a
single level of pointer.**

```c
#define PLANNER_SIZE 64                 // power of two
#define PLANNER_MASK (PLANNER_SIZE-1)
static plan_block_t block_buffer[PLANNER_SIZE];
static uint8_t block_tail;              // oldest block, the one running
static uint8_t block_head;              // next free slot
static uint8_t block_planned;           // blocks before this need no replanning

#define next_block(i) (((i)+1) & PLANNER_MASK)
#define prev_block(i) (((i)-1) & PLANNER_MASK)
```

- No `malloc`: the size is fixed at link time and shows in the RAM overlap
  check.
- With a power-of-two size, wrap-around is a mask, not a compare.
- In a function, take one local pointer, `plan_block_t *b = &block_buffer[i];`,
  and use `b->field`. Avoid pointers to pointers, and pointers kept between
  calls (the mikroC double-dereference problem seen earlier).
- Only the main loop writes the planner. The segment prep also runs in the
  main loop, so the planner needs no interrupt locking. Only the small segment
  ring is shared with the ISR.

### The segment

A segment is a short time slice, for example 1 ms, at one constant rate. It is
what the DDS ISR consumes:

```c
typedef struct {
  uint32_t dds_increment;        // phase added per tick, dominant axis
  uint16_t n_step;               // dominant-axis steps in this slice
  uint8_t  block_index;          // block to read steps[] and direction_bits from
} segment_t;
```

Accelerating means each slice has a slightly higher increment than the one
before. The ISR stays simple: add, compare, step.

## 2. Lookahead: how many blocks?

The queue must hold enough distance to stop from the speed it wants to run at.
Only then can the planner keep the feed up.

```text
stopping distance = v^2 / (2 a)
```

Example: 3000 mm/min (50 mm/s) at 500 mm/s^2 needs 2.5 mm to stop.

- **Long lines:** a few blocks are plenty.
- **Arcs:** an arc becomes many short lines. For chord tolerance `tol` (`$12`)
  and radius `r` the segment length is `2 * sqrt(tol * (2r - tol))`. With
  `tol` = 0.002 mm and `r` = 5 mm that is about 0.28 mm, so 16 blocks cover
  only about 4.5 mm.
- **Small CAM moves** (3D surfacing) can be shorter still.

16 is the minimum. **Chosen: 64.** That is about 4 KB of RAM and, with the
arc example above, about 18 mm of lookahead. `PLANNER_SIZE` keeps it easy to
change and measure. One slot stays empty so that full and empty can be told
apart, so 64 slots hold 63 blocks. The `uint8_t` indexes are still big
enough.

The real limit is CPU time, not RAM: each new block can trigger a
recalculation back through the queue, and with 64 blocks that pass can be
long. `block_planned` stops the backward pass
at the first block whose speed can no longer change, so in practice only a
few blocks are touched.

## 3. Feeding the lookahead from the ring

### The main loop

```text
loop:
  realtime, status (limits are sampled in the Timer1 ISR)
  segment_prep()             // keep the segment ring topped up from the planner
  if the feeder is busy (an arc in progress):
       queue more arc segments while the planner has room
       when the arc is finished: send ok
  else if the planner has room:
       read one line from the serial ring
       parse it; on an error send error:n
       start the feeder (a line: one block; an arc: many)
       if the line queued all its blocks: send ok
  else:
       read nothing; the next ok is simply not sent yet
```

### Holding back `ok`

UGS uses character counting: it keeps up to the `$I` RX budget (128 bytes) in
flight, and only sends more as `ok`s come back. No extra flow control is
needed:

- A line is only read from the ring when the planner has room for it.
- Its `ok` is sent once the line is **in the planner**, not after it has run.
  This is what Grbl does, and it is what lets UGS keep the queue full.
- With the planner full, nothing is read. The waiting lines stay in the
  1024-byte ring, and UGS stops when its budget is used up.

Realtime characters (`?`, `!`, `~`, Ctrl-X) are handled in the RX ISR, so they
still work while the queue is full.

### Arcs

`mc_arc` cuts an arc into many short lines. If the planner fills halfway
through an arc, there are two designs:

1. **Blocking (Grbl):** `plan_buffer_line` loops until a slot is free. The
   realtime, limit, status and watchdog work must be called inside that loop.
2. **Resumable feeder (chosen):** the arc keeps its state (angle, segment
   number) in a small struct. Each pass of the main loop queues as many
   segments as fit, then returns. The `ok` is sent when the last one is
   queued.

Option 2 keeps the main loop as the only scheduler, so Ethernet polling and
`WDT_CLEAR` never stall.

### Interrupt priorities

| Priority | Source | Work |
|---|---|---|
| 7 (shadow set) | Timer8, 10 us | DDS step tick; keep it to a few hundred cycles |
| 6 (shadow set) | Timer1, 10 ms | Clock, limit sampling; a hard limit in motion disables the drivers here |
| 5 (shadow set) | UART RX, DMA1 | Host bytes, realtime characters |
| 4 (shadow set) | INT1/2/4 | Old limit interrupts, not enabled |
| main loop | | Protocol, planner, ENC28J60 `doPacket()` twice per scan (TCP replies are built here) |

`PRISS = 0x76543210` gives each priority level its own shadow register set, and
every ISR is declared `ics ICS_SRS`, so no handler saves registers on the stack.

A hard-limit trip sets an event; `protocol_execute_runtime` turns it into
`mc_reset()` plus `EXEC_CRIT_EVENT` (ALARM:1, wait for Ctrl-X). It only trips in
`STATE_CYCLE`/`STATE_JOG` for now; Grbl trips in any state, which needs the
limit pull-ups enabled first.

When the planner exists, `Host_ServiceNow()` (TCP) and the main loop must take
a line when the planner has room, not only when the machine is idle. It also suits the learning goal, because every piece
is visible in the main loop.

### Lines that must wait for motion to finish

Some lines must not run until the queue is empty, because they change what
queued motion means, or because their effect must happen in order. The main
loop holds such a line (and reads nothing more) until the planner and the step
engine are idle, then runs it:

- G4 dwell, M0/M1/M2/M30.
- G10, G92, G28.1/G30.1 (they write offsets, some to flash). G28/G30 queue
  their moves but are simplest to sync at first.
- All `$` writes and actions: `$n=`, `$Nn=`, `$RST`, `$C`, `$X`, `$H`.
  Reports such as `$$`, `$#` and `$G` do not need to wait.
- Spindle and coolant M-codes, once they drive outputs.

G0/G1/G2/G3 never wait. G20/G21, G90/G91 and G54-G59 do not wait either: the
parser has already converted each target to machine millimetres.

### State

- `STATE_IDLE`: planner and step engine both empty.
- `STATE_CYCLE`: at least one block is queued or running. Lines **are** still
  read during a cycle; this is the main change to the main loop.
- The step engine returns to idle after its last segment when the planner is
  empty. This replaces the `TODO(DDS)` `Cycle_Complete()` call.

## 4. Speed planning

### Junction speed (corners)

Grbl's junction deviation model treats each corner as a small arc set by `$11`
and limits the speed so the centripetal acceleration stays within the
acceleration limit:

```text
cos_theta    = -(previous_unit_vec . unit_vec)
sin_theta_d2 = sqrt(0.5 * (1 - cos_theta))
v_junction^2 = a * junction_deviation * sin_theta_d2 / (1 - sin_theta_d2)
```

- Going straight on (theta = 0) only has the nominal speeds as a limit.
- A full reversal gets the minimum junction speed, near zero.
- The result is also capped by both blocks' nominal speeds.

### Recalculating on each new block

1. The new block is the last one, so it must be able to stop at its end: its
   exit speed is 0.
2. **Backward pass**, from the newest block back to `block_planned`:
   `entry^2 = min(max_entry^2, exit^2 + 2 a d)`. A block may only enter as
   fast as it can still slow to its exit speed.
3. **Forward pass**, from `block_planned` forward:
   `next.entry^2 = min(next.entry^2, entry^2 + 2 a d)`. A block may only leave
   as fast as it can accelerate from its entry. `block_planned` moves past
   blocks that can no longer change.

The running block (the tail) is never replanned. The segment prep owns its
current speed.

### The profile inside a block (segment prep)

From the entry, nominal and exit speeds (exit is the next block's entry), the
acceleration and the length, the prep works out the trapezoid:

```text
accelerate distance = (nominal^2 - entry^2) / (2a)
decelerate distance = (nominal^2 - exit^2)  / (2a)
```

If both do not fit in the length, the block becomes a triangle with a lower
peak speed. The prep then steps through time: each segment gets the speed at
its time, converted to a DDS increment for the dominant axis.

### Acceleration

Each axis has its own acceleration limit (`$120`-`$123`). A block moving
along the unit vector `u` gets the largest acceleration that keeps every axis
within its limit:

```text
block acceleration = min over moving axes of ( axis_accel[i] / |u[i]| )
```

The block's nominal speed is capped the same way from the axis max rates
(`$110`-`$113`). The planner itself always plans with constant acceleration
(trapezoids), because that keeps the backward and forward passes simple and
exact.

Suggested first values, to be tuned on the machine: X and Y 200 mm/s^2,
Z 100 mm/s^2, `$11` junction deviation 0.01 mm. Raise the acceleration until
the motors miss steps, then use about half.

### Jerk (designed in from the start)

Grbl 1.1 has **no** jerk limit: the acceleration switches on and off
instantly at each end of a ramp. That instant change is what knocks a
machine.

A true jerk-limited planner (7-phase S-curve) needs a cubic solution in the
backward and forward passes, and short blocks may never reach full
acceleration. That is a lot of hard maths for a first version.

**Chosen: a time-preserving S-curve in the segment prep.** This is the method
Marlin's `S_CURVE_ACCELERATION` uses:

- The planner plans trapezoids. Each speed change from `u` to `v` has a time
  `T = (v - u) / a` and covers distance `(u + v) T / 2`.
- The segment prep follows an S-shaped speed curve from `u` to `v` over the
  same `T`, instead of a straight line:

  ```text
  tau = t / T                         (0 .. 1 through the ramp)
  s   = 3 tau^2 - 2 tau^3             (cubic smoothstep)
  speed = u + (v - u) * s
  distance = u t + (v - u) T (tau^3 - tau^4 / 2)
  ```

- The curve has the same average speed as the straight ramp, so the distance
  is the same and the planner's numbers stay correct.
- The acceleration now starts at zero, rises smoothly to a peak in the middle
  of the ramp, and falls back to zero. It no longer jumps.
- The peak acceleration is 1.5 times the average. The planner therefore plans
  with `a / 1.5`, so the `$12x` setting is the **peak** acceleration the
  machine ever sees.
- Jerk is not a separate setting: it comes out as `6 (v - u) / T^2`, and is
  largest at the start and end of each ramp.

The cubic is the simplest curve that removes the acceleration jump. If more
smoothness is wanted later, a 5th-order curve (`6 tau^5 - 15 tau^4 +
10 tau^3`) also removes the jerk jump, with a peak of 1.875 times. Only the
prep function changes.

Fields the block needs for this, filled in by the prep when the block starts
running:

```c
  float accelerate_until;        // mm from block start where the speed-up ends
  float decelerate_after;        // mm from block start where the slow-down starts
  float cruise_speed;            // peak speed reached (below nominal for a triangle)
  float accel_time, decel_time;  // T of each ramp, for the S-curve
```

Corner speed changes (junction deviation) remain a small instant change, as in
Grbl and Marlin.

## 5. Step engine (where the DDS work fits)

**Chosen: DDS on the dominant axis, Bresenham on the others.** The dominant
axis is the one with the most steps in the block. The DDS sets its rate; the
other axes follow it with Bresenham counters:

```text
every tick:
  phase += increment
  if phase wrapped:              // one dominant-axis step
     for each axis: counter[axis] += steps[axis]
        if counter[axis] >= step_event_count:
           counter[axis] -= step_event_count; step this axis
     n_step--; if 0: take the next segment
```

Why this, rather than a DDS accumulator on every axis:

| | DDS + Bresenham | DDS on every axis |
|---|---|---|
| Step counts at block end | Exact by construction | Drift from rounded increments; needs exact counts per slice to fix |
| Axes in step with each other | Always within one step: a straight line | Within one slice (about 1 ms) |
| ISR work per tick | One add and compare | One add and compare per axis |
| Minor-axis step timing | Tied to dominant steps, so uneven by up to one dominant-step period | Even, to within one tick |
| Prep work per slice | One increment | One increment and step count per axis |

The only drawback of Bresenham is the uneven timing of the slower axes. With
microstepping drivers this is not felt, and Grbl's AMASS shows it can be
reduced later if needed. DDS is still the heart of the engine: it produces
the step rate and every speed change.

The STEP pulse width, DIR setup time and STEP-starts-low points in
`DDS motion progress.md` still apply.

## 6. Settings needed

The planner needs per-axis limits that `settings_t` does not have yet:

- `$110`-`$113`: max rate per axis (mm/min), replacing the single
  `default_seek_rate`.
- `$120`-`$123`: acceleration per axis, replacing the single `acceleration`
  (stored in mm/min^2, shown in mm/s^2).
- `$11` junction deviation already exists.
- `$12`: in Grbl 1.1 this is **arc tolerance** (mm). The current setting is
  `mm_per_arc_segment`. Change it to a tolerance and work out the segment
  length per arc as above.

This changes the flash layout, so bump the settings version: old flash is then
reset to defaults on the first boot.

## 7. Implementation order

1. Settings: per-axis max rate and acceleration, `$12` tolerance, version bump.
2. Planner ring and `plan_buffer_line()` without motion: blocks are queued and
   then dropped with a debug print, to test the main loop flow and deferred
   `ok` while UGS streams.
3. Junction speeds and the backward and forward passes. Debug-print the
   planned entry speeds for a test file and check them by hand.
4. Resumable `mc_arc` feeding the planner.
5. Sync lines (G4, G92, `$` writes) waiting for an empty queue.
6. Segment prep producing trapezoid slices.
7. DDS step engine with Bresenham: one axis first, with the driver
   disconnected, then all axes. `sys.position` is updated from the ISR.
8. Feed hold (`!`) and resume (`~`): the prep slows to zero within the current
   block, then the planner replans from zero speed.
9. S-curve ramps in the segment prep. The block fields for them are in place
   from step 2, so this does not change the data structures.

## Decisions

| Topic | Choice |
|---|---|
| Planner size | 64 blocks (63 usable) |
| Data layout | Static array of structs, accessed by index |
| Step engine | DDS on the dominant axis, Bresenham on the others |
| Arc feeding | Resumable feeder driven from the main loop |
| Acceleration | Per-axis limits; the planner plans trapezoids |
| Jerk | Designed in from the start: cubic time-preserving S-curve in the segment prep; plan with `a / 1.5` |

### Still to discuss

- Segment period (for example 1 ms) and the DDS tick (10 us now).
- Feed hold in the middle of an S-curve ramp.
