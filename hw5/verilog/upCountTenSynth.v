
module upCountTenSynth ( clk, a_reset, enable, count );
  output [3:0] count;
  input clk, a_reset, enable;
  wire   n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32;

  FD2 \count_reg[0]  ( .D(n20), .CP(clk), .CD(n19), .Q(count[0]), .QN(n15) );
  FD2 \count_reg[1]  ( .D(n18), .CP(clk), .CD(n19), .Q(count[1]), .QN(n14) );
  FD2 \count_reg[2]  ( .D(n17), .CP(clk), .CD(n19), .Q(count[2]), .QN(n21) );
  FD2 \count_reg[3]  ( .D(n16), .CP(clk), .CD(n19), .Q(count[3]), .QN(n13) );
  MUX21L U20 ( .A(enable), .B(n22), .S(n15), .Z(n20) );
  AO7 U21 ( .A(n14), .B(n23), .C(enable), .Z(n22) );
  IV U22 ( .A(a_reset), .Z(n19) );
  MUX21L U23 ( .A(n24), .B(n25), .S(n14), .Z(n18) );
  ND2 U24 ( .A(enable), .B(count[0]), .Z(n25) );
  AO6 U25 ( .A(n15), .B(n23), .C(n26), .Z(n24) );
  OR2 U26 ( .A(count[2]), .B(n13), .Z(n23) );
  EO U27 ( .A(n21), .B(n27), .Z(n17) );
  ND2 U28 ( .A(n28), .B(count[0]), .Z(n27) );
  MUX21L U29 ( .A(n29), .B(n30), .S(n13), .Z(n16) );
  ND3 U30 ( .A(count[0]), .B(count[2]), .C(n28), .Z(n30) );
  NR2 U31 ( .A(n31), .B(n32), .Z(n29) );
  EO U32 ( .A(n21), .B(n15), .Z(n32) );
  IV U33 ( .A(n28), .Z(n31) );
  NR2 U34 ( .A(n26), .B(n14), .Z(n28) );
  IV U35 ( .A(enable), .Z(n26) );
endmodule

