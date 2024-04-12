`timescale 1ns / 1ps

module ALU_64_bit (
input [63:0] a, input [63:0] b,
input [3:0] ALUOp, 
output wire zero,
output reg [63:0] result);

assign zero = (result == 0);

always @(*)
begin
    case (ALUOp[1:0])
        4'b0000: result <= a & b; // AND
        4'b0001: result <= a | b; // OR
        4'b0010: result <= a + b; // ADD
        4'b0110: result <= a - b; // Subtract
        4'b1100: result <= ~a & ~b; // NOR
    endcase
end

endmodule