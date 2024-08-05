`include "or_gate.v"
module mux_2to1(select_line,input_state1,input_state2,output_state);
    input select_line;
    input [127:0] input_state1,input_state2;
    output [127:0] output_state;
    wire select_line_neg;
    wire [127:0] state_register6,state_register7,state_register8;
    assign select_line_neg=~select_line;
    and_gate a2(.c(state_register6),.b(select_line_neg),.a(input_state1));
    and_gate a3(.c(state_register7),.b(select_line),.a(input_state2));
    or_gate or1(.c(state_register8),.b(state_register6),.a(state_register7));
    generate
        assign output_state=state_register8;
    endgenerate
endmodule
//mux working good