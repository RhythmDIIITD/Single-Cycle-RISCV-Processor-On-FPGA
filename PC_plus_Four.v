`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2025 13:37:43
// Design Name: 
// Module Name: PC_plus_Four
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


module PC_plus_Four(
    input [31:0] PC_Current,
    output [31:0] PC_Src_1
    );
    
    assign PC_Src_1 = PC_Current + 4;
endmodule
