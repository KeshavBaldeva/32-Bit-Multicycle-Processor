`timescale 1ns / 1ps


module ALU_Control(Funct,ALUop,ALUControl);
input [5:0]Funct;
input [1:0]ALUop;
output reg [2:0]ALUControl;//This works as a ALUop code 

always@(*)
begin
  case(ALUop)
   2'b00: ALUControl = 3'b010;//Addition
   2'b01: ALUControl = 3'b011;//Subtraction
   2'b1x: case(Funct)
           6'b100000: ALUControl = 3'b101;//Add
           6'b100010: ALUControl = 3'b110;//Subtract
           6'b100100: ALUControl = 3'b000;//And
           6'b100101: ALUControl = 3'b001;//Or
           6'b101010: ALUControl = 3'b111;//set less than
           default:ALUControl = 3'bzzz;
          endcase
  endcase
end

endmodule
