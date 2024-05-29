`timescale 1ns / 1ps


module PC(clk,reset,PCin,PCEN,PCout);

input clk,reset,PCEN;
input [31:0]PCin;
output reg [31:0]PCout;
// We can also use signed PCout when the we also need to handle with negative address
// if reset = 1 then reset the PC
always@(posedge clk)
begin
  if(reset) PCout<=0;
  else if(PCEN) PCout<=PCin;
end 

endmodule
