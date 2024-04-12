`timescale 1ns / 1ps

module Instruction_Memory(
    input [63:0] Instr_Addr,
    output reg [31:0]Instruction
    );
    reg [7:0] memory[15:0];
    initial
    begin
        memory[0] = 8'b01100011;
        memory[1] = 8'b10000100;
        memory[2] = 8'b00010000;
        memory[3] = 8'b00000000; // beq x1 x1 8
        memory[4] = 8'b10110011;
        memory[5] = 8'b10000100;
        memory[6] = 8'b10011010;
        memory[7] = 8'b00000000; // add x9 x21 x9
        memory[8] = 8'b10010011;
        memory[9] = 8'b10000100;
        memory[10] = 8'b00010100;
        memory[11] = 8'b00000000; // addi x9 x9 1
        memory[12] = 8'b00100011;
        memory[13] = 8'b00110100;
        memory[14] = 8'b10010101;
        memory[15] = 8'b00000010; // sd x9 40(x10)
        
    end
    
    always @*
    begin
        Instruction[31:24] = memory[Instr_Addr+3];
        Instruction[23:16] = memory[Instr_Addr+2];
        Instruction[15:8] = memory[Instr_Addr+1];
        Instruction[7:0] = memory[Instr_Addr];
    end
    
    
endmodule