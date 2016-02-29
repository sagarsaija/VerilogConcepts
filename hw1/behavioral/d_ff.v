// Template for problem e

module d_ff(q, q_bar, d, a_reset, reset, enable, clk);
   output reg q;
   output reg q_bar;
   input  d;
   input  a_reset;
   input  reset;
   input  enable;
   input  clk;
   always @(posedge clk or negedge a_reset)
   begin
		if(a_reset == 1'b0 || reset == 1'b0)
		begin
			q <= 1'b0;
			q_bar <= 1'b1;
		end
		else
		begin
			if(enable == 1'b0)
			begin
				q <= d;
				q_bar <= ~d;
			end
		end
   
   end   
   
endmodule

