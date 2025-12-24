`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2025 13:30:06
// Design Name: 
// Module Name: top_fpga
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


module top_fpga (
    input wire clk_100mhz
);

    // -------------------------------------------------
    // Internal wires for observation
    // -------------------------------------------------
    wire [31:0] PC_Current;
    wire [31:0] Instr;

    wire [31:0] x0,  x1,  x2,  x3;
    wire [31:0] x4,  x5,  x6,  x7;
    wire [31:0] x8,  x9,  x10, x11;
    wire [31:0] x12, x13, x14, x15;
    wire [31:0] x16, x17, x18, x19;
    wire [31:0] x20, x21, x22, x23;
    wire [31:0] x24, x25, x26, x27;
    wire [31:0] x28, x29, x30, x31;

    // -------------------------------------------------
    // VIO control signal
    // -------------------------------------------------
    wire cpu_enable;

    // -------------------------------------------------
    // CPU instance
    // -------------------------------------------------
    Top_Module cpu (
        .clk(clk_100mhz),
        .PC_Current(PC_Current),
        .Instr(Instr),
        .cpu_enable(cpu_enable),

        .x0(x0),   .x1(x1),   .x2(x2),   .x3(x3),
        .x4(x4),   .x5(x5),   .x6(x6),   .x7(x7),
        .x8(x8),   .x9(x9),   .x10(x10), .x11(x11),
        .x12(x12), .x13(x13), .x14(x14), .x15(x15),
        .x16(x16), .x17(x17), .x18(x18), .x19(x19),
        .x20(x20), .x21(x21), .x22(x22), .x23(x23),
        .x24(x24), .x25(x25), .x26(x26), .x27(x27),
        .x28(x28), .x29(x29), .x30(x30), .x31(x31)
    );

    // -------------------------------------------------
    // VIO instance
    // -------------------------------------------------
    vio_0 vio (
        .clk(clk_100mhz),
        .probe_out0(cpu_enable)
    );

    // -------------------------------------------------
    // ILA instance (PC + Instr + x1, x2, x3)
    // -------------------------------------------------
    ila_0 ila (
        .clk(clk_100mhz),
        .probe0(PC_Current),
        .probe1(Instr),
        .probe2(x1),
        .probe3(x2),
        .probe4(x3)
    );

endmodule


