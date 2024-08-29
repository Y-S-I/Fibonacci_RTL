`timescale 1ns / 1ps


module top_module(clk,reset);
    input clk;
    input reset;
    
    reg [4:0] n;
    reg[31:0] out;
    reg next_in;
    reg [26:0] one_sec;
    reg next_en;
    
    fibo_rtl d1(clk,n,next_en,out,next_in);
    
    always@(posedge clk)begin
        if(reset)begin
            n <= 'd0;
            next_en <= 1'b0;
            one_sec <= 'd0;
        end
        else begin
            if(next_in)
                one_sec <= one_sec + 1'b1;
            if(one_sec + 1'b1 == 'd100000000)begin
                n <= n + 1'b1;
                next_en <= 1'b1;
            end
            else 
                next_en <= 1'b0;
        end
    end
    
endmodule
