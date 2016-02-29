// Template for problem f

module jk_ff(q, q_bar, j, k, a_reset, reset, enable, clk);
   output q;
   output q_bar;
   input  j;
   input  k;
   input  a_reset;
   input  reset;
   input  enable;
   input  clk;
   reg d;
   
   d_ff u0 (q, q_bar, d, a_reset, reset, enable, clk);
	always @(j, k, clk)
	begin
		if(j != k)
			d <= j;
		else
			if(j == 1'b1)
				d <= q_bar;
			else
				d <= q;		
	end
		
		
		
		
endmodule

