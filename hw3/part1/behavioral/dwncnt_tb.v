module dwncnt_tb;
wire [2:0] count;
reg start;
reg a_reset;
reg s_reset;
reg clk;

dwncnt uut(count, start, a_reset, s_reset, clk);
initial
begin
	clk =0;
	start = 0;
	a_reset = 1;
	s_reset = 1;
	#25;
	a_reset = 0;
	#5
	a_reset = 1;
	#100
	start = 1;
	#200
	start = 0;
	#150
	start = 1;
	#200
	start = 0;
	#125
	start = 1;
	#406;
	s_reset = 0;
end
always
	#50 clk = ~clk;
	
endmodule