`timescale 1ns / 1ps


module Memory(clk,Adr,WE,WD,RD);
input WE,clk; // memory write 
input [31:0]Adr; // address 
input [31:0]WD;// Write data 
output reg [31:0]RD; // output

reg [31:0]MEM[511:0];

initial 
begin
  $readmemh("Mem_hex.mem",MEM);
end

always@(posedge clk)
begin
  if(WE)
  MEM[Adr[31:2]]<=WD;
end

always@(posedge clk)
begin
  RD<=MEM[Adr[31:2]];
end

//We can also use Byte level access by this code.

/*
always@(posedge clk) 
begin
  if(WE)
  begin
    MEM[Adr] <= WD[31:24];
    MEM[Adr+1] <= WD[23:16];
    MEM[Adr+2] <= WD[15:8];
    MEM[Adr+3] <= WD[7:0];
  end
end

always@(*)
begin   
  RD[31:24] <= MEM[Adr];
  RD[23:16] <= MEM[Adr+1];
  RD[15:8] <= MEM[Adr+2];
  RD[7:0] <= MEM[Adr+3];
end
*/

endmodule
