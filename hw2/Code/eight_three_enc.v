// Template for problem d

module eight_three_enc(data_out, data_in);
	output [2:0] data_out;
	input [7:0] data_in;
	
	or o0(data_out[0], data_in[1], data_in[3], data_in[5], data_in[7]);
	or o1(data_out[1], data_in[2], data_in[3], data_in[6], data_in[7]);
	or o2(data_out[2], data_in[4], data_in[5], data_in[6], data_in[7]);
	
endmodule

