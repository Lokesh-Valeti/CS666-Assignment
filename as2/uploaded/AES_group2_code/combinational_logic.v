`include "mixcolumn.v"
`include "mux.v"
`include "and_gate.v"
module combinational_logic(clk,i_p,counter,o_p,key);
input clk;
input [3:0] counter;
input [127:0] i_p,key;
output [127:0] o_p;
wire x;
wire [127:0] state_inter4,output_state;
and g1(x,counter[3],counter[1]);
mixcolumn mc(.clk(clk),.data_in(i_p),.data_out(state_inter4)); //correct
mux_2to1 m1(.select_line(x),.input_state1(state_inter4),.input_state2(i_p),.output_state(output_state)); 
xor_gate x2(.c(o_p),.a(output_state),.b(key));

endmodule