`include "multiplier.v"
module multiplier_test;
reg [3:0]A;
reg [3:0]B;
wire [7:0]Product,Sum1,Sum2;//A,B-> 4 bit numbers ,Product-> Product  Sum1,Sum2->temporary Sums Output

multiply g(A,B,Product,Sum1,Sum2); 

initial begin
    $dumpfile("mutilier.vcd");
    $dumpvars(0,multiplier_test);
     
    $monitor(" A=%b,B=%b,\n Product in Binary=%b,\n Sum1=%b, Sum2=%b",A,B,Product,Sum1,Sum2);
    
   A=3;B=10;
end
    
    
endmodule 