// Template for problem b

module eight_one_mux(data_out, data_in, sel);
	output reg data_out;
	input [7:0] data_in;
	input [2:0] sel;
	
	always @ (data_in or sel)
	begin
		data_out = data_in[sel];
	end
endmodule

