`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2025 11:02:58
// Design Name: 
// Module Name: PC
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


module PC( input [31:0] PC_next ,clk, output reg [31:0] instruction

    );
    reg [31:0] PC_current;
    always @(posedge clk) begin
            PC_current <= PC_next;
    end
    
    reg [31:0] instruction_memory [0:31];
    
    
    always @(posedge clk)begin
        instruction<=instruction_memory[PC_current[6:2]];
    end
    
    
    
    
    
endmodule
