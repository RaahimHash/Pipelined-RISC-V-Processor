`timescale 1ns / 1ps

module tb_processor();
    
    reg reset, clk;
    
    RISC_V_Processor processor (reset, clk);
        
    initial
    begin
        reset = 0;
        clk = 1;
        #10
        reset = 1;
        #20
        reset = 0;
        #570   
        $stop;
    end
    
    always
    begin
        #10 
        clk = ~clk;
    end

endmodule
