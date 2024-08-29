`timescale 1ns / 1ps


module syn_tb_fibo(clk,reset,AN,digit_switch);
    input clk;
    input reset;
    output [3:0] AN;
    output [6:0] digit_switch;

    reg [4:0] n;
    wire[12:0] out;
    wire next_in;
    reg [26:0] one_sec;
    reg next_en;
    
    fibo_rtl d1(clk,n,reset,next_en,out,next_in);
    
    display_controller hex_display(clk,out,AN,digit_switch);
    
    always@(posedge clk)begin
        if(reset)begin
            n <= 'd0;
            next_en <= 1'b0;
            one_sec <= 'd0;
        end
        else begin
            if(next_in== 1'b1 && next_en!= 1'b1)
                one_sec <= one_sec + 1'b1;
            if(next_en)begin
                if(n + 1'b1 == 'd21)
                    n <= 'd0;
                else
                    n <= n + 1'b1;    
            end
            if(one_sec + 1'b1 == 'd100000000)begin
                next_en <= 1'b1;
                one_sec  <= 'd0;
            end
            else 
                next_en <= 1'b0;
        end
    end
    
    
endmodule
