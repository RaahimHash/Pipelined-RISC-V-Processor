`timescale 1ns / 1ps

module ID_EX_Reg (
    input wire flush, 
    input wire clk,
    input wire reset,
    input wire [1:0] Alu_Op,
    input wire Alu_Src,
    input wire MemRead,
    input wire MemWrite,
    input wire Branch,
    input wire BranchOp,
    input wire MemToReg,
    input wire RegWrite,
    input wire [63:0] PC_In,
    input wire [63:0] Read_Data_1in,
    input wire [63:0] Read_Data_2in,
    input wire [63:0] Imm_DataIn,
    input wire [4:0] rd_in, rs1_in, rs2_in,
    input wire inst30,
    input wire [2:0] inst14_12,
    output reg [1:0] ALUOp,
    output reg ALUSrc,
    output reg Mem_Read,
    output reg Mem_Write,
    output reg Branch_out,
    output reg Branch_Op, 
    output reg Mem_To_Reg,
    output reg Reg_Write,
    output reg [63:0] PC_Out,
    output reg [63:0] Read_Data_1,
    output reg [63:0] Read_Data_2,
    output reg [63:0] Imm_Data,
    output reg [4:0] rd, rs1, rs2,
    output reg instruction30,
    output reg [2:0] instruction14_12
);  
    initial
    begin
        ALUOp = 0;
        ALUSrc = 0;
        Mem_Read = 0;
        Mem_Write = 0;
        Branch_Op = 0;
        Branch_out = 0;
        Mem_To_Reg = 0;
        Reg_Write = 0;
        PC_Out = 0;
        Read_Data_1 = 0;
        Read_Data_2 = 0;
        Imm_Data = 0;
        rd = 0;
        rs1 = 0;
        rs2 = 0;
        instruction30 = 0;
        instruction14_12 = 0;
    end

    always @(posedge clk) 
    begin
        if (reset || flush)
        begin
            ALUOp = 0;
            ALUSrc = 0;
            Mem_Read = 0;
            Mem_Write = 0;
            Branch_Op = 0;
            Branch_out = 0;
            Mem_To_Reg = 0;
            Reg_Write = 0;
            PC_Out = 0;
            Read_Data_1 = 0;
            Read_Data_2 = 0;
            Imm_Data = 0;
            rd = 0;
            rs1 = 0;
            rs2 = 0;
            instruction30 = 0;
            instruction14_12 = 0;        
        end
        else
        begin
            ALUOp = Alu_Op;
            ALUSrc = Alu_Src;
            Mem_Read = MemRead;
            Mem_Write = MemWrite;
            Branch_Op = BranchOp;
            Branch_out = Branch;
            Mem_To_Reg = MemToReg;
            Reg_Write = RegWrite;
            PC_Out = PC_In;
            Read_Data_1 = Read_Data_1in;
            Read_Data_2 = Read_Data_2in;
            Imm_Data = Imm_DataIn;
            rd = rd_in;
            rs1 = rs1_in;
            rs2 = rs2_in;
            instruction30 = inst30;
            instruction14_12 = inst14_12;
        end
    end
    
endmodule