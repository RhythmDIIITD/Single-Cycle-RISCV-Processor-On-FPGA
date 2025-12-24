`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2025 12:52:21
// Design Name: 
// Module Name: Data_Mem
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


module Data_Mem(
    input  [31:0] Address,
    input         Clk,
    input  [31:0] Write_Data,
    input         WE,
    output [31:0] Read_Data
);

    reg [31:0] mem [0:127];

    assign Read_Data = mem[Address[8:2]];

    always @(posedge Clk) begin
        if (WE) begin
            mem[Address[8:2]] <= Write_Data;
        end
    end

endmodule

