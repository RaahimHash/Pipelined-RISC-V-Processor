`timescale 1ns / 1ps
module Program_Counter(
    input stall, 
    input reset,
    input clk,
    input wire [63:0] pc_in,
    output reg [63:0] pc_out
);

    initial 
        pc_out = pc_in; 
        
    always @(posedge clk) 
    begin
        if (reset) 
            pc_out = 0; // Reset the PC to 0 synchronously
        else if (stall)
            pc_out = pc_out; // No change to PC if stalled
        else
            pc_out = pc_in; 
    end
endmodule
