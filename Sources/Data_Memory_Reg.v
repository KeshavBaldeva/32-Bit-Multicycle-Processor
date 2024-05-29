`timescale 1ns / 1ps


module Data_Memory_Reg(clk,RD,Data);

input clk;
input [31:0]RD;
output reg [31:0]Data;

always@(posedge clk)
begin
  Data<=RD;
end

endmodule
