module miter(clk, a_reset, enable, correctness);
output correctness;
input clk;
input a_reset;
input enable;
wire [3:0] count1;
wire [3:0] count2;
wire [3:0] correctBit;

upCountTen s0(clk, a_reset, enable, count1);
upCountTenSynth b0(clk, a_reset, enable, count2);

xor x0(correctBit[0], count1[0], count2[0]); //xor all the outputs together to make sure that they are the same
xor x1(correctBit[1], count1[1], count2[1]);
xor x2(correctBit[2], count1[2], count2[2]);
xor x3(correctBit[3], count1[3], count2[3]);

or o0(correctness,correctBit[0],correctBit[1],correctBit[2],correctBit[3]); //if all the outputs are the same all the xor-gates will be 0 and therefore the output of the miter is 0.


endmodule