`timescale 1ns / 1ps


module Sign_Extend(Imm,extended);

input [15:0]Imm;
output reg [31:0]extended;

always@(*)
begin
  extended = {{16{Imm[15]}},Imm[15:0]};
end

endmodule
