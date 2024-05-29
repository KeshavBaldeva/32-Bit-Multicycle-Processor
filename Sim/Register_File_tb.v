`timescale 1ns / 1ps


module Register_File_tb;

reg WE3,clk;
reg [4:0]A1,A2,WA3;
reg [31:0]WD3;
wire [31:0]RD1,RD2;

Register_File RF(clk,A1,A2,WA3,WD3,RD1,RD2,WE3);

initial 
begin
  clk = 1'b0;
  repeat (10)
  #5 clk = ~clk;
  $finish;    
end

initial
begin
  WE3=1'b1;
  WA3=5'b0;
  #5 WD3=32'b1;
  #5 WA3 = 5'b01000;
  #5 WD3 = 32'b0;
  
  #10 A1=5'b0;
  A2 = 5'b01000;
  #10;
  $finish;
end

endmodule
