`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2025 13:00:20
// Design Name: 
// Module Name: AL_Unit
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


module AL_Unit(
    input  [31:0] Data_1,
    input  [31:0] Data_2,
    input  [2:0]  ALU_Control,
    output reg [31:0] Result,
    output Zero
);

    wire [31:0] sub_result;

    assign sub_result = Data_1 - Data_2;
    assign Zero = (sub_result == 32'b0);

    always @(*) begin
        case (ALU_Control)
            3'b010: Result = Data_1 + Data_2;                     // ADD
            3'b110: Result = sub_result;                          // SUB
            3'b000: Result = Data_1 & Data_2;                     // AND
            3'b001: Result = Data_1 | Data_2;                     // OR
            3'b111: Result = ($signed(Data_1) < $signed(Data_2))
                              ? 32'd1 : 32'd0;                    // SLT
            default: Result = 32'b0;
        endcase
    end

endmodule

