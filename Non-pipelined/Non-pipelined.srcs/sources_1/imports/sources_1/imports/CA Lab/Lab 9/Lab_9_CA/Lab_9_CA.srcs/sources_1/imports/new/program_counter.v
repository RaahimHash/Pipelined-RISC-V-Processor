`timescale 1ns / 1ps

module Program_Counter(
    input reset,
    input clk,
    input [63:0] pc_in,
    output reg [63:0] pc_out
    );
    initial 
        pc_out = pc_in; // change this to assign to 0 if you want processor to start working before first reset
        
    always @(posedge clk) 
        if (reset) pc_out = 0;
        else pc_out = pc_in;
endmodule
