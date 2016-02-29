module machine_x_shift(z, clk, in, reset);
output z;
input clk, in, reset;
reg [4:0] shift;


always @(posedge clk or negedge reset)
	if(~reset)
		shift <= 5'b11111;
	else
	begin
	 shift[0] <= shift[1];
	 shift[1] <= shift[2];
	 shift[2] <= shift[3];
	 shift[3] <= shift[4];
	 shift[4] <= in;
	end


assign z = ~shift[4]&shift[3]&~shift[2]&~shift[1]|~shift[4]&~shift[3]&~shift[2]&shift[1]&~shift[0];





endmodule
