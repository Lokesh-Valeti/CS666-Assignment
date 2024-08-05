`include "eight_bit_full_adder.v"
module multiply(A,B,Product,Sum1,Sum2);
input [3:0]A,B;
output [7:0]Product;
wire [0:0]Paprod[3:0][7:0]; //Partial Products array
genvar  i,j,count;
output [0:7]Sum1,Sum2;
wire [0:8]C1,C2;
wire t0,t1;//A,B-> 4 bit numbers ,Product-> Product  Sum1,Sum2->temporary Sums Output C1,C2->for storing temporary carries generated during summing 

generate 
for (i = 0;i <4;i=i+1) begin 
    for (j =0;j<4;j=j+1) begin
        if(i!=0) begin
            and d(Paprod[i][6-j-i],A[j],B[i]);
        end
          
        else begin
            and d1(Paprod[i][7-j],A[j],B[i]); 
        end
         
    end
    if(i!=0) begin
        for(j=2-i;j>=0;j=j-1) begin
        assign Paprod[i][j]=1'b0;    
    end
    end
    else begin
        for(j=3-i;j>=0;j=j-1) begin
        assign Paprod[i][j]=1'b0;    
    end
    end
    
    for(count=0;count<(i+1);count=count+1) begin 
        if(i!=0) begin
            assign Paprod[i][7-count]=1'b0;
        end 
        else begin
            assign t1=1'b0; 
        end
       
    end
end
    genvar k;
    assign C1[0]=1'b0;
for (k=7 ;k>=0 ;k=k-1 ) begin
    full_adder f1(.A(Paprod[0][k]),.B(Paprod[1][k]),.Cin(C1[7-k]),.Sum(Sum1[k]),.Cout(C1[7-k+1]));    
    end
assign C2[0]=1'b0;
    for ( k=7 ;k>=0 ;j=k-1 ) begin
    full_adder f2(.A(Paprod[2][k]),.B(Paprod[3][k]),.Cin(C2[7-k]),.Sum(Sum2[k]),.Cout(C2[7-k+1]));   
end
eightbit_fulladder f3(.A(Sum1),.B(Sum2),.Cin(C2[8]),.Sum(Product),.Cout(t0));
endgenerate
endmodule