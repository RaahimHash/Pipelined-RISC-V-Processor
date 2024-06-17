`timescale 1ns / 1ps

module Instruction_Memory(
    input [63:0] Instr_Addr,
    output reg [31:0]Instruction
    );
    reg [7:0] memory[179:0];
    initial
    begin
// BUBBLE SORT
        memory[0] = 8'b00010011;
        memory[1] = 8'b00000101;
        memory[2] = 8'b00000000;
        memory[3] = 8'b00000000; // addi x10 x0 0
        memory[4] = 8'b10010011;
        memory[5] = 8'b00000101;
        memory[6] = 8'b10000000;
        memory[7] = 8'b00000000; // addi x11 x0 8
        memory[8] = 8'b10010011;
        memory[9] = 8'b00001001;
        memory[10] = 8'b00000000;
        memory[11] = 8'b00000000; // addi x19 x0 0
        memory[12] = 8'b10010011;
        memory[13] = 8'b10001010;
        memory[14] = 8'b11110101;
        memory[15] = 8'b11111111; // addi x21 x11 -1
        memory[16] = 8'b00010011; 
        memory[17] = 8'b00001010;
        memory[18] = 8'b00000000;
        memory[19] = 8'b00000000; // addi x20 x0 0 
        memory[20] = 8'b00010011;
        memory[21] = 8'b00000001;
        memory[22] = 8'b10000001;
        memory[23] = 8'b11111110; // addi x2 x2 -24
        memory[24] = 8'b00100011;
        memory[25] = 8'b00111000;
        memory[26] = 8'b00100001;
        memory[27] = 8'b00000001; // sd x18 16(x2)
        memory[28] = 8'b00100011;
        memory[29] = 8'b00110100;
        memory[30] = 8'b10010001;
        memory[31] = 8'b00000000; // sd x9 8(x2)
        memory[32] = 8'b00100011;
        memory[33] = 8'b00110000;
        memory[34] = 8'b10000001;
        memory[35] = 8'b00000000; // sd x8 0(x2)
        memory[36] = 8'b00010011;
        memory[37] = 8'b00010100;
        memory[38] = 8'b00111010;
        memory[39] = 8'b00000000; // slli x8 x20 3
        memory[40] = 8'b00110011;
        memory[41] = 8'b00000100;
        memory[42] = 8'b10100100;
        memory[43] = 8'b00000000; // add x8 x8 x10 
        memory[44] = 8'b10000011;
        memory[45] = 8'b00110100;
        memory[46] = 8'b00000100;
        memory[47] = 8'b00000000; // ld x9 0(x8)
        memory[48] = 8'b00000011;
        memory[49] = 8'b00111001;
        memory[50] = 8'b10000100;
        memory[51] = 8'b00000000; // ld x18 8(x8)
        memory[52] = 8'b01100011;
        memory[53] = 8'b11000110;
        memory[54] = 8'b00100100;
        memory[55] = 8'b00000001; // blt x9 x18 12
        memory[56] = 8'b00100011;
        memory[57] = 8'b00110100;
        memory[58] = 8'b10010100;
        memory[59] = 8'b00000000; // sd x9 8(x8)
        memory[60] = 8'b00100011;
        memory[61] = 8'b00110000;
        memory[62] = 8'b00100100;
        memory[63] = 8'b00000001; // sd x18 0(x8)
        memory[64] = 8'b00000011;
        memory[65] = 8'b00110100;
        memory[66] = 8'b00000001;
        memory[67] = 8'b00000000; // ld x8 0(x2)
        memory[68] = 8'b10000011;
        memory[69] = 8'b00110100;
        memory[70] = 8'b10000001;
        memory[71] = 8'b00000000; // ld x9 8(x2)
        memory[72] = 8'b00000011;
        memory[73] = 8'b00111001;
        memory[74] = 8'b00000001;
        memory[75] = 8'b00000001; // ld x18 16(x2)
        memory[76] = 8'b00010011;
        memory[77] = 8'b00000001;
        memory[78] = 8'b10000001;
        memory[79] = 8'b00000001; // addi x2 x2 24
        memory[80] = 8'b00010011;
        memory[81] = 8'b00001010;
        memory[82] = 8'b00011010;
        memory[83] = 8'b00000000; // addi x20 x20 1
        memory[84] = 8'b11100011;
        memory[85] = 8'b01000000;
        memory[86] = 8'b01011010;
        memory[87] = 8'b11111101; // blt x20 x21 -64
        memory[88] = 8'b10010011;
        memory[89] = 8'b10001001;
        memory[90] = 8'b00011001;
        memory[91] = 8'b00000000; // addi x19 x19 1 
        memory[92] = 8'b11100011;
        memory[93] = 8'b11001010;
        memory[94] = 8'b10111001;
        memory[95] = 8'b11111010; // blt x19 x11 -76
        memory[96] = 8'b0;
        memory[97] = 8'b0;
        memory[98] = 8'b0;
        memory[99] = 8'b0; 
        memory[100] = 8'b0;
        memory[101] = 8'b0;
        memory[102] = 8'b0;
        memory[103] = 8'b0; 
        memory[104] = 8'b0;
        memory[105] = 8'b0;
        memory[106] = 8'b0;
        memory[107] = 8'b0;
        memory[108] = 8'b0;
        memory[109] = 8'b0;
        memory[110] = 8'b0;
        memory[111] = 8'b0;
        memory[112] = 8'b0;
        memory[113] = 8'b0;
        memory[114] = 8'b0;
        memory[115] = 8'b0;
        memory[116] = 8'b0;
        memory[117] = 8'b0;
        memory[118] = 8'b0;
        memory[119] = 8'b0;
        memory[120] = 8'b0;
        memory[121] = 8'b0;
        memory[122] = 8'b0;
        memory[123] = 8'b0;
        memory[124] = 8'b0;
        memory[125] = 8'b0;
        memory[126] = 8'b0;
        memory[127] = 8'b0;
        memory[128] = 8'b0;
        memory[129] = 8'b0;
        memory[130] = 8'b0;
        memory[131] = 8'b0;
        memory[132] = 8'b0;
        memory[133] = 8'b0;
        memory[134] = 8'b0;
        memory[135] = 8'b0;
        memory[136] = 8'b0;
        memory[137] = 8'b0;
        memory[138] = 8'b0;
        memory[139] = 8'b0;
        memory[140] = 8'b0;
        memory[141] = 8'b0;
        memory[142] = 8'b0;
        memory[143] = 8'b0;
        memory[144] = 8'b0;
        memory[145] = 8'b0;
        memory[146] = 8'b0;
        memory[147] = 8'b0;
        memory[148] = 8'b0;
        memory[149] = 8'b0;
        memory[150] = 8'b0;
        memory[151] = 8'b0; 
        memory[152] = 8'b0;
        memory[153] = 8'b0;
        memory[154] = 8'b0;
        memory[155] = 8'b0;
        memory[156] = 8'b0;
        memory[157] = 8'b0;
        memory[158] = 8'b0;
        memory[159] = 8'b0;
        memory[160] = 8'b0;
        memory[161] = 8'b0;
        memory[162] = 8'b0;
        memory[163] = 8'b0;
        memory[164] = 8'b0;
        memory[165] = 8'b0;
        memory[166] = 8'b0;
        memory[167] = 8'b0;
        memory[168] = 8'b0;
        memory[169] = 8'b0;
        memory[170] = 8'b0;
        memory[171] = 8'b0;
        memory[172] = 8'b0;
        memory[173] = 8'b0;
        memory[174] = 8'b0;
        memory[175] = 8'b0;
        memory[176] = 8'b0;
        memory[177] = 8'b0;
        memory[178] = 8'b0;
        memory[179] = 8'b0;
    end
    
    always @*
    begin
        Instruction[31:24] = memory[Instr_Addr+3];
        Instruction[23:16] = memory[Instr_Addr+2];
        Instruction[15:8] = memory[Instr_Addr+1];
        Instruction[7:0] = memory[Instr_Addr];
    end
    
    
endmodule