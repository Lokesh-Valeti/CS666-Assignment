`include "john_count.v"
module johncount_test;
reg clk,rst;
wire [0:3]state;   //clk-> clock rst->reset state->values of q at the various flipflops
johnson j(.clk(clk),.rst(rst),.state(state));

initial
        clk = 0;
    always
      #5 clk = ~clk;

initial 
begin
    #0 rst=1;
    #10 rst=0;
    #100 rst=1;  //Reseting the johnson counter so that it starts from its initial state
    #105 rst=0;
    #200 $finish;
end
initial 
begin
    $dumpfile("john_test.vcd");
    $dumpvars(0,johncount_test);
    $monitor("time=%t,reset=%b,clock=%b,state=%b",$time,rst,clk,state);
end
endmodule