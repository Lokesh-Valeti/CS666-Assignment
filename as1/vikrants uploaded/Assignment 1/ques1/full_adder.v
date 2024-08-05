module full_adder(A,B,Cin,Sum,Cout);
input A,B,Cin;
output Sum,Cout; //A,B ->1 bit input numbers Cin->Carry input Cout->Carry Output Sum->Sum
wire t1,t2,t3;   //Temporary wires for storing temporary values
xor(Sum,A,B,Cin);  //Getting Sum
and(t1,A,B);
and(t2,B,Cin);
and(t3,A,Cin);
or (Cout,t1,t2,t3); //Getting Carry out->Cout
endmodule
