`timescale 1ns / 1ps

module RISC_V_Processor(input reset, input clk);
    
    wire [63:0] PC_In, PC_Out, idPC_Out, exPC_Out, memPC_Out;
    wire [31:0] instruction, next_instruction;
    wire [6:0] opcode;
    wire [4:0] rd, rs1, rs2, exRs1, exRs2, exRd, memRd, wbRd;
    wire [2:0] funct3;
    wire [6:0] funct7;
    wire [63:0] imm_data;
    wire [63:0] exImm_data;
    wire branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite;
    wire exMemWrite, exMemRead, exBranch, exMemToReg, exRegWrite, exALUSrc, exBranchOp;
    wire memMemWrite, memMemRead, memBranch, memMemToReg, memRegWrite;
    wire stall;
    wire [1:0] ALUOp, exALUOp;
    wire [3:0] Operation;
    wire [63:0] ReadData1, ReadData2, memReadData2;
    wire [63:0] exReadData1, exReadData2;
    wire [63:0] Result, memResult, wbResult;
    wire [63:0] Read_Data, wbReadData;
    wire [63:0] out1, out2;
    wire branchOp, memBranchOp;
    wire wbRegWrite, wbMemToReg;
    wire exInstruction30;
    wire [2:0] exInstruction14_12;
    wire [1:0] forwardA, forwardB;
    wire [63:0] a, fB_out, b;
    wire Zero, Less, memZero, memLess;
    wire [63:0] wbWriteData;

    // only checking data hazard right now 
    hazard_detection d(exMemRead, instruction, exRd, stall);
    Program_Counter pc (stall, reset, clk, PC_In, PC_Out);
    reg [63:0] var2 = 64'd4;
    Adder a1 (PC_Out, var2, out1);
    wire var3 = (memBranch & memZero & ~memBranchOp) || (memBranch & memLess & memBranchOp);
    Multiplexer_21 mux_pc (out1, memPC_Out, var3, PC_In);
    Instruction_Memory inst_mem (.Instr_Addr(PC_Out), .Instruction(next_instruction));
    IF_ID_Reg if_id_reg (var3, stall, clk, reset, PC_Out, next_instruction, idPC_Out, instruction);
    //end of first stage

    assign branchOp = instruction[14];
    Instruction_Parser inst_par (instruction, opcode, rd, funct3, rs1, rs2, funct7);
    Immediate_Generator imm_gen (instruction, imm_data);
    Control_Unit cu (stall, opcode, branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite);
    RegisterFile reg_file (wbWriteData, rs1, rs2, wbRd, wbRegWrite, clk, reset, ReadData1, ReadData2);
    ID_EX_Reg id_ex_reg (var3, clk, reset, ALUOp, ALUSrc, MemRead, MemWrite, branch, branchOp, MemToReg, RegWrite, idPC_Out, ReadData1, ReadData2, imm_data, rd, rs1, rs2, instruction[30], instruction[14:12], exALUOp, exALUSrc, exMemRead, exMemWrite, exBranch, exBranchOp, exMemToReg, exRegWrite, exPC_Out, exReadData1, exReadData2, exImm_data, exRd, exRs1, exRs2, exInstruction30, exInstruction14_12);
    // end of second stage

    wire [3:0] var1;
    assign var1[3] = exInstruction30;
    assign var1[2:0] = exInstruction14_12;
    ALU_Control alu_c (exALUOp, var1, Operation);
    Multiplexer_41 fA(exReadData1, wbWriteData, memResult, exReadData1, forwardA, a);
    Multiplexer_41 fB(exReadData2, wbWriteData, memResult, exReadData2, forwardB, fB_out);
    Multiplexer_21 mux_alu (fB_out, exImm_data, exALUSrc, b);
    forwarding_unit fwd_unit (clk, exRs1, exRs2, memRd, wbRd, memRegWrite, wbRegWrite, forwardA, forwardB);
    ALU_64_bit alu (a, b, Operation, Zero, Less, Result);
    Adder a2 (exPC_Out, exImm_data, out2);
    EX_MEM_Reg ex_mem_reg (var3, clk, reset, exMemRead, exMemWrite, exBranch, exBranchOp, exMemToReg, exRegWrite, out2, fB_out, Result, Zero, Less, exRd, memReadData2, memPC_Out, memResult, memRd, memZero, memLess, memMemRead, memMemWrite, memBranch, memBranchOp, memMemToReg, memRegWrite);
    //end of third stage

    Data_Memory data_mem (clk, memResult, memReadData2, memMemWrite, memMemRead, Read_Data);
    MEM_WB_Reg mem_wb_reg (clk, reset, memMemToReg, memRegWrite, memResult, Read_Data, memRd, wbResult, wbReadData, wbRd, wbMemToReg, wbRegWrite);

    Multiplexer_21 mux_wb (wbResult, wbReadData, wbMemToReg, wbWriteData);


endmodule
