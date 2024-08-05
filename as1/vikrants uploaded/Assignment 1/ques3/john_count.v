`include "d_flipflop.v"
module johnson(clk,rst,state);
input clk,rst;
output [0:3]state;  //clk-> clock rst->reset state->values of q at the various flipflops
d_flipflop d1(.d(~state[3]),.clk(clk),.rst(rst),.q(state[0]));
d_flipflop d2(.d(state[0]),.clk(clk),.rst(rst),.q(state[1]));
d_flipflop d3(.d(state[1]),.clk(clk),.rst(rst),.q(state[2]));
d_flipflop d4(.d(state[2]),.clk(clk),.rst(rst),.q(state[3]));
endmodule