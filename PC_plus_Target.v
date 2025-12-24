`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2025 13:40:36
// Design Name: 
// Module Name: PC_plus_Target
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


module PC_plus_Target(
    input  [31:0] PC_Src_1,
    input  [31:0] Extended,
    output [31:0] PC_Src_2
);

    assign PC_Src_2 = PC_Src_1 + Extended;


endmodule

