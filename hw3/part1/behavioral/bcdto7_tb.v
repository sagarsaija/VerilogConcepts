module bcdto7_tb;
wire [6:0] all_out;
reg [3:0] d_in;

bcdto7 uut(all_out, d_in);
initial
	d_in = 0;
always
	#50 d_in = d_in + 1;
	
endmodule