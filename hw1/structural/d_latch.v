// Template for problem f

module d_latch(q, q_bar, d, clk);
   output q;
   output q_bar;
   input  d;
   input  clk;
	wire aWire1, aWire2, q_int, q_int_bar;
	nand n1(aWire1,clk,d);
	nand n2(aWire2, aWire1, clk);
	nand n3(q_int_bar,aWire2,q_int);
	nand n4(q_int, q_int_bar, aWire1);
	buf b1(q, q_int);
	buf b2(q_bar, q_int_bar);

endmodule

