module and_gate(a,b,c);
    input [127:0] a;
    input b;
    output [127:0] c;
    wire [127:0] temp;
    genvar i;
    generate
        for(i=0;i<128;i=i+1) begin
           assign temp[i]=b;
        end
        for (i =0 ;i<128 ;i=i+1 ) begin
            and a1(c[i],a[i],temp[i]);
        end
    endgenerate
endmodule
