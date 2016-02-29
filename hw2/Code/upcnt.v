module upcnt(count, start, a_reset, s_reset, clk);
output [3:0] count;
input start;
input a_reset;
input s_reset;
input clk;
wire [3:0] valStore;
wire [3:0] invStore;
wire [3:0] cStore;
wire [3:0] sumStore;

d_ff d0(valStore[0],invStore[0],sumStore[0], a_reset, s_reset, 1'b0, clk);
d_ff d1(valStore[1],invStore[1],sumStore[1], a_reset, s_reset, 1'b0, clk);
d_ff d2(valStore[2],invStore[2],sumStore[2], a_reset, s_reset, 1'b0, clk);
d_ff d3(valStore[3],invStore[3],sumStore[3],  a_reset, s_reset, 1'b0, clk);


fullAdder f0(sumStore[0], cStore[0],valStore[0],start,1'b0);
fullAdder f1(sumStore[1], cStore[1],valStore[1],1'b0,cStore[0]);
fullAdder f2(sumStore[2], cStore[2],valStore[2],1'b0,cStore[1]);
fullAdder f3(sumStore[3], cStore[3],valStore[3],1'b0,cStore[2]);

buf b0(count[0], valStore[0]);
buf b1(count[1], valStore[1]);
buf b2(count[2], valStore[2]);
buf b3(count[3], valStore[3]);





endmodule