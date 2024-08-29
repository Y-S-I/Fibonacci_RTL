`timescale 1ns / 1ps

module tb_fibo_clock;
    reg clk;
    reg reset;
    wire [3:0]AN;
    wire [6:0] digit_switch;
    
    syn_tb_fibo DUT(clk,reset,AN,digit_switch);
    
    always #5 clk=~clk;
    
    initial begin
        clk=1'b0;
        reset=1'b1;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        reset=1'b0;
    end
    
endmodule
