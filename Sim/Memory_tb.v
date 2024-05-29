`timescale 1ns / 1ps


module Memory_tb;

reg [31:0]Adr,WD;
reg WE,clk;
wire [31:0]RD;

Memory Memory(clk,Adr,WE,WD,RD);

initial
begin
  clk = 1'b0;
  repeat (10)
  #5 clk = ~clk;
  $finish;    
end
    
initial 
begin
  Adr = 32'b0;
  WE = 1'b1;
  #5;
  WD=32'b1;
  #10
  WE = 1'b0; 
  #10 Adr = 6'b0;
  WD=32'b0 ;
  WE = 1'b1;
  #10 WE = 1'b0;
end
    
endmodule
