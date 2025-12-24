`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2025 13:12:25
// Design Name: 
// Module Name: Result_Mux
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


module Result_Mux(
    input  [31:0] Result_Src_1,
    input  [31:0] Result_Src_2,
    input         Result_SRC,
    output reg [31:0] Result
);

    always @(*) begin
        if (Result_SRC)
            Result = Result_Src_2;
        else
            Result = Result_Src_1;
    end

endmodule

