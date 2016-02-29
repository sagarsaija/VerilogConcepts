// Template for problem c

module three_eight_dec(data_out, data_in);
	output [7:0] data_out;
	input [2:0] data_in;
	wire [2:0] data_in_not;
	not n0 (data_in_not[0], data_in[0]);
	not n1 (data_in_not[1], data_in[1]);
	not n2 (data_in_not[2], data_in[2]);
	and a0(data_out[0], data_in_not[0],data_in_not[1], data_in_not[2]); 
	and a1(data_out[1], data_in[0],data_in_not[1], data_in_not[2]); 
	and a2(data_out[2], data_in_not[0],data_in[1], data_in_not[2]); 
	and a3(data_out[3], data_in[0],data_in[1], data_in_not[2]); 
	and a4(data_out[4], data_in_not[0],data_in_not[1], data_in[2]); 
	and a5(data_out[5], data_in[0],data_in_not[1], data_in[2]); 
	and a6(data_out[6], data_in_not[0],data_in[1], data_in[2]); 
	and a7(data_out[7], data_in[0],data_in[1], data_in[2]); 

	
endmodule

