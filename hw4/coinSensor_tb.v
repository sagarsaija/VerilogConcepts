module coinSensor_tb;
wire penny, nickel, dime, quarter;
reg reset, in, clk;

coinSensor m0(clk, reset, in, penny, nickel, dime, quarter);
initial
begin
	clk = 0;
	in = 1;
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
end

always
	#50 clk = ~clk;



 
endmodule