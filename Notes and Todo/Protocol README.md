# Grbl 1.1 protocol in this firmware

This note describes the host protocol as the MikroC firmware implements it
today. It follows Grbl 1.1h closely enough for Universal Gcode Sender (UGS)
to connect, poll and stream. Where the firmware differs from Grbl, or a feature
has no physical behaviour yet, that is stated below.

Main source files:

- `Serial_Dma.c`: receive and transmit.
- `Protocol.c`: `$` commands and the tokenizer.
- `GCODE.c`: G and M decoding.
- `Main.c`: execution.
- `Print.c`: all replies.

## Serial link

| Item | Value |
| --- | --- |
| Port | UART2, TX RC2, RX RC3 |
| Format | 115200 baud, 8 data bits, no parity, 1 stop bit |
| Receive | RX interrupt into a 1024-byte ring buffer |
| Transmit | DMA channel 1 from a 200-byte buffer (`dma_printf`) |
| Line length | 63 characters plus terminator (`LINE_BUFFER_SIZE` 64) |
| Line end | CR, LF or CRLF; a CRLF pair counts as one line end |

The `$I` reply advertises an RX budget of 128 bytes, so character-counting
senders stay well inside the 1024-byte ring.

### Host link

The protocol talks to one host link at a time: `HOST_LINK_SERIAL` (the
default) or `HOST_LINK_ETHERNET`. `Host_SetLink()` waits for any DMA transmit,
then clears the ring and the partly assembled line.

- Bytes from the active link go through the same realtime check, ring and
  line assembly. The UART interrupt ignores its bytes when Ethernet is active.
  Ethernet bytes come in through `Host_ReceiveBytes()` from the main loop.
- `dma_printf` replies go to the UART, or to the Ethernet TX ring when
  Ethernet is active.

Ethernet is Grbl on TCP port 23 (in UGS, connection driver TCP,
`10.0.0.200:23`):

- The first data on port 23 switches the link to Ethernet. That computer then
  owns the link; other computers get no data until it goes quiet. A new
  connection from the owner (a UGS reconnect) starts a fresh session.
- The ENC28J60 library has no send-at-will for TCP. Data only leaves as the
  reply to an incoming segment. So before replying, the callback answers what
  the segment carried (`Host_ServiceNow()` in `Main.c`): a `?` gets its status
  line, and complete lines are run and get their `ok` or error in the same
  reply. UGS's start-up handshake needs this; a reply one packet late puts
  every answer against the wrong request. Lines wait for the main loop while
  the machine is busy or a reset or hold is pending. Output produced later
  goes out on the next segment; UGS sends `?` every 200 ms while connected.
- The TX ring holds 2048 bytes (a whole `$$` listing); one reply carries at
  most 1024 and the rest follows on the next segment.
- The library tells us nothing when a connection closes. After 5 s with no
  segment from the owner, the link returns to serial.
- The library does not retransmit. A lost reply is lost, and a segment the
  host resends (if the main loop stalls for longer than its retry time) is
  handed over twice. Keep the main loop free of long blocking waits.

### Receive errors

- **Line too long:** the line is discarded up to its end, and the reply is
  `error:11`.
- **Ring overflow, a UART error, or a 0x00/0x01 byte:** only the damaged line
  is marked. It is discarded up to its line end and replies `error:11`.
  Complete lines already queued in the ring are kept and run as normal. If the
  ring has no room even for the mark, the whole ring is flushed and one
  `error:11` is sent.

## Reply rules

Every line receives **exactly one** final reply: `ok` or `error:n`.

- `$` commands reply as soon as they have run. Report commands print their
  report lines first, then `ok`.
- A G-code line is parsed first. A parse error, or any line in check mode
  (`$C`), replies immediately. An accepted line replies only after
  `Execute_Gcode_Line()` has run it in the main loop.
- A blank line replies `ok`.
- While the machine is in `Run` or `Home`, new lines stay in the serial ring
  and are not read. Realtime characters are still handled.
- In `Alarm`, G-code lines reply `error:9`. `$` commands still work.

