
`timescale 1ns/1ns

module dec_enc_tb;

wire[2:0] val_out;
reg [2:0] val;
integer i;
wire[7:0] data_out;

three_eight_dec a1(data_out, val);
eight_three_enc a2(val_out, data_out);

initial 
  i = 0;

always
begin
  #5 
  i = i + 1;
  val = i;
end

endmodule
