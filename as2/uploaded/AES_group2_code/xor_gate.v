module xor_gate(a,b,c);
    input [127:0] a,b;
    output [127:0] c;
    genvar i;
    generate
        for (i =0 ;i<128 ;i=i+1 ) begin
            xor x1(c[i],a[i],b[i]);
        end
    endgenerate
endmodule

//xor gate tested working good