## Realtime characters

These are picked out of the byte stream in the RX interrupt. They never enter
the line buffer and never get a reply of their own.

| Byte | Action | Status |
| --- | --- | --- |
| `?` | Status report | Working |
| `~` | Cycle start | Leaves `Hold` (after `M0` or `!`) and goes back to `Idle`. TODO: restart held motion |
| `!` | Feed hold | In `Idle`, enters `Hold:0`. TODO: in `Run`, decelerate to a stop (needs the step engine) |
| `0x18` (Ctrl-X) | Soft reset: clears the ring, `mc_reset()`, prints the banner | Working |
| `0x80`–`0xFF` | Grbl 1.1 extended realtime (door, jog cancel, overrides) | **Dropped.** TODO |

## Startup

At power-up or after a soft reset, the firmware prints:

```text

Grbl 1.1h ['$' for help]
```

If the machine is in alarm after a reset, it then prints
`[MSG:'$H'|'$X' to unlock]`.

The stored startup lines (`$N0`, `$N1`) are **not** run at boot yet.
`protocol_execute_startup()` is commented out.

## `$` commands

| Command | Reply | Notes |
| --- | --- | --- |
| `$` | `[HLP:$$ $# $G $I $N $x=val $Nx=line $C $X $H ~ ! ? ctrl-x]` | |
| `$$` | Settings list, see below | |
| `$#` | `[G54:…]` … `[G59:…]`, `[G28:…]`, `[G30:…]`, `[G92:…]`, `[TLO:0.000]`, `[PRB:0.000,0.000,0.000:0]` | XYZ only. TLO and PRB are fixed |
| `$G` | `[GC:G0 G54 G17 G21 G90 G94 M5 M9 T0 F0 S0]` style | Current parser state |
| `$I` | `[VER:1.1h.20190830:]`, `[OPT:,15,128]`, then `[MSG:Ethernet 10.0.0.200]` or `[MSG:Ethernet not found]` | No option letters, 15 blocks, 128-byte RX |
| `$N` | `$N0=…` and `$N1=…` | Two startup lines |
| `$Nn=line` | `ok` | Saves to flash. `error:8` if busy |
| `$Nn` (no `=`) | `error:3` | TODO: could run startup line n |
| `$n=value` | `ok` | Saves to flash. See the settings table |
| `$C` | `[MSG:Enabled]` / `[MSG:Disabled]` | Check mode. Turning it off resets. `error:8` if not idle |
| `$X` | `[MSG:Caution: Unlocked]` when in alarm | Clears the alarm |
| `$H` | `error:20` | TODO: rework homing for the DDS engine, then define `HOMING_READY` |
| `$J=…` | `error:20` | TODO: jogging |
| `$RST=$` | `ok` | Restores the default settings; offsets are kept |
| `$RST=#` | `ok` | Clears G54–G59, G28 and G30; settings are kept |
| `$RST=*` | `ok` | Restores everything |
| `$$`, `$#`, `$G`, `$I`, `$C`, `$X`, `$H` with extra characters | `error:3` | |
| Anything else | `error:3` | |

`$RST` and every `$n=` write go to flash immediately. While the machine is
busy (`Run`, `Hold`, `Home` or `Jog`) they reply `error:8`.

## Settings (`$$`)

Grbl 1.1 numbers are mapped onto the firmware's internal (Grbl 0.8 style)
settings in `settings_store_grbl_setting()` (`Globals.c`). The order printed by
`report_grbl_settings()` (`Print.c`) must match it.

