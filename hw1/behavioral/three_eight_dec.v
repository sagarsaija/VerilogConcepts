// Template for problem c

module three_eight_dec(data_out, data_in);
	output reg [7:0] data_out;
	input [2:0] data_in;
	always @(data_in)
	begin
		data_out = 8'b00000000;
		data_out[data_in] = 1'b1;
	end
	
endmodule

