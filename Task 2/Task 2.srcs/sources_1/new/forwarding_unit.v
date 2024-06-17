`timescale 1ns / 1ps

module forwarding_unit (
    input wire clk, 
    input wire [4:0] rs1, rs2, memRd, wbRd,
    input wire memRegWrite, wbRegWrite,
    output reg [1:0] forwardA, forwardB
);  
//    reg [1:0] savedA, savedB;
//    reg flagA, flagB, setA, setB;
//    initial
//    begin
//        flagA = 0;
//        flagB = 0;
//        setA = 0;
//        setB = 0;
//    end
        
//    always @(posedge clk) 
//    begin
//        if (flagA)
//        begin
//            forwardA = savedA;
//            flagA = 0;
//            setA = 1;
//        end
        
//        if (flagB)
//        begin
//            forwardB = savedB;
//            flagB = 0;
//            setB = 1;
//        end
            
//        if (memRegWrite && (memRd != 0) && (memRd == rs1)) 
//        begin
//            savedA = 2'b10;
//            flagA = 1;
//        end 
//        else if (wbRegWrite && (wbRd != 0) && (wbRd == rs1)) 
//        begin
//            savedA = 2'b01;
//            flagA = 1;
//        end
//        else if (setA)
//            forwardA = 2'b00;
      
//        if (memRegWrite && (memRd != 0) && (memRd == rs2)) 
//        begin
//            savedB = 2'b10;
//            flagB = 1;
//        end
//        else if (wbRegWrite && (wbRd != 0) && (wbRd == rs2)) 
//        begin 
//            savedB = 2'b01;
//            flagB = 1;
//        end
//        else if (setB)
//            forwardB = 2'b00;
                                       
//    end    
    
    always @(*) 
    begin
        if (memRegWrite && (memRd != 0) && (memRd == rs1)) 
            forwardA = 2'b10;
        else if (wbRegWrite && (wbRd != 0) && (wbRd == rs1)) 
            forwardA = 2'b01;
        else 
            forwardA = 2'b00;
      
        if (memRegWrite && (memRd != 0) && (memRd == rs2)) 
            forwardB = 2'b10;
        else if (wbRegWrite && (wbRd != 0) && (wbRd == rs2)) 
            forwardB = 2'b01;
        else 
            forwardB = 2'b00;
                                       
    end
        
endmodule