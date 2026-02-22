`timescale 1ns / 1ps

module testbench;
    reg clk, x, rst;
    wire y_me_ov, y_me_nov, y_mo_ov, y_mo_nov;

    Melay_1011_Overlap dut0 (.clk(clk), .x(x), .rst(rst), .y(y_me_ov));
    Melay_1011_NonOverlap dut1 (.clk(clk), .x(x), .rst(rst), .y(y_me_nov));
    Moore_1011_Overlap dut2 (.clk(clk), .x(x), .rst(rst), .y(y_mo_ov));
    Moore_1011_NonOverlap dut3 (.clk(clk), .x(x), .rst(rst), .y(y_mo_nov));

    always #5 clk = ~clk;
    
    initial begin 
        clk = 0;
        rst = 1;
        x   = 0;
        @(posedge clk);
        rst <= 0;

        @(posedge clk) x <= 1; 
        @(posedge clk) x <= 0; 
        @(posedge clk) x <= 1; 
        @(posedge clk) x <= 1;
        @(posedge clk) x <= 0;
        @(posedge clk) x <= 1; 
        @(posedge clk) x <= 0;
        @(posedge clk) x <= 1; 
        @(posedge clk) x <= 1;
        @(posedge clk) x <= 0; 
        #20 $finish;   
    end
    
      initial begin
        $monitor("Time=%0t, x=%b, Melay_ov=%b, Melay_nov=%b, Moore_ov=%b, Moore_nov=%b", $time, x, y_me_ov, y_me_nov, y_mo_ov, y_mo_nov);
    end
    
endmodule