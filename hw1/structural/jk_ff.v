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
   wire d;
   wire j_not, k_not;
   wire multi1, multi2, multi3, multi4;
   wire qint, q_barint;
   not n1(j_not, j);
   not n2(k_not, k);
   and n3(multi1, j_not, k_not, qint);
   and n4(multi2, j, k, q_bar); 
   and n5(multi3, j_not, k, 1'b0);
   and n6(multi4, j,k_not, 1'b1);
   or n7(d, multi1, multi2, multi3, multi4);
   d_ff d1(qint, q_barint, d, a_reset, reset, enable, clk);
   buf b1(q, qint);
   buf b2(q_bar, q_barint);
   
   
endmodule

