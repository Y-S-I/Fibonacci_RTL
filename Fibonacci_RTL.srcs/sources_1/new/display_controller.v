`timescale 1ns / 1ps


module display_controller(clk,fibo_out,AN,digit_switch);
    input clk;
    input [12:0] fibo_out; 
    output reg [3:0] AN=4'b0111;
    output reg [6:0] digit_switch=7'b0001110;
    
    reg [6:0] dig0=7'b0001110;
    reg [6:0] dig1=7'b0001110;
    reg [6:0] dig2=7'b0001110;
    reg [6:0] dig3=7'b0001110;
    
    reg enable=1'b0;
    reg[16:0] one_milli='d0;
    
    always@(posedge clk)begin
        if(enable)
            enable <= 1'b0;
        else
            one_milli <= one_milli + 1'b1;
        if(one_milli + 1'b1 == 'd100000)begin
            enable <= 1'b1;
            one_milli <= 'd0;
        end
    end
    
    always@(posedge clk)begin
        if(enable)begin
            AN <= {AN[2:0],AN[3]};
            case(fibo_out)
                'd0:begin
                    dig3<=7'b1000000;
                    dig2<=7'b1000000;
                    dig1<=7'b1000000;
                    dig0<=7'b1000000;
                end
                'd1:begin
                    dig3<=7'b1111001;
                    dig2<=7'b1000000;
                    dig1<=7'b1000000;
                    dig0<=7'b1000000;
                end

                'd2:begin
                    dig3<=7'b0100100;
                    dig2<=7'b1000000;
                    dig1<=7'b1000000;
                    dig0<=7'b1000000;
                end
                'd3:begin
                    dig3<=7'b0110000;
                    dig2<=7'b1000000;
                    dig1<=7'b1000000;
                    dig0<=7'b1000000;
                end
                'd5:begin
                    dig3<=7'b0010010;
                    dig2<=7'b1000000;
                    dig1<=7'b1000000;
                    dig0<=7'b1000000;
                end
                'd8:begin
                    dig3<=7'b0000000;
                    dig2<=7'b1000000;
                    dig1<=7'b1000000;
                    dig0<=7'b1000000;
                end
                'd13:begin
                    dig3<=7'b0110000;
                    dig2<=7'b1111001;
                    dig1<=7'b1000000;
                    dig0<=7'b1000000;
                end
                'd21:begin
                    dig3<=7'b1111001;
                    dig2<=7'b0100100;
                    dig1<=7'b1000000;
                    dig0<=7'b1000000;
                end
                'd34:begin
                    dig3<=7'b0011001;
                    dig2<=7'b0110000;
                    dig1<=7'b1000000;
                    dig0<=7'b1000000;
                end
                'd55:begin
                    dig3<=7'b0010010;
                    dig2<=7'b0010010;
                    dig1<=7'b1000000;
                    dig0<=7'b1000000;
                end
                'd89:begin
                    dig3<=7'b0010000;
                    dig2<=7'b0000000;
                    dig1<=7'b1000000;
                    dig0<=7'b1000000;
                end
                'd144:begin
                    dig3<=7'b0011001;
                    dig2<=7'b0011001;
                    dig1<=7'b1111001;
                    dig0<=7'b1000000;
                end
                'd233:begin
                    dig3<=7'b0110000;
                    dig2<=7'b0110000;
                    dig1<=7'b0100100;
                    dig0<=7'b1000000;
                end
                'd377:begin
                    dig3<=7'b1111000;
                    dig2<=7'b1111000;
                    dig1<=7'b0110000;
                    dig0<=7'b1000000;
                end
                'd610:begin
                    dig3<=7'b1000000;
                    dig2<=7'b1111001;
                    dig1<=7'b0000010;
                    dig0<=7'b1000000;
                end
                'd987:begin
                    dig3<=7'b1111000;
                    dig2<=7'b0000000;
                    dig1<=7'b0010000;
                    dig0<=7'b1000000;
                end
                'd1597:begin
                    dig3<=7'b1111000;
                    dig2<=7'b0010000;
                    dig1<=7'b0010010;
                    dig0<=7'b1111001;
                end
                'd2584:begin
                    dig3<=7'b0011001;
                    dig2<=7'b0000000;
                    dig1<=7'b0010010;
                    dig0<=7'b0100100;
                end
                'd4181:begin
                    dig3<=7'b1111001;
                    dig2<=7'b0000000;
                    dig1<=7'b1111001;
                    dig0<=7'b0011001;
                end
                'd6765:begin
                    dig3<=7'b0010010;
                    dig2<=7'b0000010;
                    dig1<=7'b1111000;
                    dig0<=7'b0000010;
                end
                default:begin
                    dig3<=7'b0001110;
                    dig2<=7'b0001110;
                    dig1<=7'b0001110;
                    dig0<=7'b0001110;
                end
            endcase
        end
    end
    
    always@(*)begin
        case(AN)
            4'b0111: digit_switch = dig0;
            4'b1011: digit_switch = dig1;
            4'b1101: digit_switch = dig2;
            4'b1110: digit_switch = dig3;
            default: digit_switch = 7'b0001110;
        endcase
    end
endmodule
