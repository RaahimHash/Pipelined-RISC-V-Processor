`timescale 1ns / 1ps

module ALU_64_bit (
input [63:0] a, input [63:0] b,
input [3:0] ALUOp, 
output wire zero,
output wire less,
output reg [63:0] result);

assign zero = (result == 0);
assign less = (a < b);

always @(*)
begin
    case (ALUOp[3:0])
        4'b0000: result <= a & b; // AND
        4'b0001: result <= a | b; // OR
        4'b0010: result <= a + b; // ADD
        4'b0110: result <= a - b; // Subtract
        4'b1100: result <= ~a & ~b; // NOR
        4'b1101: result <= a * (2**b);
    endcase
end

endmodule