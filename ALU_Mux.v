`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2025 13:15:20
// Design Name: 
// Module Name: ALU_Mux
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


module ALU_Mux(
    input  [31:0] ALU_Src_1,
    input  [31:0] ALU_Src_2,
    input  ALU_SRC,
    output reg [31:0] Data_2
);

    always @(*) begin
        if (ALU_SRC)
            Data_2 = ALU_Src_2;
        else
            Data_2 = ALU_Src_1;
    end

endmodule
