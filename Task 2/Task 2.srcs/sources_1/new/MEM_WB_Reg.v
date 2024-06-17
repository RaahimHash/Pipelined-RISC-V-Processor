module MEM_WB_Reg (
    input wire clk,
    input wire reset,
    input wire MemToReg,
    input wire RegWrite,
    input wire [63:0] ALU_Res,
    input wire [63:0] Read_Data,
    input wire [4:0] rd_in,
    output reg [63:0] ALU_Result,
    output reg [63:0] Read_Data_out,
    output reg [4:0] rd,
    output reg Mem_To_Reg,
    output reg Reg_Write
);  
    initial
    begin
        Mem_To_Reg = 0;
        Reg_Write = 0;
        ALU_Result = 0;
        Read_Data_out = 0;
        rd = 0; 
    end 
    
    always @(posedge clk) 
    begin
        if (reset)
        begin
            Mem_To_Reg = 0;
            Reg_Write = 0;
            ALU_Result = 0;
            Read_Data_out = 0;
            rd = 0;         
        end
        begin
            Mem_To_Reg = MemToReg;
            Reg_Write = RegWrite;
            ALU_Result = ALU_Res;
            Read_Data_out = Read_Data;
            rd = rd_in;
        end
    end
   
endmodule