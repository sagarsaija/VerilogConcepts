module fullAdder(valOut, cOut, aIn, bIn, cIn);
output valOut, cOut;
input aIn, bIn, cIn;
wire inter1, inter2, inter3, inter4;

xor x1(inter1, aIn, bIn);
xor x2(valOut, inter1, cIn);
and a0(inter3, aIn, bIn);
and a1(inter4, inter1, cIn);
or o0(cOut, inter3, inter4);

endmodule