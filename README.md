# Pic32mzCNC

A 4-axis CNC controller for the PIC32MZ2048EFH100, written in MikroC PRO for
PIC32. It speaks the Grbl 1.1h serial protocol, so Universal Gcode Sender
(UGS) and other Grbl senders can connect to it.

This is a learning project for redesigning motion control in small,
understandable steps. Pic32mzCNC_V3 (XC32) is the working CNC implementation and the reference for the intended
behaviour.

## Status

| Area | State |
| --- | --- |
| Grbl 1.1h protocol and UGS connection | Working: connects, polls and replies one line at a time |
| G-code parser | G0–G3, G4, G10 L2/L20, G17–G21, G28/G30 (.1), G53–G59, G80, G90/G91, G92/G92.1, G94 |
| Settings in flash | Working: `$n=`, `$RST=`, G10 and G28.1/G30.1 survive a power cycle |
| Motion | Interim, untested on hardware: up to four coordinated axes per linear move, from rest to rest, using the Austin/AVR446 ramp in `Pulse()`. No lookahead planner yet |
| DDS step engine | Timer8 10 µs tick: one phase accumulator on the master axis, Bresenham for up to three followers, 10 µs step pulses, 50 kHz maximum. See [DDS motion progress](./Notes%20and%20Todo/DDS%20motion%20progress.md) |
| Spindle, coolant, homing, jogging, overrides | Not yet. Commands reply `error:20` |
| Ethernet (ENC28J60) | Answers ping at 10.0.0.200. Grbl over TCP port 23 (UGS `tcp://10.0.0.200:23`), untested on hardware |

Step pulses are now generated and have been tested on hardware. For initial
signal checks, disable driver power or disconnect the motors; verify the STEP
and DIR signals before attempting controlled motion. The motion safety features
have not been developed or verified.
Do not use radius-format (`R`) arcs yet: the compiler reports uninitialized
axis indices in the radius calculation.

## Hardware

- MikroE Flip&Click PIC32MZ board (PIC32MZ2048EFH100, 200 MHz SYSCLK). The board
  manual is in [Notes and Todo](./Notes%20and%20Todo/).
- Host serial on **UART2**: TX on **RC2**, RX on **RC3**, 115200 baud, 8N1. |
- Ethernet using click board for ENC28J60 SPI1 RD2 and RD3 remapped for this. 
- The communication choice is chosen at compile time.
- Status LEDs: LED1 RA6 (heartbeat), LED2 RA7, LED3 RE0, LED4 RE1.
- Axis pins (`Pins.c`):

  | Axis | Step | Dir  | Min  | limit |
  | ---- | ---- | ---- | ---- | ----  |
  |   X  | RD0  | RF12 | RF2  |       |
  |   Y  | RF13 | RB15 | RB8  |       |
  |   Z  | RF8  | RC13 | RB10 |       |

  All drivers share one active-low enable, `EN_Steppers` on **RF3** (Grbl Uno
  shield style). These are the Flip&Click pins. The original
  Clicker2 map is kept in `Pins.c`; select the board with `BOARD` in `Pins.h`.

  RC13 is the SOSC1 pin, so the secondary oscillator is disabled (FSOSCEN = 0
  in DEVCFG1). The limits (active low) are sampled in the Timer1 10 ms ISR.
  Pull-ups are off (`CNPUx = 0`), so unused limit inputs float.

- ENC28J60 ETH click in mikroBUS **C** on SPI1 (`Tcp_Ethernet.c`):
  SCK1 RD1, SDI1 RD2, SDO1 RD3, CS **RD12**, reset **RG14** (active low, held high). 
  ----------------------------------------------------------------------
  |  Static IP   |      mask     |  gateway    |  Port  | functionality |
  | ------------ |-------------- | ----------- | ------ | ------------- |
  |  10.0.0.200  | 255.255.255.0 |  10.0.0.1   |   23   |  half duplex  |
  -----------------------------------------------------------------------
  At boot the firmware resets the chip and waits up to 50 ms for its clock-ready bit. Without the
  board it skips Ethernet and boots normally. `$I` reports which happened.
  Grbl is served on TCP port 23; see the host link section of the
  [Protocol README](./Notes%20and%20Todo/Protocol%20README.md).

## Building

The project builds with MikroC PRO for PIC32. Either open
`Pic32mzClicker2_StepperControl.mcp32` in the MikroC IDE, or use the generated
[Makefile](./Makefile) from VS Code:

```powershell
make          # build
make rebuild  # clean, then build
make flash    # build, then program the board
```

