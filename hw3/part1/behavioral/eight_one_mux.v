// Template for problem b

module eight_one_mux(data_out, data_in, sel);
	output data_out;
	input [7:0] data_in;
	input [2:0] sel;
	wire [2:0] sel_not;
	wire [7:0] mux_int;
	
	not n0(sel_not[0],sel[0]);
	not n1(sel_not[1],sel[1]);
	not n2(sel_not[2],sel[2]);

	
	and a0(mux_int[0], sel_not[0], sel_not[1], sel_not[2], data_in[0]);
	and a1(mux_int[1], sel[0], sel_not[1], sel_not[2], data_in[1]);
	and a2(mux_int[2], sel_not[0], sel[1], sel_not[2], data_in[2]);
	and a3(mux_int[3], sel[0], sel[1], sel_not[2], data_in[3]);
	and a4(mux_int[4], sel_not[0], sel_not[1], sel[2], data_in[4]);
	and a5(mux_int[5], sel[0], sel_not[1], sel[2], data_in[5]);
	and a6(mux_int[6], sel_not[0], sel[1], sel[2], data_in[6]);
	and a7(mux_int[7], sel[0], sel[1], sel[2], data_in[7]);	
	
	or o0(data_out, mux_int[0], mux_int[1], mux_int[2], mux_int[3], mux_int[4], mux_int[5], mux_int[6], mux_int[7]);
	
	
endmodule

