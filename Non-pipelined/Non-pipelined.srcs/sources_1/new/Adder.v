`timescale 1ns / 1ps

module Adder(
    input [63:0] a,
    input [63:0] b,
    output [63:0] out
    );
    
    assign out[63] = 0;
    assign out [62:0] = b[63] == 0 ? a[62:0] + b[62:0] : a[62:0] - b[62:0]; 
 
endmodule
