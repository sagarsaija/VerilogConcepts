module upcnt_tb;
wire [3:0] count;
reg start;
reg a_reset;
reg s_reset;
reg clk;

upcnt uut(count, start, a_reset, s_reset, clk);
initial
begin
	clk =0;
	start = 0;
	a_reset = 1;
	s_reset = 1;
	#25;
	a_reset = 0;
	#5;
	a_reset = 1;
	#100;
	start = 1;
	#200;
	start = 0;
	#225;
	start = 1;
	#200;
	start = 0;
	#175;
	start = 1;
	#1506;
	s_reset = 0;
end
always
	#50 clk = ~clk;
	
endmodule