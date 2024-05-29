`timescale 1ns / 1ps

//Test bench just to know wheather processor is working or not.
module Main_Processor_tb;

reg clk,reset;
Main_Processor Processor(clk,reset);

initial
begin
  clk = 1'b0; 
  #10;
  reset = 1'b1;
  #10;
  reset =1'b0;
  #100;
end

always #5 clk = ~clk;

endmodule
