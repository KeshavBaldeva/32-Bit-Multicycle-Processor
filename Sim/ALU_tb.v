`timescale 1ns / 1ps


module ALU_tb;

wire [31:0]ALUResult,ALUOut;
wire Zero;
reg [31:0]SrcA,SrcB;
reg [2:0]ALUop;
reg clk;

ALU ALU1(SrcA,SrcB,ALUop,ALUResult,Zero,clk,ALUOut);


initial 
begin
  clk = 0;
end 

always
begin
  #5 clk = ~clk;
end
    
initial 
begin
  SrcA = 32'b0111;
  SrcB = 32'b0011;
  ALUop = 3'b000;
  #10 ALUop = 3'b001;
  #10 ALUop = 3'b010;
  #10 ALUop = 3'b110;
  #10;
  $finish;
end

endmodule
