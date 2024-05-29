`timescale 1ns / 1ps


module And_Or(PCWrite,Branch,Zero,PCEN);

input PCWrite,Branch,Zero;
output reg PCEN;

always@(*)
begin
  PCEN = PCWrite | (Branch & Zero);
end
endmodule
