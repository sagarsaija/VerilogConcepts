// Template for problem e

module d_ff(q, q_bar, d, a_reset, reset, enable, clk);
   output q;
   output q_bar;
   input  d;
   input  a_reset;
   input  reset;
   input  enable;
   input  clk; 
   wire d_int;
   wire intermediate1, intermediate2;
   wire q_notOut, q_bar_notOut;
   wire dff2;
   wire df3;
   wire a_reset_int;
   wire reset_int;
   wire reset_con;
   wire clock_not; 
   wire ints21, ints22;
   //enable
   wire enable1, enable2, enable_not, d_pre_int;
   
   //handling resets
   not a0(a_reset_int, a_reset);
   not a1(reset_int, reset);
   nor a2(reset_con, reset_int, a_reset_int);
   and a3(d_int, reset_con, d_pre_int);
   //asynch reset output-adjuster
 
  and z2(ints22, a_reset, df3);
  or z1(ints21, a_reset_int, clk);  
   
   //enable
	and b0(enable1, enable, q);
	not b1(enable_not, enable);
	and b2(enable2, enable_not, d);
	or b3(d_pre_int, enable1, enable2);
	
   //basic clocked d-ff

    not n15(clock_not, clk);
    d_latch d1(df3, dff2, d_int, clock_not);
    d_latch d2(q, q_bar, ints22, ints21);
  
endmodule

