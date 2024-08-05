`include "full_adder.v"
module full_adder_test;
reg A,B,Cin;
wire Sum,Cout;
full_adder f(.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars(0,full_adder_test);
    $monitor($time, " A=%b,B=%b,Cin=%b,Sum=%b,Cout=%b",A,B,Cin,Sum,Cout);
    #1 A=0;B=0;Cin=0;
    #1 A=0;B=0;Cin=1;
    #1 A=0;B=1;Cin=0;
    #1 A=0;B=1;Cin=1;
    #1 A=1;B=0;Cin=0;
    #1 A=1;B=0;Cin=1;
    #1 A=1;B=1;Cin=0;
    #1 A=1;B=1;Cin=1;
    end
endmodule 
