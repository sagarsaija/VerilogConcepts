module miter_tb;
wire correctBit;
reg a_reset, s_reset, start, clk;

miter m0(correctBit, start, a_reset, s_reset, clk);
initial
begin
	s_reset = 1;
	a_reset = 0;
	clk = 0;
	start = 0;
	#10;
	a_reset = 1;
	#100;
	start = 1;
	#1500;
	start = 0;
	#200;
	a_reset = 0;
	#10;
	a_reset = 1;
	








end

always
	#50 clk = ~clk;



 



endmodule