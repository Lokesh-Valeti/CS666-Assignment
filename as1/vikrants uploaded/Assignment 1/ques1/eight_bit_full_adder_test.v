`include "eight_bit_full_adder.v"
module eight_bit_full_adder_test;
reg [7:0]A;                  
reg [7:0]B;
reg Cin;

wire [7:0]Sum;
wire Cout;
eightbit_fulladder g(A,B,Cin,Sum,Cout); //A,B ->8 bit input numbers Cin->Carry input Cout->Carry Output
initial begin
    $dumpfile("eight_full_adder.vcd");
    $dumpvars(0,eight_bit_full_adder_test);
    $monitor($time, " A=%b,B=%b,Sum=%b,Cout=%b",A,B,Sum,Cout);
   #5 A=2;B=3;Cin=0;
    end
endmodule 