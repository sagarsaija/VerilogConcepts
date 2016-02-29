module miter_tb;
wire correctness;
reg start;
reg a_reset;
reg clk;

miter uut(clk, a_reset, start, correctness);
initial
begin
	clk =0;
	start = 0;
	a_reset = 1;
	#25;
	a_reset = 0;
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

end
always
	#50 clk = ~clk;
	
endmodule