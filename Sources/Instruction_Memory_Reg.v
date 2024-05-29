`timescale 1ns / 1ps


module Instruction_Memory_Reg(clk,IREN,RD,Instr);

input clk,IREN;
input [31:0]RD;
output reg signed[31:0]Instr;//We used signed here because we are storing some negative values inside memory.

always@(posedge clk)
begin
  if(IREN)
  Instr<=RD;
end
endmodule
