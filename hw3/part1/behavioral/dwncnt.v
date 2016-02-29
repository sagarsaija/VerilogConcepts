module dwncnt(count, start, a_reset, s_reset, clk);
output [3:0] count;
input start;
input a_reset;
input s_reset;
input clk;
wire [3:0] valStore;
wire [3:0] invStore;
wire [3:0] cStore;
wire [3:0] sumStore;
wire notStart, addbit, intaddbit;
not n0(notStart, start);

d_ff d0(valStore[0],invStore[0],sumStore[0], a_reset, s_reset, notStart, clk);
d_ff d1(valStore[1],invStore[1],sumStore[1], a_reset, s_reset, notStart, clk);
d_ff d2(valStore[2],invStore[2],sumStore[2], a_reset, s_reset, notStart, clk);

and a0 (addbit,invStore[0], invStore[1], invStore[2]);
not(intaddbit, addbit);
fullAdder f0(sumStore[0], cStore[0],valStore[0],intaddbit,1'b0);
fullAdder f1(sumStore[1], cStore[1],valStore[1],1'b1,cStore[0]);
fullAdder f2(sumStore[2], cStore[2],valStore[2],1'b1,cStore[1]);


buf b0(count[0], valStore[0]);
buf b1(count[1], valStore[1]);
buf b2(count[2], valStore[2]);

endmodule