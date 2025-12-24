`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2025 18:04:40
// Design Name: 
// Module Name: Control_Unit
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

module Control_Unit(
    input  [6:0] Opcode,
    input  [2:0] Func3,
    input  [6:0] Func7,

    output reg [1:0] ImmSRC,
    output reg Rst,
    output reg ResultSRC,
    output reg Data_Mem_WE,
    output reg Branch,
    output reg ALUSRC,
    output reg RegWrite,
    output reg [2:0] ALUControl
);

always @(*) begin
    // defaults
    ImmSRC      = 2'b00;
    Rst         = 1'b0;
    ResultSRC   = 1'b0;
    Data_Mem_WE = 1'b0;
    Branch      = 1'b0;
    ALUSRC      = 1'b0;
    RegWrite    = 1'b0;
    ALUControl  = 3'b010;   // ADD by default

    case (Opcode)

        // ================= R-type =================
        7'b0110011: begin
            RegWrite = 1'b1;
            ALUSRC   = 1'b0;

            case (Func3)
                3'b000: begin
                    if (Func7 == 7'b0100000)
                        ALUControl = 3'b110; // SUB
                    else
                        ALUControl = 3'b010; // ADD
                end
                3'b111: ALUControl = 3'b000; // AND
                3'b110: ALUControl = 3'b001; // OR
                3'b010: ALUControl = 3'b111; // SLT
            endcase
        end

        // ================= lw =================
        7'b0000011: begin
            RegWrite   = 1'b1;
            ALUSRC     = 1'b1;
            ResultSRC  = 1'b1;
            ImmSRC     = 2'b00;   // I-type
            ALUControl = 3'b010;  // ADD
        end

        // ================= sw =================
        7'b0100011: begin
            Data_Mem_WE = 1'b1;
            ALUSRC      = 1'b1;
            ImmSRC      = 2'b01;  // S-type
            ALUControl  = 3'b010; // ADD
        end

        // ================= beq =================
        7'b1100011: begin
            Branch     = 1'b1;
            ALUSRC     = 1'b0;
            ImmSRC     = 2'b10;   // B-type
            ALUControl = 3'b110;  // SUB
        end

        // ================= addi =================
        7'b0010011: begin
            RegWrite   = 1'b1;
            ALUSRC     = 1'b1;
            ResultSRC  = 1'b0;
            ImmSRC     = 2'b00;   // I-type
            ALUControl = 3'b010;  // ADD
        end

        // ================= custom rst =================
        7'b1111111: begin
            Rst = 1'b1;
        end

    endcase
end

endmodule