| `$` | Meaning | Storage |
| --- | --- | --- |
| 0 | Step pulse, µs (minimum 3) | Stored |
| 1 | Step idle delay, ms | Stored |
| 2 | Step port invert mask | Stored, not yet applied to the pins |
| 3 | Direction port invert mask | Stored, not yet applied to the pins |
| 4 | Step enable invert | Stored flag, not yet applied to the pin |
| 5 | Limit pin invert | Stored flag, not yet applied |
| 6 | Probe pin invert | Fixed at 0 |
| 10 | Status report mask | Fixed at 1 |
| 11 | Junction deviation, mm | Stored |
| 12 | Arc tolerance, mm (used as mm per arc segment) | Stored, must be > 0 |
| 13 | Report inches | Stored flag |
| 20 | Soft limits | Fixed at 0 |
| 21 | Hard limits | Stored flag |
| 22 | Homing enable | Stored flag |
| 23 | Homing direction mask | Stored |
| 24 | Homing feed, mm/min | Stored |
| 25 | Homing seek, mm/min | Stored |
| 26 | Homing debounce, ms | Stored |
| 27 | Homing pull-off, mm | Stored |
| 30–32 | Spindle maximum and minimum, laser mode | Fixed (1000, 0, 0) |
| 100–102 | X, Y, Z steps/mm | Stored per axis, must be > 0 |
| 110–112 | X, Y, Z maximum rate, mm/min | **One shared value** (the default seek rate) |
| 120–122 | X, Y, Z acceleration, mm/s² | **One shared value**, held internally as mm/min² |
| 130–132 | X, Y, Z maximum travel, mm | Fixed from `Settings.h` |

Writing a fixed setting replies `error:3`. Changing `$100`–`$102` recalculates
the ramp constants at once; no reset is needed.

## Status report (`?`)

```text
<Idle|MPos:0.000,0.000,0.000|FS:0,0|WCO:0.000,0.000,0.000>
```

- The state is one of `Idle`, `Run`, `Hold:0`, `Home`, `Alarm` or `Check`.
- `MPos` is built from the step counters. `WCO` is the active work offset plus
  G92, and is sent in every report.
- `FS` shows the programmed feed while in `Run`; the spindle speed is always 0.
- With `$13=1`, positions are reported in inches.
- Only XYZ are reported. The A axis is tracked internally but not reported.

## G-code

Before parsing, each line is tokenized into words:

- Spaces and tabs are removed.
- `( … )` and `;` comments are stripped.
- Letters are converted to upper case.
- A malformed character gives `error:1`.

G and M words are applied before value words, so `X1 G20` converts `X` to
inches just as `G20 X1` does. `I`, `J` and `K` are converted for G20 as well.

Every word on the line is checked. The **first** error found is reported,
nothing on the line is executed, and any modal state the line changed (for
example `G91`) is restored.

### G codes

| Code | Status |
| --- | --- |
| G0, G1 | Accepted. Up to four coordinated axes; untested on hardware |
| G2, G3 | Accepted in the G17 plane only (`R` or `I`/`J`). G18/G19 arcs and arcs with Z or A give `error:20` (TODO) |
| G4 | Dwell. `P` is in **seconds** (decimals allowed), as in Grbl 1.1. `S` in seconds is also accepted |
| G10 L2 / L20 | Sets the G54–G59 offsets. `P0` means the active system, `P1`–`P6` mean G54–G59. Saved to flash. G10 L1 gives `error:20` (TODO: tool table) |
| G17, G18, G19 | Plane select |
| G20, G21 | Inches or mm |
| G28, G30 | Go to the stored position. Axis words give an intermediate point |
| G28.1, G30.1 | Store the current position. Saved to flash |
| G53 | Machine coordinates for this block (G0/G1 only) |
| G54–G59 | Work coordinate system select |
| G80 | Motion cancel. Axis words with it are an error |
| G90, G91 | Absolute or incremental |
| G92, G92.1 | Set or clear the coordinate offset (kept in RAM, as in Grbl) |
| G93 | `error:20`. TODO: inverse time needs the step engine |
| G94 | Units per minute |
| Others | `error:20` |

### M codes and other words

| Word | Status |
| --- | --- |
| M0 | Program pause: replies `ok`, then `Hold:0` until `~`. No lines are read while held; they wait in the ring |
| M1 | Ignored |
| M2, M30 | Program end |
| M3, M4 | `error:20`. TODO: spindle output |
| M5 | Accepted, spindle off |
| M7, M8 | `error:20`. TODO: coolant outputs |
| M9 | Accepted, coolant off |
| X Y Z A I J K R F | Accepted |
| P L | Accepted |
| S | Accepted. TODO: only used by G4 until the spindle is driven |
| N | Line numbers are accepted and ignored |
| T | `error:20`. TODO: tool change |

