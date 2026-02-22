`timescale 1ns / 1ps

module Moore_1011_NonOverlap(
    input clk,rst,x,
    output reg y);
    
    parameter A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100;
    reg[2:0] state, next_state;
    
    always @(posedge clk or posedge rst)begin
        if (rst) state<=A;
        else state<=next_state;
    end
    
    always @(*)begin
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
            if(x) next_state=E;
            else next_state=C;
          end
          E:begin 
            if(x) next_state=B;
            else next_state=A;
          end
         default: next_state=A;
       endcase
    end
    always@ (*) begin
        case(state)
            E: y=1;
            default: y=0;
        endcase
    end     
endmodule