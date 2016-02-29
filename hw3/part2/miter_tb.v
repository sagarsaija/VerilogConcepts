module miter_tb;
wire correctBit;
reg a_reset, in, clk;
reg [0:29] iStream = 30'b010001011010100001100100110011; 
integer i;
miter m0(correctBit, clk, in, a_reset);
initial
begin
	i = 0;
	a_reset = 0;
	clk = 0;
	in = 1;
	#10;
	a_reset = 1;
	#90;
end

always
begin
	#100;
	in = iStream[i];
	if(i < 29)
		i = i + 1;		
end

always
	#50 clk = ~clk;



 



endmodule