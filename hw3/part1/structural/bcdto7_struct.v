module bcdto7_struct(all_out, d_in);
output [6:0] all_out;
input [3:0] d_in;
wire z_bar, y_bar, w_bar, x_bar;
wire z, y, w, x;

wire [22:0] intwire;

not n0(x_bar, d_in[0]);
not n1(w_bar, d_in[1]);
not n2(y_bar, d_in[2]);
not n3(z_bar, d_in[3]);

buf b0(x, d_in[0]);
buf b1(w, d_in[1]);
buf b2(y, d_in[2]);
buf b3(z, d_in[3]);

and a0(intwire[0], w_bar, y ,z);
and a1(intwire[1], z, y_bar, w , x);
and a2(intwire[2], x_bar, w_bar, y);
and a3(intwire[3], z_bar, y_bar, w_bar, x);
and a4(intwire[4], w, x ,z);
and a5(intwire[5], z, y ,x_bar);
and a6(intwire[6], w, x_bar, y);
and a7(intwire[7],w_bar, x, z_bar, y);
and a8(intwire[8], w, z, y);
and a9(intwire[9], w, x_bar, y_bar, z_bar);
and a10(intwire[10], w, x, y);
and a11(intwire[11], z_bar, y, w_bar, x_bar);
and a12(intwire[12], z, y_bar, w, x_bar);
and a13(intwire[13], z_bar, x);
and a14(intwire[14], z_bar, y, w_bar);
and a15(intwire[15], y_bar, w_bar, x);
and a16(intwire[16], z, y, w_bar, x);
and a17(intwire[17], z_bar, w, x);
and a18(intwire[18], z_bar, y_bar, x);
and a19(intwire[19], z_bar, y_bar, w);
and a20(intwire[20], z_bar, y, w, x);
and a21(intwire[21], z, y, w_bar, x_bar);
and a22(intwire[22], z_bar, y_bar, w_bar);


or fA(all_out[0], intwire[0],intwire[1],intwire[2],intwire[3]);
or fB(all_out[1], intwire[4], intwire[5], intwire[6], intwire[7]);
or fC(all_out[2], intwire[8], intwire[9]);
or fD(all_out[3], intwire[10], intwire[3], intwire[11], intwire[12]);
or fE(all_out[4], intwire[14], intwire[15], intwire[13]);
or fF(all_out[5], intwire[16], intwire[17], intwire[18], intwire[19]);
or fG(all_out[6], intwire[20], intwire[21], intwire[22]);





endmodule