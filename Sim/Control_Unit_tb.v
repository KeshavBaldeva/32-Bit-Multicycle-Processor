`timescale 1ns / 1ps


module Control_Unit_tb;

wire IorD,MemWrite,IRWrite,PCWrite,Branch,ALUSrcA,RegWrite,RegDst,MemtoReg;
wire [1:0]ALUSrcB,ALUop,PCSrc;
reg clk,reset;
reg [5:0]Opcode;

Control_Unit CU(clk,reset,IorD,MemWrite,IRWrite,Opcode,PCWrite,Branch,PCSrc,ALUop,ALUSrcB,ALUSrcA,RegWrite,RegDst,MemtoReg);

initial
begin
  clk=0;
  reset = 1 ;
  forever #5 clk = ~clk;
end

initial
begin
  reset = 0;
  Opcode = 6'b000000;
  #40;
  Opcode = 6'b100011;
  #50;
  Opcode = 6'b000100;
  #30;
  Opcode = 6'b000010;
  #30;
  Opcode = 6'b101011;
  #40;
  $finish;
end

endmodule
