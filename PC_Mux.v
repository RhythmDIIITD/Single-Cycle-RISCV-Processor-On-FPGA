`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2025 13:18:48
// Design Name: 
// Module Name: PC_Mux
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


module PC_Mux(
    input  [31:0] PC_Src_1,
    input  [31:0] PC_Src_2,
    input         PC_SRC,
    output reg [31:0] PC_Next
);

    always @(*) begin
        if (PC_SRC)
            PC_Next = PC_Src_2;
        else
            PC_Next = PC_Src_1;
    end

endmodule