The output is `Pic32mzClicker2_StepperControl.hex`. Notes on the compiler's
command-line quoting and the slow-build problem are in
[makefile.md](./makefile.md).

### MikroC pitfalls found so far

- `ulong2flt(buffA[OFFSET + k])` inside a loop compiles incorrectly: the
  loaded value is used as an address, which causes a bus error at boot. Use
  one explicit line per index (see `settings_apply_row()` in `Globals.c`).
- `UART_Init_Advanced` expects SYSCLK in kHz (`200000`), not the peripheral
  bus clock.
- #define CORE_TIMER_INTERRUPT_PERIOD_VALUE  0xf4240 does not automatiaclly
  assign 32bit word, it assigns 16bit by default, for 32bit decleration of
  a macrk use the UL qualifier, 1000000UL instead, memory will be wrongly allocated.
- `data` is a reserved memory qualifier, so it cannot be a variable name.
- The installed `__EthEnc28j60.h` declares a 7-argument `SPI_Ethernet_Init`,
  but `__Lib_EthEnc28j60` takes `(mac, ip, fullDuplex)` and finds its pins
  through the `SPI_Ethernet_CS`/`SPI_Ethernet_Rst` sbits (`Pins.c`).
  `Tcp_Ethernet.c` declares the library functions itself.
- `__Lib_EthEnc28j60` exports more than the help file lists (for example
  `sendUDP`, `TXpacket`, `UserTimerSec`), but nothing that sends TCP data
  on its own. TCP data only leaves as the reply returned from
  `SPI_Ethernet_UserTCP`.

## Source layout

| File                    | Purpose                                                                                              |
| ----------------------  | ---------------------------------------------------------------------------------------------------- |
| `Main.c`                | Main loop, execution of accepted G-code lines, motion dispatch, non-modal actions                    |
| `Protocol.c`            | Line reader, `$` commands, G-code tokenizer, realtime command handling                               |
| `GCODE.c`               | Parser state, modal groups, G/M code decoding                                                        |
| `Print.c`               | All Grbl replies: `ok`/`error:n`, reports, settings and status                                       |
| `Serial_Dma.c`          | UART2 RX interrupt ring buffer, DMA TX, `dma_printf`, host link (serial or Ethernet)                 |
| `Tcp_Ethernet.c`        | ENC28J60 presence check, init, packet polling, Grbl on TCP port 23                                   |
| `Globals.c`             | Settings in RAM and flash, defaults, `$n=` mapping, `$RST`                                           |
| `Flash_R_W.c`           | NVM page erase, row and word write, unlock sequence                                                  |
| `Config.c`              | Pin, PPS, clock and peripheral setup at boot                                                         |
| `Stepper.c`, `Timers.c` | DDS step engine and `Pulse()` ramp in the Timer8 tick (priority 7), Timer1 10 ms clock and limit sampling (priority 6)     |
| `Kinematics.c`, `Planner.c`, `Steptodistance.c` | Coordinated linear moves, arcs, ramp setup (`speed_cntr_Move`), mm to steps  |
| `Limits.c`              | Limit sampling and debouncing, hard-limit stop                                                       |
| `Settings.h`            | Firmware version, defaults, axis count, `STEP_ENGINE_READY` and `HOMING_READY` switches              |
| `coretimer.c`           | Coretimer runs continously and the ISR can be used for the limits to free up timer1                  |

`Planner.c` currently contains ramp setup and arc calculations, not a
lookahead planner. The legacy homing code remains in `Kinematics.c` for
reference but is disabled and needs reworking for DDS.

## Settings storage

Settings, work offsets (G54–G59, G28, G30) and the two startup lines are kept
in one flash page at virtual address `0xBD1BC000`. A marker word
(`0x7FFF0101`) marks the page as valid.

- At boot, flash is only read. If the marker is missing, defaults are loaded
  into RAM and flash is left untouched.
- The first `$n=`, `$Nn=`, `$RST=`, G10 or G28.1/G30.1 erases the page and
  writes the whole row, including the marker.

## Documentation

- [Protocol README](./Notes%20and%20Todo/Protocol%20README.md): the Grbl 1.1
  serial protocol as this firmware implements it, with supported commands,
  replies and TODOs.
- [DDS motion progress](./Notes%20and%20Todo/DDS%20motion%20progress.md): the
  step engine experiment.
- [UGS Wiki](./Notes%20and%20Todo/UGS%20Wiki/): a local copy of the Universal
  Gcode Sender documentation.
- Microchip datasheet and application notes (flash programming, DMA, timers,
  interrupts, output compare, CP0_MIPS) are in [Notes and Todo](./Notes%20and%20Todo/).
