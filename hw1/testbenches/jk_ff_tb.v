`timescale 1ns/1ns

module jk_ff_tb;
wire q, q_bar;
reg j, k, a_reset, reset, enable, clk;

jk_ff uut(q, q_bar, j, k , a_reset, reset, enable, clk);
initial
begin
  clk = 0;
  reset = 1;
  a_reset = 1;
  enable = 0;
  j = 0;
  k = 1;
end
always
	#50 clk = ~clk;



endmodule