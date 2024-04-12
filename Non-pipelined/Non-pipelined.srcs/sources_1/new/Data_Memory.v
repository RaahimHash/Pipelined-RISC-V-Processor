module Data_Memory (
    input clk,
    input [63:0] Mem_Addr,
    input [63:0] Write_Data,
    input memWrite,
    input memRead,
    output reg [63:0] Read_Data
    );
    
    reg [7:0] mem [0:63];
    initial begin
        mem[0] = 0;
        mem[1] = 4;
        mem[2] = 8;
        mem[3] = 12;
        mem[4] = 16;
        mem[5] = 20;
        mem[6] = 24;
        mem[7] = 28;
        mem[8] = 32;
        mem[9] = 36;
        mem[10] = 40;
        mem[11] = 44;
        mem[12] = 48;
        mem[13] = 52;
        mem[14] = 56;
        mem[15] = 60;
        mem[16] = 64;
        mem[17] = 68;
        mem[18] = 72;
        mem[19] = 76;
        mem[20] = 80;
        mem[21] = 84;
        mem[22] = 88;
        mem[23] = 92;
        mem[24] = 96;
        mem[25] = 100;
        mem[26] = 104;
        mem[27] = 108;
        mem[28] = 112;
        mem[29] = 116;
        mem[30] = 120;
        mem[31] = 124;
        mem[32] = 128;
        mem[33] = 132;
        mem[34] = 136;
        mem[35] = 140;
        mem[36] = 144;
        mem[37] = 148;
        mem[38] = 152;
        mem[39] = 156;
        mem[40] = 160;
        mem[41] = 164;
        mem[42] = 168;
        mem[43] = 172;
        mem[44] = 176;
        mem[45] = 180;
        mem[46] = 184;
        mem[47] = 188;
        mem[48] = 192;
        mem[49] = 196;
        mem[50] = 200;
        mem[51] = 204;
        mem[52] = 208;
        mem[53] = 212;
        mem[54] = 216;
        mem[55] = 220;
        mem[56] = 224;
        mem[57] = 228;
        mem[58] = 232;
        mem[59] = 236;
        mem[60] = 240;
        mem[61] = 244;
        mem[62] = 248;
        mem[63] = 252;
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