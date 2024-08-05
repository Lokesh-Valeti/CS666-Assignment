`include "round.v"
`include "xor_gate.v"
module aes(clk,key,plaintext,ciphertext);
    input [127:0] key,plaintext;
    input clk;
    output [127:0] ciphertext;
    wire [127:0] key_s[10:0];
    wire [3:0] counter[10:0];
    wire [127:0] state_register[10:0];
    aes_key_expand_128 key_ex(clk,key, key_s[0],key_s[1],key_s[2],key_s[3],key_s[4],key_s[5],key_s[6],key_s[7],key_s[8],key_s[9],key_s[10]);
    

 assign state_register[0]=plaintext^key_s[0]; 
    genvar i;
    assign counter[0]=4'b0000;
    generate
         for ( i=1 ;i<11 ;i=i+1 ) begin
            assign counter[i]=counter[i-1]+4'b001;
            round round_rr(.clk(clk),.input_counter(counter[i]),.key(key_s[i]),.input_state(state_register[i-1]),.output_state(state_register[i]));  
         end
    endgenerate
       assign ciphertext=state_register[10];
     

endmodule