`timescale 1ns / 1ps

module RISC_V_Processor(input reset, input clk);
    
    wire [63:0] PC_In, PC_Out;
    wire [31:0] instruction;
    wire [6:0] opcode;
    wire [4:0] rd, rs1, rs2;
    wire [2:0] funct3;
    wire [6:0] funct7;
    wire [63:0] imm_data;
    wire branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite;
    wire [1:0] ALUOp;
    wire [3:0] Operation;
    wire [63:0] WriteData, ReadData1, ReadData2;
    wire [63:0] b;
    wire Zero, Less;
    wire [63:0] Result;
    wire [63:0] Read_Data;
    wire [63:0] out1, out2;
    
    Program_Counter pc (reset, clk, PC_In, PC_Out);
    Instruction_Memory inst_mem (PC_Out, instruction);
    wire branchOp;
    assign branchOp = instruction[14];
    Instruction_Parser inst_par (instruction, opcode, rd, funct3, rs1, rs2, funct7);
    Immediate_Generator imm_gen (instruction, imm_data);
    Control_Unit cu (opcode, branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite);
    wire [3:0] var1;
    assign var1[3] = instruction[30];
    assign var1[2:0] = instruction[14:12];
    ALU_Control alu_c (ALUOp, var1, Operation);
    RegisterFile reg_file (WriteData, rs1, rs2, rd, RegWrite, clk, reset, ReadData1, ReadData2);
    Multiplexer_21 m1 (ReadData2, imm_data, ALUSrc, b);
    ALU_64_bit alu (ReadData1, b, Operation, Zero, Less, Result);
    Data_Memory data_mem (clk, Result, ReadData2, MemWrite, MemRead, Read_Data);
    Multiplexer_21 m2 (Result, Read_Data, MemToReg, WriteData);
    reg [63:0] var2 = 64'd4;
    Adder a1 (PC_Out, var2, out1);
    Adder a2 (PC_Out, imm_data, out2);
    wire var3 = (branch & Zero & ~branchOp) || (branch & Less & branchOp);
    Multiplexer_21 m3 (out1, out2, var3, PC_In);
    

endmodule
