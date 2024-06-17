module IF_ID_Reg (
    input wire clk,
    input wire reset,
    input wire [63:0] PC_In,
    input wire [31:0] ins,
    output reg [63:0] PC_Out,
    output reg [31:0] instruction

);
    initial
    begin
        PC_Out = 0;
        instruction = 0;
    end
    
    always @(posedge clk) 
    begin
        if (reset) 
        begin
            PC_Out = 0;
            instruction = 0;
        end
        else
        begin
            PC_Out = PC_In;
            instruction = ins; 
        end
    end
    
endmodule