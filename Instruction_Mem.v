`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2025 12:25:08
// Design Name: 
// Module Name: Instruction_Mem
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


module Instruction_Mem(
    input  [31:0] PC_Current,
    output [31:0] Instruction
);

    reg [31:0] mem [0:31];

initial begin

    mem[0] = 32'b00000000000000000000000001111111;

    mem[1] = 32'b00000010101000000000000010010011;

    mem[2] = 32'b00000001000000000000000100010011;

    mem[3] = 32'b00000000000000000000000000010011;

    mem[4] = 32'b00000000000100010010000000100011;

    mem[5] = 32'b00000000000000000000000000010011;

    mem[6] = 32'b00000000000000010010000110000011;

end










    assign Instruction = mem[PC_Current[31:2]];

endmodule


