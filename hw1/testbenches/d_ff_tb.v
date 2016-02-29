module d_ff_tb;
wire q, q_bar;
reg d, a_reset, reset, enable, clk;

d_ff uut(q, q_bar, d , a_reset, reset, enable, clk);
initial
begin
  clk = 0;
  reset = 1;
  a_reset = 1;
  enable = 0;
  d = 0;
end
always
	#50 clk = ~clk;



endmodule