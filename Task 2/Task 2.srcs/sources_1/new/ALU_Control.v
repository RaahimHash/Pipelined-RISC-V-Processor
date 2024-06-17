`timescale 1ns / 1ps

module ALU_Control(
    input [1:0] ALUOp,
    input [3:0] Funct,
    output reg [3:0] Operation
    );
    
    always @(*)
    begin
        
        if (ALUOp == 2'b00)
            if (Funct == 4'b0000)
                Operation = 4'b0010; // ADDI
            else if (Funct == 4'b0001) 
                Operation = 4'b1101; // SLLI
            
        else if (ALUOp == 2'b01)
            Operation = 4'b0110; // SUB
        
        else if (ALUOp == 2'b10)
            if (Funct == 4'b0000)
                Operation = 4'b0010; // ADD
            else if (Funct == 4'b1000)
                Operation = 4'b0110; // SUB
            else if (Funct == 4'b0111)
                Operation = 4'b0000; // AND
            else if (Funct == 4'b0110)
                Operation = 4'b0001; // OR
            else if (Funct == 4'b0001) 
                Operation = 4'b1101; // SLLI
        
    end 
endmodule