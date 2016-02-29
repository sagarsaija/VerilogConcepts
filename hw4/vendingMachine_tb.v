module vendingMachine_tb;
wire [6:0] digit1, digit0;
reg clk, reset, in, buy;
reg [1:0] product;
event coins;
vendingMachine v0(clk, reset, in, buy, product, digit1, digit0);
initial
begin
	clk = 0;
	in = 1;
	{buy, product} = 3'b000;
end

initial 
begin
	reset = 1;
	@(posedge clk);
	reset = 0;
  in = 0;
 	@(posedge clk) in = 1;
 	@(posedge clk) in = 0;
 	@(posedge clk) in = 0;
  @(posedge clk) in = 0;
  @(posedge clk) in = 1;
  @(posedge clk) in = 0;
  @(posedge clk) in = 1;
  @(posedge clk) in = 0;
  @(posedge clk) in = 0;
  @(posedge clk) in = 1;
  @(posedge clk) in = 0;
  @(posedge clk) in = 1;
  @(posedge clk) in = 1;
  @(posedge clk) in = 1;
  @(posedge clk) in = 0;
  @(posedge clk) in = 1;
  @(posedge clk) in = 1;
  @(posedge clk) in = 1;
  @(posedge clk) in = 0;
  @(posedge clk) in = 0;
  @(posedge clk) in = 1;
  @(posedge clk) in = 0;
  @(posedge clk) in = 1;
  @(posedge clk) in = 0;
  -> coins;
end

initial 
begin
	@(coins);
	@(posedge clk);
	buy = 1;
	product = 2'b01;
	@(posedge clk);
	buy = 0;
	@(posedge clk);
	buy = 1;
	product = 2'b10;
	@(posedge clk);
	buy = 0;
	@(posedge clk);
	buy = 1;
	product = 2'b11;
	

end
always
	#50 clk = ~clk;



 
endmodule