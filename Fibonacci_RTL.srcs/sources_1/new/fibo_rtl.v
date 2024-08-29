`timescale 1ns / 1ps

//refine code when you have time
module fibo_rtl(clk,n,reset,next_en,out,next_in);
    input clk;
    input[4:0] n;
    input reset;
    input next_en;
    output reg[12:0] out='d0;
    output reg next_in;
    
    reg[15:0] counter;
    reg [12:0] n_0='d0,n_1,n_2;
    
    always@(posedge clk) begin
        if(reset || next_en)begin
            counter <= 'd0;
            out <= 'd0;
            n_0<='d0; n_1<='d0; n_2<='d0;
            next_in <= 1'b0;
        end
        else begin
            if(counter == 'd0)begin
                n_0 <= 'd0;
                counter <= counter + 1'b1;
            end
            else if(counter == 'd1 && n!='d0)begin
                n_0 <= 'd1;
                n_1 <= 'd1;
                counter <= counter + 1'b1;
            end
            else begin
                if(counter <= n)begin
                    counter <= counter + 1'b1;
                    n_2 <= n_1;
                    n_1 <= n_2 + n_1 ;
                    n_0 <= n_2 + n_1;
                end
                else
                    next_in <= 1'b1;
            end
            out <= n_0;
        end
    end
    
endmodule
