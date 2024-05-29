`timescale 1ns / 1ps


module Register_File_Reg(clk,R_RD1,R_RD2,A,B);

input clk;
input [31:0]R_RD1,R_RD2;
output reg [31:0]A,B;

always@(posedge clk)
begin
  A<=R_RD1;
  B<=R_RD2;
end
endmodule
