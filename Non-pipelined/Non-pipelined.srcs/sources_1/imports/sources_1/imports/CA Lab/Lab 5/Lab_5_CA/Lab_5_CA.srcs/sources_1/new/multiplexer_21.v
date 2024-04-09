`timescale 1ns / 1ps

module Multiplexer_21(
    input [63:0] a,
    input [63:0] b,
    input sel,
    output reg [63:0] data_out
    );
    
    always @(*)
    begin
    case (sel)
        0: data_out = a;
        default: data_out = b;
    endcase
   end
endmodule
