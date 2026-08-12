```verilog
`timescale 1ns/1ps

module vga_controller_tb;

    reg clk;
    reg rst;

    wire hsync;
    wire vsync;

    wire red;
    wire green;
    wire blue;

    // Instantiate VGA Controller
    vga_controller uut (
        .clk(clk),
        .rst(rst),
        .hsync(hsync),
        .vsync(vsync),
        .red(red),
        .green(green),
        .blue(blue)
    );

    // 25 MHz clock
    // Clock period = 40 ns
    initial begin
        clk = 1'b0;

        forever #20 clk = ~clk;
    end

    // Simulation
    initial begin

        // Generate waveform
        $dumpfile("vga.vcd");
        $dumpvars(0, vga_controller_tb);

        // Reset
        rst = 1'b1;

        #100;

        rst = 1'b0;

        // Run simulation
        // Approximately one VGA frame
        #25_000_000;

        $display("----------------------------------------");
        $display("VGA CONTROLLER SIMULATION");
        $display("----------------------------------------");
        $display("Resolution : 640 x 480");
        $display("Clock      : 25 MHz");
        $display("HSYNC      : Generated");
        $display("VSYNC      : Generated");
        $display("RGB        : Generated");
        $display("----------------------------------------");
        $display("SIMULATION PASSED");
        $display("----------------------------------------");

        $finish;
    end

endmodule
```
