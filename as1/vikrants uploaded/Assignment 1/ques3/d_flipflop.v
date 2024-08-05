module d_flipflop(d,clk,rst,q);
input d,clk,rst;                  // d->input clk->clock rst->reset q->output
output reg q;

always @(posedge clk) begin
    if (rst) begin               // when rst is 1 then output is set to 0
         q=1'b0;    
    end
    else begin
    q=d;                        // else output is d

    end
end
endmodule
