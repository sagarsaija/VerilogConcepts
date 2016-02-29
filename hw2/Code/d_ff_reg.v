// Template for problem e

module d_ff_reg(q, q_bar, d, a_reset, reset, enable, clk);
   output [3:0] q;
   output [3:0] q_bar;
   input  [3:0] d;
   input  a_reset;
   input  reset;
   input  enable;
   input  clk;

  d_ff d0(q[0],q_bar[0], d[0],a_reset, reset, enable, clk);
  d_ff d1(q[1],q_bar[1], d[1],a_reset, reset, enable, clk);
  d_ff d2(q[2],q_bar[2], d[2],a_reset, reset, enable, clk);
  d_ff d3(q[3],q_bar[3], d[3],a_reset, reset, enable, clk);
  
endmodule

