`include "d_flipflop.v"
module dff_test;
wire q;
reg clk,rst,d;

d_flipflop D(d,clk,rst,q);           // d->input clk->clock rst->reset q->output
initial
        clk = 0;
    always
      #5 clk = ~clk;
initial
       d = 0;
    always
      #3 d = ~d;

initial begin
    $dumpfile("d_ff_test.vcd");      
    $dumpvars(0,dff_test);
    #0 rst=1;                        // At t=0 reset is set to 1
    #1 rst=0;                        // At t=1 reset is set to 0
    $monitor("time=%t,clk=%b,d=%b,q=%b",$time,clk,d,q);
   
#40 $finish;
end
endmodule