`timescale 1ns / 1ps

module Melay_1011_NonOverlap(
    input clk,rst,x,
    output reg y);
    
    parameter A=2'b00,B=2'b01,C=2'b10,D=2'b11;
    reg[1:0] state, next_state;
    
    always @(posedge clk or posedge rst)begin
        if (rst) state<=A;
        else state<=next_state;
    end
    
    always @(*)begin
        y=0; // default value
        case (state) 
        A:begin 
            if(x) next_state=B;
            else next_state=A;
          end
          B:begin 
            if(x) next_state=B;
            else next_state=C;
            end
          C:begin 
            if(x) next_state=D;
            else next_state=A;
          end
          D:begin 
            if(x)begin
                 next_state=A;
                 y=1;
                end
            else next_state=C;
            end
         default: next_state=A;
       endcase
    end
endmodule
