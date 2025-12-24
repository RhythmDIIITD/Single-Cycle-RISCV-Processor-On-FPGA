`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2025 13:48:18
// Design Name: 
// Module Name: PC_And
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


module PC_And(
    input Branch,
    input Zero,
    output PC_SRC
    );
    assign PC_SRC  = Branch & Zero;
endmodule
