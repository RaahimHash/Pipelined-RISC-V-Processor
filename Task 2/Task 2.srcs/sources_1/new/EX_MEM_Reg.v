`timescale 1ns / 1ps

module EX_MEM_Reg (
    input wire clk,
    input wire reset, 
    input wire MemRead,
    input wire MemWrite,
    input wire Branch,
    input wire BranchOp,
    input wire MemToReg,
    input wire RegWrite,
    input wire [63:0] BrPCIn,
    input wire [63:0] Read_Data_2in,
    input wire [63:0] ALU_Res,
    input wire zro,
    input wire less,
    input wire [4:0]rd_in,
    output reg [63:0] Read_Data_2,
    output reg [63:0] BrPCOut,
    output reg [63:0] ALU_Result,
    output reg [4:0] rd,
    output reg Zero,
    output reg Mem_Less,
    output reg Mem_Read,
    output reg Mem_Write,
    output reg Branch_out,
    output reg Branch_Op,
    output reg Mem_To_Reg,
    output reg Reg_Write
);  
    initial 
    begin
        Mem_Read = 0;
        Mem_Write = 0;
        Branch_Op = 0;
        Branch_out = 0;
        Mem_To_Reg = 0;
        Reg_Write = 0;
        Read_Data_2 = 0;
        ALU_Result = 0;
        rd = 0;
        BrPCOut = 0;
        Zero = 0;
        Mem_Less = 0;
    end
    
    
    always @(posedge clk) 
    begin
        if (reset)
        begin
            Mem_Read = 0;
            Mem_Write = 0;
            Branch_Op = 0;
            Branch_out = 0;
            Mem_To_Reg = 0;
            Reg_Write = 0;
            Read_Data_2 = 0;
            ALU_Result = 0;
            rd = 0;
            BrPCOut = 0;
            Zero = 0;
            Mem_Less = 0;        
        end
        else
        begin
            Mem_Read = MemRead;
            Mem_Write = MemWrite;
            Branch_Op = BranchOp;
            Branch_out = Branch;
            Mem_To_Reg = MemToReg;
            Reg_Write = RegWrite;
            Read_Data_2 = Read_Data_2in;
            ALU_Result = ALU_Res;
            rd = rd_in;
            BrPCOut = BrPCIn;
            Zero = zro;
            Mem_Less = less;
        end
    end
    
endmodule
