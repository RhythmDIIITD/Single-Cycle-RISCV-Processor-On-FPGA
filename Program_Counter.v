`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2025 12:21:01
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter(
    input Clk,
    input [31:0] PC_Next,
    output reg [31:0] PC_Current,
    input cpu_enable
    );
    
    initial PC_Current = 32'd0;
    always @(posedge Clk) begin
    if (cpu_enable)
        PC_Current <= PC_Next;
        end

endmodule
