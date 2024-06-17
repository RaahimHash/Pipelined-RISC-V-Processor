`timescale 1ns / 1ps

module hazard_detection(
    input MemRead,
    input [31:0] instruction, 
    input [4:0] rd, 
    output reg stall
);

    // Initialize stall to 0
    initial begin
        stall = 0; 
    end 
    
    // Detect hazards
    always @(*)
    begin
        // Check if rs1 = rd or rs2 matches the current instruction
        if (MemRead && ((rd == instruction[19:15]) || (rd == instruction[24:20]))) begin
            stall = 1;
        end
        else begin
            stall = 0;
        end
    end
endmodule

