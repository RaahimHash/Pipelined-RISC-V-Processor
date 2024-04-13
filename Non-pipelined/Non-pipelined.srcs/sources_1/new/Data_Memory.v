module Data_Memory (
    input clk,
    input [63:0] Mem_Addr,
    input [63:0] Write_Data,
    input memWrite,
    input memRead,
    output reg [63:0] Read_Data
    );
    
    reg [7:0] mem [0:63];
    initial begin // stored as follows: [2, 3, 0, 512, 5, 4, 13, 3]
        mem[0] = 2;
        mem[1] = 0;
        mem[2] = 0;
        mem[3] = 0;
        mem[4] = 0;
        mem[5] = 0;
        mem[6] = 0;
        mem[7] = 0;
        mem[8] = 3;
        mem[9] = 0;
        mem[10] = 0;
        mem[11] = 0;
        mem[12] = 0;
        mem[13] = 0;
        mem[14] = 0;
        mem[15] = 0;
        mem[16] = 0;
        mem[17] = 0;
        mem[18] = 0;
        mem[19] = 0;
        mem[20] = 0;
        mem[21] = 0;
        mem[22] = 0;
        mem[23] = 0;
        mem[24] = 0;
        mem[25] = 1;
        mem[26] = 0;
        mem[27] = 0;
        mem[28] = 0;
        mem[29] = 0;
        mem[30] = 0;
        mem[31] = 0;
        mem[32] = 5;
        mem[33] = 0;
        mem[34] = 0;
        mem[35] = 0;
        mem[36] = 0;
        mem[37] = 0;
        mem[38] = 0;
        mem[39] = 0;
        mem[40] = 4;
        mem[41] = 0;
        mem[42] = 0;
        mem[43] = 0;
        mem[44] = 0;
        mem[45] = 0;
        mem[46] = 0;
        mem[47] = 0;
        mem[48] = 13;
        mem[49] = 0;
        mem[50] = 0;
        mem[51] = 0;
        mem[52] = 0;
        mem[53] = 0;
        mem[54] = 0;
        mem[55] = 0;
        mem[56] = 3;
        mem[57] = 0;
        mem[58] = 0;
        mem[59] = 0;
        mem[60] = 0;
        mem[61] = 0;
        mem[62] = 0;
        mem[63] = 0;
    end


    always @(posedge clk) 
    begin
        if(memWrite) 
        begin
            mem[Mem_Addr] <= Write_Data[7:0];
            mem[Mem_Addr+1] <= Write_Data[15:8];
            mem[Mem_Addr+2] <= Write_Data[23:16];
            mem[Mem_Addr+3] <= Write_Data[31:24];
            mem[Mem_Addr+4] <= Write_Data[39:32];
            mem[Mem_Addr+5] <= Write_Data[47:40];
            mem[Mem_Addr+6] <= Write_Data[55:48];
            mem[Mem_Addr+7] <= Write_Data[63:56];
        end
    end
    
    always @* 
    begin
        if(memRead) 
        begin
            Read_Data[7:0] <= mem[Mem_Addr];
            Read_Data[15:8] <= mem[Mem_Addr+1];
            Read_Data[23:16] <= mem[Mem_Addr+2];
            Read_Data[31:24] <= mem[Mem_Addr+3];
            Read_Data[39:32] <= mem[Mem_Addr+4];
            Read_Data[47:40] <= mem[Mem_Addr+5];
            Read_Data[55:48] <= mem[Mem_Addr+6];
            Read_Data[63:56] <= mem[Mem_Addr+7];
        end
    end
    
endmodule