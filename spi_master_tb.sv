`timescale 1ns / 1ps
module tb;

    reg clk = 0;
    reg rst = 0;
    reg tx_enable = 0;
    wire mosi;
    wire ss;
    wire sclk;
    
    always #5 clk = ~clk;
    
    initial begin
    rst = 1;
    repeat(5) @(posedge clk);
    rst = 0;
    end

    initial begin
    tx_enable = 0;
    repeat(5) @(posedge clk);
    tx_enable = 1;
    end

    initial begin 
        #2000000;  // Wait for 2000 ns (extend simulation time)
        $stop;  // End simulation
        end
fsm_spi dut (clk, rst, tx_enable, mosi, ss, sclk);

endmodule
