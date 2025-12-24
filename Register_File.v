`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2025 11:52:24
// Design Name: 
// Module Name: Register_File
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


module Register_File(
    input clk,
    input [4:0] a1,
    input [4:0] a2,
    input [4:0] a3,
    input [31:0] write_data,
    input write_enable,
    input reset,
    output [31:0] rd1,
    output [31:0] rd2
);
    reg [31:0] reg_file[0:31];
    integer i;


    assign rd1 = (a1 == 0) ? 32'b0 : reg_file[a1];
    assign rd2 = (a2 == 0) ? 32'b0 : reg_file[a2];


    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 1; i < 32; i = i + 1)
                reg_file[i] <= 32'b0;
        end else if (write_enable && a3 != 0) begin
            reg_file[a3] <= write_data;
        end
    end
endmodule
