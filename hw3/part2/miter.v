module miter(correctBit, clk, in, reset);
output correctBit;
input clk;
input in;
input reset;
input clk;

wire intwire_state;
wire intwire_shift;


machine_x_state s0(intwire_state, clk, in, reset);
machine_x_shift b0(intwire_shift, clk, in, reset);



xor x0(correctBit, intwire_state, intwire_shift);




endmodule