module sevenSegDispMngr_tb;

reg clk, reset, apple, banana, carrot, date, error;
reg [3:0] digTwo, digOne;
wire[6:0] digit1, digit0;

sevenSegDispMngr m0(clk, reset, apple, banana, carrot, date, error, digTwo, digOne,digit1, digit0);
initial
begin
	clk = 0;
	{reset, apple, banana, carrot, date, error,digTwo,digOne} = 14'b10000000000000;
end

initial 
begin
	@(posedge clk);
	reset = 0;
	@(posedge clk);
	carrot = 1;
	@(posedge clk);
	carrot = 0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	banana = 1;
	@(posedge clk);
	banana = 0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	apple = 1;
	@(posedge clk);
	apple = 0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	error = 1;
	@(posedge clk);
	error = 0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	date = 1;
	@(posedge clk);
	date = 0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	digTwo = 7;
	digOne = 2;
end

always
	#50 clk = ~clk;

 
endmodule