### Motion (interim engine)

With `STEP_ENGINE_READY` defined in `Settings.h`, `Run_Move()` (`Main.c`) sets
`STATE_CYCLE` and starts a linear move through `MultiAxisStep()`. This sets up
the master ramp (`speed_cntr_Move`) and starts the DDS
engine (`Start_Interpolation`). The main loop calls `Cycle_Complete()` once no
axis is running. The `MPos` DRO follows `steps_abs_position`, which the
engine counts on each step.

Because the main loop stops reading lines while in `Run`, streaming waits for
each move to finish. Each move starts and ends at rest, and each arc segment is
a separate move, so arcs are slow until the planner exists. On a multi-axis
move the feed rate is applied to the master axis, not the path. A currently
uses the same linear conversion and G20/G21 units as XYZ; rotational A-axis
units and combined feed semantics are not implemented.

Undefine `STEP_ENGINE_READY` to go back to simulated motion, where the
position jumps to the target and the cycle completes at once.

## Error codes

Internal status codes are mapped onto Grbl 1.1 numbers in
`report_status_message()` (`Print.c`).

| Reply | Meaning |
| --- | --- |
| `error:1` | Expected command letter or a malformed word |
| `error:2` | Bad number format |
| `error:3` | Invalid or unsupported `$` statement |
| `error:4` | Negative or zero value |
| `error:5` | Setting disabled (for example, `$H` with homing off) |
| `error:6` | Step pulse below 3 µs |
| `error:7` | Flash read or write failed |
| `error:8` | Not idle |
| `error:9` | G-code locked out in alarm |
| `error:11` | Line too long, or receive overflow |
| `error:12` | Speed error |
| `error:20` | Unsupported command: no physical behaviour yet |
| `error:21` | Modal group violation |
| `error:22` | Feed rate not set for G1, G2 or G3 |
| `error:34` | Arc radius error |

### Alarms

| Reply | Meaning |
| --- | --- |
| `ALARM:1` | Hard limit. Also prints `[MSG:Reset to continue]` and waits for Ctrl-X |
| `ALARM:3` | Abort during a cycle |

## Settings in flash

The settings row is held in one flash page, at virtual address `0xBD1BC000`
(physical `0x1D1BC000`). It is copied into the RAM buffer `buffA` at
`0xA0000000`. The word at index `0x17C` is the valid marker, `0x7FFF0102`.
The marker changes whenever the row layout changes (last: $3/$5 storage), so
older rows are replaced by the defaults on the first save after an update.

- **Boot:** flash is read only. If the marker is missing, the defaults from
  `Settings.h` are loaded into RAM, and flash is not touched.
- **Save:** any `$n=`, `$Nn=`, `$RST=`, G10, G28.1 or G30.1 erases the page,
  then writes the whole row with the marker. The NVM unlock follows the
  sequence in the PIC32 Family Reference Manual (Section 52), with a bounded
  wait on WR.
- Saving has been tested on hardware: `$100=200` survives a power cycle, and
  `$RST=*` restores the defaults.

## TODO summary

- Extended realtime bytes `0x84`–`0x9D`: safety door, jog cancel and
  overrides.
- `$J=` jogging and `$H` homing. Homing is behind `HOMING_READY`.
- Feed hold and cycle start acting on real motion; M0.
- Feed rate along the path for multi-axis moves; rotational A-axis units.
- Spindle (M3/M4, S), coolant (M7/M8), tool change (T, G10 L1).
- G93 inverse time; arcs in G18/G19.
- Run the `$N` startup lines at boot.
- Report the A axis, and give each axis its own max rate and acceleration.
- Test Grbl over TCP port 23 with UGS; consider a lower latency than the
  `?` poll for delayed replies.
