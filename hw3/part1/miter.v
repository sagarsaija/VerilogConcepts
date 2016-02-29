module miter(correctBit, start, a_reset, s_reset, clk);
output correctBit;
input start;
input a_reset;
input s_reset;
input clk;

wire [3:0] intwire_struct;
wire [3:0] intwire_behav;

wire [6:0] intwire_2_struct;
wire [6:0] intwire_2_behav;
wire [6:0] correctCheck;
upcnt_struct s0(intwire_struct,start, a_reset, s_reset, clk);
upcnt_behav b0(intwire_behav, start, a_reset, s_reset, clk);

bcdto7_struct s1(intwire_2_struct, intwire_struct);
bcdto7_behav b1(intwire_2_behav, intwire_behav);

xor x0(correctCheck[0], intwire_2_struct[0], intwire_2_behav[0]);
xor x1(correctCheck[1], intwire_2_struct[1], intwire_2_behav[1]);
xor x2(correctCheck[2], intwire_2_struct[2], intwire_2_behav[2]);
xor x3(correctCheck[3], intwire_2_struct[3], intwire_2_behav[3]);
xor x4(correctCheck[4], intwire_2_struct[4], intwire_2_behav[4]);
xor x5(correctCheck[5], intwire_2_struct[5], intwire_2_behav[5]);
xor x6(correctCheck[6], intwire_2_struct[6], intwire_2_behav[6]);

or o0(correctBit, correctCheck[0],correctCheck[1],correctCheck[2],correctCheck[3],correctCheck[4],correctCheck[5],correctCheck[6]);





endmodule