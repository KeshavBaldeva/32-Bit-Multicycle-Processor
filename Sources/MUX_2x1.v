`timescale 1ns / 1ps

// We are making a single mux for all mux's 
module MUX_2x1 #(parameter n=32)(select,in0,in1,out);

input select;
input [n-1:0]in0,in1;
output reg[n-1:0]out; 

always@(*)
begin
  case(select)
    0:out<=in0;
    1:out<=in1;
    default:out<= 32'bx;
  endcase
end
endmodule
