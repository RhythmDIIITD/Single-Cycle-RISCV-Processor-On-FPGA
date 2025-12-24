`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2025 13:27:23
// Design Name: 
// Module Name: Imm_Extend
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


module Imm_Extend(
    input  [31:0] Instruction,
    input  [1:0]  ImmSRC,
    output reg [31:0] Extended
);

    always @(*) begin
        case (ImmSRC)

            
            2'b00: begin
                Extended = {{20{Instruction[31]}}, Instruction[31:20]};
            end

            
            2'b01: begin
                Extended = {{20{Instruction[31]}},
                            Instruction[31:25],
                            Instruction[11:7]};
            end

           
            2'b10: begin
                Extended = {{19{Instruction[31]}},
                            Instruction[31],
                            Instruction[7],
                            Instruction[30:25],
                            Instruction[11:8],
                            1'b0};
            end

            default: begin
                Extended = 32'b0;
            end

        endcase
    end

endmodule
