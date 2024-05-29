`timescale 1ns / 1ps

// We are designing the register for Alu with the ALU here
module ALU(SrcA,SrcB,ALUop,ALUResult,Zero,clk,ALUOut);

input [31:0]SrcA,SrcB;
input [2:0]ALUop;
output reg [31:0]ALUResult;
output Zero;
input clk;
output reg [31:0]ALUOut;

always@(*)
begin
  case(ALUop)
    3'b000: ALUResult = SrcA & SrcB ;//and
    3'b001: ALUResult = SrcA | SrcB ;//or
    3'b010: ALUResult = SrcA + SrcB ;//addition
    3'b110: ALUResult = SrcA - SrcB ;//subtraction
    3'b111: ALUResult = (SrcA < SrcB)? 1:0 ;//set less than
  endcase
end

assign Zero = (ALUResult == 0);

always@(posedge clk)
begin
   ALUOut<=ALUResult;
end
endmodule
