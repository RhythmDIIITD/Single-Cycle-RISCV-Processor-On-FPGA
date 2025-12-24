`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2025 18:28:53
// Design Name: 
// Module Name: Top_Module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Top_Module (
    input clk,
    input cpu_enable,
    output [31:0] PC_Current,
    output [31:0] Instr,

  
    output [31:0] x0,  output [31:0] x1,  output [31:0] x2,  output [31:0] x3,
    output [31:0] x4,  output [31:0] x5,  output [31:0] x6,  output [31:0] x7,
    output [31:0] x8,  output [31:0] x9,  output [31:0] x10, output [31:0] x11,
    output [31:0] x12, output [31:0] x13, output [31:0] x14, output [31:0] x15,
    output [31:0] x16, output [31:0] x17, output [31:0] x18, output [31:0] x19,
    output [31:0] x20, output [31:0] x21, output [31:0] x22, output [31:0] x23,
    output [31:0] x24, output [31:0] x25, output [31:0] x26, output [31:0] x27,
    output [31:0] x28, output [31:0] x29, output [31:0] x30, output [31:0] x31
);



    wire [31:0] PC_Next;
    wire [31:0] PC_Src_1;     // PC + 4
    wire [31:0] PC_Src_2;     // PC + branch target
    wire        PC_SRC;


    wire [6:0] Opcode = Instr[6:0];
    wire [4:0] RD     = Instr[11:7];
    wire [2:0] Func3  = Instr[14:12];
    wire [4:0] RS1    = Instr[19:15];
    wire [4:0] RS2    = Instr[24:20];
    wire [6:0] Func7  = Instr[31:25];
    wire Rst;


    wire [1:0] ImmSRC;
    wire ResultSRC;
    wire Data_Mem_WE;
    wire Branch;
    wire ALUSRC;
    wire RegWrite;
    wire [2:0] ALUControl;


    wire [31:0] RD_1;
    wire [31:0] RD_2;



    wire [31:0] Extended;

 
    wire [31:0] ALU_Data_2;
    wire [31:0] ALU_Result;
    wire Zero;

    wire [31:0] Read_Data;

    wire [31:0] WB_Data;


    // Instruction Memory
    Instruction_Mem IMEM (
        .PC_Current(PC_Current),
        .Instruction(Instr)
    );

    // Control Unit
    Control_Unit CU (
        .Opcode(Opcode),
        .Func3(Func3),
        .Func7(Func7),
        .ImmSRC(ImmSRC),
        .Rst(Rst),
        .ResultSRC(ResultSRC),
        .Data_Mem_WE(Data_Mem_WE),
        .Branch(Branch),
        .ALUSRC(ALUSRC),
        .RegWrite(RegWrite),
        .ALUControl(ALUControl)
    );

    // Register File
    Register_Memory RF (
        .RA_1(RS1),
        .RA_2(RS2),
        .RA_3(RD),
        .Clk(clk),
        .WD_3(WB_Data),
        .WE(RegWrite),
        .cpu_enable(cpu_enable),
        .Rst(Rst),
        .RD_1(RD_1),
        .RD_2(RD_2)
    );

    assign x0  = RF.reg_file[0];
    assign x1  = RF.reg_file[1];
    assign x2  = RF.reg_file[2];
    assign x3  = RF.reg_file[3];
    assign x4  = RF.reg_file[4];
    assign x5  = RF.reg_file[5];
    assign x6  = RF.reg_file[6];
    assign x7  = RF.reg_file[7];
    assign x8  = RF.reg_file[8];
    assign x9  = RF.reg_file[9];
    assign x10 = RF.reg_file[10];
    assign x11 = RF.reg_file[11];
    assign x12 = RF.reg_file[12];
    assign x13 = RF.reg_file[13];
    assign x14 = RF.reg_file[14];
    assign x15 = RF.reg_file[15];
    assign x16 = RF.reg_file[16];
    assign x17 = RF.reg_file[17];
    assign x18 = RF.reg_file[18];
    assign x19 = RF.reg_file[19];
    assign x20 = RF.reg_file[20];
    assign x21 = RF.reg_file[21];
    assign x22 = RF.reg_file[22];
    assign x23 = RF.reg_file[23];
    assign x24 = RF.reg_file[24];
    assign x25 = RF.reg_file[25];
    assign x26 = RF.reg_file[26];
    assign x27 = RF.reg_file[27];
    assign x28 = RF.reg_file[28];
    assign x29 = RF.reg_file[29];
    assign x30 = RF.reg_file[30];
    assign x31 = RF.reg_file[31];

    // Immediate Generator
    Imm_Extend IMM (
        .Instruction(Instr),
        .ImmSRC(ImmSRC),
        .Extended(Extended)
    );

    // ALU source mux
    ALU_Mux ALU_MUX (
        .ALU_Src_1(RD_2),
        .ALU_Src_2(Extended),
        .ALU_SRC(ALUSRC),
        .Data_2(ALU_Data_2)
    );

    // ALU
    AL_Unit ALU (
        .Data_1(RD_1),
        .Data_2(ALU_Data_2),
        .ALU_Control(ALUControl),
        .Result(ALU_Result),
        .Zero(Zero)
    );

    // Data Memory
    Data_Mem DMEM (
        .Address(ALU_Result),
        .Clk(clk),
        .Write_Data(RD_2),
        .WE(Data_Mem_WE),
        .Read_Data(Read_Data)
    );

    // Writeback mux
    Result_Mux WB_MUX (
        .Result_Src_1(ALU_Result),
        .Result_Src_2(Read_Data),
        .Result_SRC(ResultSRC),
        .Result(WB_Data)
    );

    // PC + 4
    PC_plus_Four PC4 (
        .PC_Current(PC_Current),
        .PC_Src_1(PC_Src_1)
    );

    // PC + branch target
    PC_plus_Target PCT (
        .PC_Src_1(PC_Src_1),
        .Extended(Extended),
        .PC_Src_2(PC_Src_2)
    );

    // Branch AND
    PC_And PC_AND (
        .Branch(Branch),
        .Zero(Zero),
        .PC_SRC(PC_SRC)
    );

    // PC mux
    PC_Mux PC_MUX (
        .PC_Src_1(PC_Src_1),
        .PC_Src_2(PC_Src_2),
        .PC_SRC(PC_SRC),
        .PC_Next(PC_Next)
    );

    // PC register
    Program_Counter PC_REG (
        .Clk(clk),.cpu_enable(cpu_enable),
        .PC_Next(PC_Next),
        .PC_Current(PC_Current)
    );

endmodule

