`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2025 12:42:55
// Design Name: 
// Module Name: Register_Memory
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


module Register_Memory(
    input [4:0] RA_1,
    input [4:0] RA_2,
    input [4:0] RA_3,
    input Clk,
    input [31:0] WD_3,
    input WE,
    input Rst,
    input cpu_enable,
    output [31:0] RD_1,
    output [31:0] RD_2
);

    reg [31:0] reg_file [0:31];
    integer i;

    always @(posedge Clk) begin
        if (Rst) begin
            i = 0;
            while (i < 32) begin
                reg_file[i] = 32'b0;
                i = i + 1;
            end
        end
        else if (WE && RA_3 != 5'b00000 && cpu_enable) begin
            reg_file[RA_3] <= WD_3;
        end
    end

    assign RD_1 = (RA_1 == 5'b00000) ? 32'b0 : reg_file[RA_1];
    assign RD_2 = (RA_2 == 5'b00000) ? 32'b0 : reg_file[RA_2];


    wire [31:0] reg0  = reg_file[0];
    wire [31:0] reg1  = reg_file[1];
    wire [31:0] reg2  = reg_file[2];
    wire [31:0] reg3  = reg_file[3];
    wire [31:0] reg4  = reg_file[4];
    wire [31:0] reg5  = reg_file[5];
    wire [31:0] reg6  = reg_file[6];
    wire [31:0] reg7  = reg_file[7];
    wire [31:0] reg8  = reg_file[8];
    wire [31:0] reg9  = reg_file[9];
    wire [31:0] reg10 = reg_file[10];
    wire [31:0] reg11 = reg_file[11];
    wire [31:0] reg12 = reg_file[12];
    wire [31:0] reg13 = reg_file[13];
    wire [31:0] reg14 = reg_file[14];
    wire [31:0] reg15 = reg_file[15];
    wire [31:0] reg16 = reg_file[16];
    wire [31:0] reg17 = reg_file[17];
    wire [31:0] reg18 = reg_file[18];
    wire [31:0] reg19 = reg_file[19];
    wire [31:0] reg20 = reg_file[20];
    wire [31:0] reg21 = reg_file[21];
    wire [31:0] reg22 = reg_file[22];
    wire [31:0] reg23 = reg_file[23];
    wire [31:0] reg24 = reg_file[24];
    wire [31:0] reg25 = reg_file[25];
    wire [31:0] reg26 = reg_file[26];
    wire [31:0] reg27 = reg_file[27];
    wire [31:0] reg28 = reg_file[28];
    wire [31:0] reg29 = reg_file[29];
    wire [31:0] reg30 = reg_file[30];
    wire [31:0] reg31 = reg_file[31];

endmodule

