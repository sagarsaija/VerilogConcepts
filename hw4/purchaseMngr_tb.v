module purchaseMngr_tb;

reg clk, buy;
reg[1:0] product;
reg [3:0] digTwo, digOne;
wire[6:0] digit1, digit0;
wire apple, banana, carrot, date, error;

purchaseMngr m0(clk, buy, product, digOne, digTwo, apple, banana, carrot, date, error);
initial
begin
	clk = 0;
	{buy, product, digTwo, digOne} = 11'b00000000000;
end

initial 
begin
	@(posedge clk);
		buy = 1;
	@(posedge clk);
		buy = 0;
		digTwo = 7;
	@(posedge clk);
		buy = 1;
	@(posedge clk);
		buy = 0;
		digOne = 5;
	@(posedge clk);
	@(posedge clk);
		buy = 1;
	@(posedge clk);
	   buy = 0;
	@(posedge clk);
		digTwo = 4;
		
		product = 2'b01;
	@(posedge clk);
		buy = 1;
	@(posedge clk);
		buy = 0;
		product = 2'b10;
	@(posedge clk);
		buy = 1;
	@(posedge clk);
		buy = 0;
		product = 2'b11;
	@(posedge clk);
		buy = 1;
	@(posedge clk);
		buy = 0;
end

always
	#50 clk = ~clk;

 
endmodule