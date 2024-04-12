`timescale 1ns / 1ps

module RegisterFile(
    input wire [63:0] WriteData,
    input wire [4:0]RS1,
    input wire [4:0]RS2,
    input wire [4:0]RD,
    input wire RegWrite, clk, reset,
    output reg [63:0]ReadData1,
    output reg [63:0]ReadData2
);

    reg [63:0] Registers [31:0];
    reg [4:0] i = 0;
    
    initial
    begin 
        Registers[0] = 1;
        Registers[1] = 2;
        Registers[2] = 3;
        Registers[3] = 4;
        Registers[4] = 5;
        Registers[5] = 6;
        Registers[6] = 7;
        Registers[7] = 8;
        Registers[8] = 9;
        Registers[9] = 10;
        Registers[10] = 11;
        Registers[11] = 12;
        Registers[12] = 13;
        Registers[13] = 14;
        Registers[14] = 15;
        Registers[15] = 16;
        Registers[16] = 17;
        Registers[17] = 18;
        Registers[18] = 19;
        Registers[19] = 20;
        Registers[20] = 21;
        Registers[21] = 22;
        Registers[22] = 23;
        Registers[23] = 24;
        Registers[24] = 25;
        Registers[25] = 26;
        Registers[26] = 27;
        Registers[27] = 28;
        Registers[28] = 29;
        Registers[29] = 30;
        Registers[30] = 31;
        Registers[31] = 32;
    end
    
    always @(posedge clk)
        if (RegWrite)
            Registers[RD] = WriteData;
            
    always @(*) // because registers only update at reset or reg write
    begin
        ReadData1 = Registers[RS1];
        ReadData2 = Registers[RS2];
    end
        
    always @(posedge reset)
    begin
        Registers[0] = 0;
        Registers[1] = 0;
        Registers[2] = 0;
        Registers[3] = 0;
        Registers[4] = 0;
        Registers[5] = 0;
        Registers[6] = 0;
        Registers[7] = 0;
        Registers[8] = 0;
        Registers[9] = 0;
        Registers[10] = 0;
        Registers[11] = 0;
        Registers[12] = 0;
        Registers[13] = 0;
        Registers[14] = 0;
        Registers[15] = 0;
        Registers[16] = 0;
        Registers[17] = 0;
        Registers[18] = 0;
        Registers[19] = 0;
        Registers[20] = 0;
        Registers[21] = 0;
        Registers[22] = 0;
        Registers[23] = 0;
        Registers[24] = 0;
        Registers[25] = 0;
        Registers[26] = 0;
        Registers[27] = 0;
        Registers[28] = 0;
        Registers[29] = 0;
        Registers[30] = 0;
        Registers[31] = 0;
    end
    
endmodule
