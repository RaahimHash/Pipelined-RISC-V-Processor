`timescale 1ns / 1ps

module ALU_Control(
    input [1:0] ALUOp,
    input [3:0] Funct,
    output reg [3:0] Operation
    );
    
    always @(*)
    begin
        
        if (ALUOp == 2'b00)
            Operation = 4'b0010; 
            
        else if (ALUOp == 2'b01)
            Operation = 4'b0110;
        
        else if (ALUOp == 2'b10)
            if (Funct == 4'b0000)
                Operation = 4'b0010;
            else if (Funct == 4'b1000)
                Operation = 4'b0110;
            else if (Funct == 4'b0111)
                Operation = 4'b0000;
            else if (Funct == 4'b0110)
                Operation = 4'b0001;
        
    end 
endmodule
