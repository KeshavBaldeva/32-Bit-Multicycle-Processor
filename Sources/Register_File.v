`timescale 1ns / 1ps


module Register_File(clk,A1,A2,WA3,WD3,RD1,RD2,WE3);

input WE3,clk; //control signal and clock
input [4:0]A1,A2,WA3;
input [31:0]WD3;
output [31:0]RD1,RD2;

reg [31:0] RF[0:31];// memory

assign RD1 = RF[A1];
assign RD2 = RF[A2];

integer i;

initial 
begin
 for(i=0;i<32;i=i+1) 
 RF[i]<=0;            // Providing initial values to memory
end

always@(posedge clk)
begin
  if(WE3)
  RF[WA3]<= WD3;
end 

endmodule
