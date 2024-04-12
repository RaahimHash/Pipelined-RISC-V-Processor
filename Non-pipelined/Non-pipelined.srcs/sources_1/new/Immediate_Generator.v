`timescale 1ns / 1ps

module Immediate_Generator(
    input [31:0] instruction,
    output reg [63:0] imm_data 
    );
    
    always @(*)
    begin 
        if ( instruction[6] == 0 )
        begin
            if ( instruction[5] == 0 )
            begin
                imm_data[11:0] = instruction[31:20];
                imm_data[12] = instruction[31];
            end
            else
            begin
                imm_data[11:5] = instruction[31:25];
                imm_data[4:0] = instruction[11:7];
                imm_data[12] = instruction[31];
            end
        end
        else
        begin
            imm_data[12] = instruction[31];
            imm_data[10:5] = instruction[30:25];
            imm_data[4:1] = instruction[11:8];
            imm_data[11] = instruction[7];
            imm_data[0] = 0;
        end
        
        if ( imm_data[12]== 0 )
            imm_data[63:13] = 51'b0;
        else 
            imm_data[31:13] = 51'b1;
    end
endmodule
