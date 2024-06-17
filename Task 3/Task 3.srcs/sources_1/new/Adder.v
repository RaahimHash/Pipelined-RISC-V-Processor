`timescale 1ns / 1ps

module Adder(
    input [63:0] a,
    input [63:0] b,
    output [63:0] out
    );
    
    assign out = a + b;
 
endmodule
