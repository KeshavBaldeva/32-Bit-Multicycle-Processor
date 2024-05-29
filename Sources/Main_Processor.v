`timescale 1ns / 1ps


module Main_Processor(clk,reset);

input clk,reset;

wire [31:0]Adr,WD;
wire MemWrite;

//Declaring Wires for Control Unit
wire IorD,IRWrite,PCWrite,Branch,ALUSrcA,RegWrite,RegDst,MemtoReg;
wire [1:0]ALUSrcB,ALUop,PCSrc;
Control_Unit Control_Unit(clk,reset,IorD,MemWrite,IRWrite,Instr[31:26],PCWrite,Branch,PCSrc,ALUop,ALUSrcB,ALUSrcA,RegWrite,RegDst,MemtoReg);


//ALU Controller
wire [2:0]ALUControl;
ALU_Control ALU_Decoder(Instr[5:0],ALUop,ALUControl);

//Control Combinational Unit
wire PCEN;
And_Or AND_OR(PCWrite,Branch,Zero,PCEN);

//Instruction/Data memory and its registers
wire [31:0]RD;
Memory Instruction_Data_Memory(clk,Adr,MemWrite,WD,RD); 

wire [31:0]Instr;
Instruction_Memory_Reg IM_Reg(clk,IRWrite,RD,Instr);

wire [31:0]Data;
Data_Memory_Reg DM_Reg(clk,RD,Data);


//Register File and its Register
wire [31:0]RD1,RD2;
Register_File Register_File(clk,Instr[25:21],Instr[20:16],mout2,mout3,RD1,RD2,RegWrite);

wire [31:0]A,B;
Register_File_Reg RF_Reg(clk,RD1,RD2,A,WD);

//MUX 2
wire [4:0]mout2;
MUX_2x1 #(.n(5)) Mux_2(RegDst,Instr[20:16],Instr[15:11],mout2);

//MUX 3
wire [31:0]mout3;
MUX_2x1 Mux_3(MemtoReg,ALUOut,Data,mout3);


//MUX 1
MUX_2x1 Mux_1(IorD,PCout,ALUOut,Adr);


//Program Counter
wire [31:0]PCout;
PC Program_Counter(clk,reset,mout6,PCEN,PCout);

//MUX 4
wire [31:0]mout4;
MUX_2x1 Mux_4(ALUSrcA,PCout,A,mout4);

//MUX 5
wire [31:0]mout5;
MUX_4x1 Mux_5(ALUSrcB,B,4,extended,shifted,mout5);


//Sig Extention
wire [31:0]extended;
Sign_Extend Sign_Extend(Instr[15:0],extended);

//shifter
wire [31:0]shifted;
Shifter Shift(extended,shifted);


//ALU
wire [31:0]ALUResult,ALUOut;
wire Zero;
ALU ALU(mout4,mout5,ALUControl,ALUResult,Zero,clk,ALUOut);

//MUX 6
wire [31:0]mout6;
MUX_4x1 Mux_6(PCSrc,ALUResult,ALUOut,in2,32'bz,mout6);


//Jump Instrution
wire [31:0]PCJump;
Jump_Address Jump(PCout,Instr,PCJump);

endmodule
