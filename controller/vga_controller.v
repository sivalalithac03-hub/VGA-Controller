```verilog
`timescale 1ns/1ps

module vga_controller (
    input  wire clk,
    input  wire rst,

    output reg hsync,
    output reg vsync,

    output reg red,
    output reg green,
    output reg blue
);

    // VGA 640x480 timing
    // Horizontal total = 800
    // Vertical total   = 525

    reg [9:0] h_count;
    reg [9:0] v_count;

    // Horizontal counter
    always @(posedge clk) begin
        if (rst) begin
            h_count <= 10'd0;
        end
        else begin
            if (h_count == 10'd799)
                h_count <= 10'd0;
            else
                h_count <= h_count + 1'b1;
        end
    end

    // Vertical counter
    always @(posedge clk) begin
        if (rst) begin
            v_count <= 10'd0;
        end
        else begin
            if (h_count == 10'd799) begin
                if (v_count == 10'd524)
                    v_count <= 10'd0;
                else
                    v_count <= v_count + 1'b1;
            end
        end
    end

    // Horizontal Sync
    always @(*) begin
        if ((h_count >= 10'd656) &&
            (h_count < 10'd752))
            hsync = 1'b0;
        else
            hsync = 1'b1;
    end

    // Vertical Sync
    always @(*) begin
        if ((v_count >= 10'd490) &&
            (v_count < 10'd492))
            vsync = 1'b0;
        else
            vsync = 1'b1;
    end

    // RGB Color Generation
    always @(*) begin

        // Default black
        red   = 1'b0;
        green = 1'b0;
        blue  = 1'b0;

        // Active display area
        if ((h_count < 10'd640) &&
            (v_count < 10'd480)) begin

            // Red rectangle
            if ((h_count >= 10'd160) &&
                (h_count < 10'd480) &&
                (v_count >= 10'd120) &&
                (v_count < 10'd360)) begin

                red   = 1'b1;
                green = 1'b0;
                blue  = 1'b0;
            end

            // Green region
            else if (h_count < 10'd320) begin

                red   = 1'b0;
                green = 1'b1;
                blue  = 1'b0;
            end

            // Blue region
            else begin

                red   = 1'b0;
                green = 1'b0;
                blue  = 1'b1;
            end
        end
    end

endmodule
```
