`include "full_adder.v"
module eightbit_fulladder(A,B,Cin,Sum,Cout);
    input [7:0]A,B;
    input Cin;
    output [7:0]Sum;
    output Cout; //A,B ->8 bit input numbers Cin->Carry input Cout->Carry Output Sum
    full_adder f1(.A(A[0]),.B(B[0]),.Cin(Cin),.Sum(Sum[0]),.Cout(t0));
    full_adder f2(.A(A[1]),.B(B[1]),.Cin(t0),.Sum(Sum[1]),.Cout(t1));
    full_adder f3(.A(A[2]),.B(B[2]),.Cin(t1),.Sum(Sum[2]),.Cout(t2));
    full_adder f4(.A(A[3]),.B(B[3]),.Cin(t2),.Sum(Sum[3]),.Cout(t3));
    full_adder f5(.A(A[4]),.B(B[4]),.Cin(t3),.Sum(Sum[4]),.Cout(t4));
    full_adder f6(.A(A[5]),.B(B[5]),.Cin(t4),.Sum(Sum[5]),.Cout(t5));
    full_adder f7(.A(A[6]),.B(B[6]),.Cin(t5),.Sum(Sum[6]),.Cout(t6));
    full_adder f8(.A(A[7]),.B(B[7]),.Cin(t6),.Sum(Sum[7]),.Cout(Cout));
endmodule