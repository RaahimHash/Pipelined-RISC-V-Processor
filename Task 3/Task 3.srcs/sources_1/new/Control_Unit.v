`timescale 1ns / 1ps

module Control_Unit(
    input stall, 
    input [6:0] Opcode, 
    output reg branch, 
    output reg MemRead,
    output reg MemToReg,
    output reg [1:0] ALUOp, 
    output reg MemWrite, 
    output reg ALUSrc, 
    output reg RegWrite
);
    
   initial
   begin
   
       ALUSrc = 0;
       MemToReg = 0;
       RegWrite = 0;
       MemRead = 0;
       MemWrite = 0;
       branch = 0;
       ALUOp = 0;
   end 
   
   always @(Opcode || stall)
   begin 
       if (stall)
       begin
           ALUSrc = 0;
           MemToReg = 0;
           RegWrite = 0;
           MemRead = 0;
           MemWrite = 0;
           branch = 0;
           ALUOp = 0;
       end 
         
       else if (Opcode == 0) // NOP
       begin
           ALUSrc = 0;
           MemToReg = 0;
           RegWrite = 0;
           MemRead = 0;
           MemWrite = 0;
           branch = 0;
           ALUOp = 0;
       end 
       else
       begin   
           if (Opcode[6] == 1) // SB-Type
           begin
               ALUSrc = 0;
               MemToReg = 1'bx;
               RegWrite = 0;
               MemRead = 0;
               MemWrite = 0;
               branch = 1;
               ALUOp = 2'b01;
           end 
           
           else 
           begin
               if (Opcode[5] == 0) // I-Type 
               begin
               
                   if (Opcode[4] == 0) // (ld)
                   begin
                   ALUSrc = 1;
                   MemToReg = 1;
                   RegWrite = 1;
                   MemRead = 1;
                   MemWrite = 0;
                   branch = 0;
                   ALUOp = 0;
                   end
                   
                   else // (addi and slli)
                   begin
                   ALUSrc = 1;
                   MemToReg = 0;
                   RegWrite = 1;
                   MemRead = 0;
                   MemWrite = 0;
                   branch = 0;
                   ALUOp = 0;               
                   end
               end 
               
               else 
               begin
                   if (Opcode[4] == 0) // S-Type
                   begin
                       ALUSrc = 1;
                       MemToReg = 1'bx;
                       RegWrite = 0;
                       MemRead = 0;
                       MemWrite = 1;
                       branch = 0;
                       ALUOp = 0;               
                   end         
                     
                   else // R-Type
                   begin 
                       ALUSrc = 0;
                       MemToReg = 0;
                       RegWrite = 1;
                       MemRead = 0;
                       MemWrite = 0;
                       branch = 0;
                       ALUOp = 2'b10;                         
                   end
               end
           end
       end
       
   end  
        
endmodule