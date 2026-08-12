# VGA Controller in Verilog

## Description

This project implements a simple **VGA Controller using Verilog HDL**. It generates the horizontal synchronization (`HSYNC`) and vertical synchronization (`VSYNC`) signals required for a VGA display.

The design uses horizontal and vertical counters to control the pixel position and generates RGB signals to display a simple color pattern.

The project is designed for **640 × 480 VGA resolution** with a **25 MHz clock**.

## Features

* Verilog HDL implementation
* 640 × 480 VGA resolution
* 25 MHz clock
* Horizontal synchronization
* Vertical synchronization
* RGB color generation
* Simple red, green and blue display pattern
* Testbench included
* VCD waveform generation
* GTKWave simulation support

## VGA Timing

### Horizontal Timing

| Parameter    |      Value |
| ------------ | ---------: |
| Visible Area | 640 pixels |
| Front Porch  |  16 pixels |
| Sync Pulse   |  96 pixels |
| Back Porch   |  48 pixels |
| Total        | 800 pixels |

### Vertical Timing

| Parameter    |     Value |
| ------------ | --------: |
| Visible Area | 480 lines |
| Front Porch  |  10 lines |
| Sync Pulse   |   2 lines |
| Back Porch   |  33 lines |
| Total        | 525 lines |

## Block Diagram

```text
                  +-----------------------+
                  |    VGA CONTROLLER     |
                  |                       |
       CLK ------>| Horizontal Counter    |----> HSYNC
                  |                       |
                  | Vertical Counter      |----> VSYNC
                  |                       |
                  | RGB Generator         |
                  |                       |
                  +-----------+-----------+
                              |
                              v
                         RGB OUTPUT
                       R   G   B
```

## Working

The VGA controller contains two counters:

### Horizontal Counter

The horizontal counter counts from `0` to `799`.

```text
0 ───────────────────────────────> 799
       One complete VGA line
```

It controls the horizontal synchronization signal.

### Vertical Counter

The vertical counter counts from `0` to `524`.

```text
0 ───────────────────────────────> 524
       One complete VGA frame
```

It controls the vertical synchronization signal.

## RGB Output

During the visible 640 × 480 area, the controller generates a simple color pattern.

```text
+--------------------------------+
|          |                     |
|  GREEN   |        BLUE         |
|          |                     |
|    +--------------------+      |
|    |        RED         |      |
|    |     RECTANGLE      |      |
|    +--------------------+      |
|          |                     |
|  GREEN   |        BLUE         |
|          |                     |
+--------------------------------+
```

## Project Structure

```text
VGA-Controller-Verilog/
│
├── README.md
│
├── src/
│   └── vga_controller.v
│
├── tb/
│   └── vga_controller_tb.v
│
└── simulation/
    └── simulation_output.txt
```

## Simulation

### Compile

```bash
iverilog -o vga_sim src/vga_controller.v tb/vga_controller_tb.v
```

### Run

```bash
vvp vga_sim
```

### Expected Output

```text
----------------------------------------
VGA CONTROLLER SIMULATION
----------------------------------------
Resolution : 640 x 480
Clock      : 25 MHz
HSYNC      : Generated
VSYNC      : Generated
RGB        : Generated
----------------------------------------
SIMULATION PASSED
----------------------------------------
```

## Waveform

The testbench generates a VCD file:

```text
vga.vcd
```

Open it using:

```bash
gtkwave vga.vcd
```

The following signals can be observed:

```text
clk
rst
hsync
vsync
red
green
blue
```

The waveform demonstrates the VGA timing and RGB signal generation.

## Applications

VGA controllers can be used in:

* FPGA projects
* Display systems
* Embedded systems
* Digital graphics
* FPGA games
* Image processing
* Computer vision projects

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* Git
* GitHub

## Future Improvements

* Text display
* Image display
* Moving objects
* VGA game
* Keyboard control
* Multiple graphics
* Higher-resolution support

## Author

**Your Name**

## License


```
```
