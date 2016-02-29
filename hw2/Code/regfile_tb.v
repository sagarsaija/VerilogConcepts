module regfile_tb;
wire [3:0] d_out;
reg [3:0] d_in;
reg [3:0] a_in;
reg a_reset;
reg we;
reg clk;

regfile uut(d_out, d_in, a_in, a_reset, we ,clk);

initial
begin
	clk =0;
	we = 0;
	a_reset = 1;
	#10;
	a_reset = 0;
	#5;
	a_reset = 1;
	#100;
	a_in = 3'b000;
	d_in = 4'b1010;
	we = 1;
	#100
	a_in = 3'b001;
	d_in = 4'b0001;
	#100
	a_in = 3'b010;
	d_in = 4'b0010;
	#50
	we = 0;
	#50
	a_in = 3'b000;
	d_in = 4'b0000;
	#100
	a_in = 3'b001;
	#50 
	a_in = 3'b000;
	#50
	a_reset = 0;
	#225
	a_in = 3'b100;


end
always
	#50 clk = ~clk;
	
endmodule