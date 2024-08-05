`include "aes_key_expand.v"
`include "subbytes.v"
`include "shiftrows.v"
`include "combinational_logic.v"
module round(clk,input_counter,key,input_state,output_state);
input clk;
input [3:0] input_counter;
input [127:0] key,input_state;
output [127:0] output_state;
wire [127:0] state_inter1,state_inter2;
subbytes sb(.clk(clk),.data(input_state),.s_data_out(state_inter1));
shiftrows sr(.clk(clk),.data_in(state_inter1),.data_out(state_inter2));
combinational_logic m(.clk(clk),.i_p(state_inter2),.counter(input_counter),.o_p(output_state),.key(key));


endmodule