`include "aes.v"
module aes_testbench;
reg [127:0] key,plaintext;
reg clk;
wire [127:0] ciphertext,state_register2;
aes a1(.clk(clk),.key(key),.plaintext(plaintext),.ciphertext(ciphertext));
always
#5 clk <= ~clk;
initial 
begin
    # 301 $display("Plain Text = %h, Input Key = %h\n",plaintext,key);
end
initial begin
    clk <=1;
    $dumpfile("aes.vcd");
    $dumpvars(0,aes_testbench);
    $monitor($time, " clock=%b,Ciphertext=%h",clk,ciphertext);
   #0;plaintext=128'h01234567890123456789012345678901;key=128'h00000000009876543210987654321098;
   #302; $finish;
    end
endmodule 

