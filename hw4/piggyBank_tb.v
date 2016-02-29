module piggyBank_tb;
wire [3:0] digTwo;
wire [3:0] digOne;
reg clk, reset, penny, nickel, dime, quarter, apple, banana, carrot, date;

piggyBank m0(clk, reset, penny, nickel, dime, quarter, apple, banana, carrot, date, digOne, digTwo);
initial
begin
	clk = 0;
	{penny, nickel, dime, quarter, apple, banana, carrot, date} = 8'b00000000;
end

initial 
begin
	reset = 1;
	@(posedge clk);
	reset = 0;
	penny = 1;
	@(posedge clk);
	penny = 0;
	dime = 1;
	@(posedge clk);
	{dime,nickel} = 2'b01;
	@(posedge clk);
	{nickel, quarter} = 2'b01;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	{quarter, apple} = 2'b01;
	@(posedge clk);
	{quarter, apple} = 2'b10;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	{quarter, banana} = 2'b01;
	@(posedge clk);
	{banana, carrot} = 2'b01;
	@(posedge clk);
	{carrot, date} = 2'b01;
	@(posedge clk);
	date = 1'b0;

end

always
	#50 clk = ~clk;



 
endmodule