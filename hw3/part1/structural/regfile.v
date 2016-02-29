module regfile(d_out, d_in, a_in, a_reset, we, clk);
output [3:0] d_out;
input [3:0] d_in;
input [2:0]a_in;
input a_reset;
input we;
input clk;

wire [7:0] enableBus; 
wire [7:0] enableBusBar;
wire [7:0] enable_int;


three_eight_dec D1(enableBus,a_in);
and a0(enable_int[0], enableBus[0], we);
and a1(enable_int[1], enableBus[1], we);
and a2(enable_int[2], enableBus[2], we);
and a3(enable_int[3], enableBus[3], we);
and a4(enable_int[4], enableBus[4], we);
and a5(enable_int[5], enableBus[5], we);
and a6(enable_int[6], enableBus[6], we);
and a7(enable_int[7], enableBus[7], we);
not n0(enableBusBar[0],enable_int[0]);
not n1(enableBusBar[1],enable_int[1]);
not n2(enableBusBar[2],enable_int[2]);
not n3(enableBusBar[3],enable_int[3]);
not n4(enableBusBar[4],enable_int[4]);
not n5(enableBusBar[5],enable_int[5]);
not n6(enableBusBar[6],enable_int[6]);
not n7(enableBusBar[7],enable_int[7]);

wire [3:0] wireData[7:0];
wire [3:0] wireDataBar[7:0];
d_ff_reg d0 ( wireData[0],wireDataBar[0],d_in,a_reset, a_reset, enableBusBar[0], clk);
d_ff_reg d1 ( wireData[1],wireDataBar[1],d_in,a_reset, a_reset, enableBusBar[1], clk);
d_ff_reg d2 ( wireData[2],wireDataBar[2],d_in,a_reset, a_reset, enableBusBar[2], clk);
d_ff_reg d3 ( wireData[3],wireDataBar[3],d_in,a_reset, a_reset, enableBusBar[3], clk);
d_ff_reg d4 ( wireData[4],wireDataBar[4],d_in,a_reset, a_reset, enableBusBar[4], clk);
d_ff_reg d5 ( wireData[5],wireDataBar[5],d_in,a_reset, a_reset, enableBusBar[5], clk);
d_ff_reg d6 ( wireData[6],wireDataBar[6],d_in,a_reset, a_reset, enableBusBar[6], clk);
d_ff_reg d7 ( wireData[7],wireDataBar[7],d_in,a_reset, a_reset, enableBusBar[7], clk);

eight_one_mux e0 (d_out[0], {wireData[7][0], wireData[6][0], wireData[5][0], wireData[4][0], wireData[3][0], wireData[2][0], wireData[1][0], wireData[0][0]},a_in);
eight_one_mux e1 (d_out[1], {wireData[7][1], wireData[6][1], wireData[5][1], wireData[4][1], wireData[3][1], wireData[2][1], wireData[1][1], wireData[0][1]},a_in);
eight_one_mux e2 (d_out[2], {wireData[7][2], wireData[6][2], wireData[5][2], wireData[4][2], wireData[3][2], wireData[2][2], wireData[1][2], wireData[0][2]},a_in);
eight_one_mux e3 (d_out[3], {wireData[7][3], wireData[6][3], wireData[5][3], wireData[4][3], wireData[3][3], wireData[2][3], wireData[1][3], wireData[0][3]},a_in);





endmodule