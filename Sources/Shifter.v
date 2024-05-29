`timescale 1ns / 1ps


module Shifter(in,shifted);

input [31:0]in;
output [31:0]shifted;

assign shifted = in<<2;

endmodule
