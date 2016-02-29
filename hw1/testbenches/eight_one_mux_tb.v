`timescale 1ns/1ns

module eight_one_mux_tb;
wire mux_out;
reg [7:0] mux_data_in;
reg [2:0] mux_sel;
integer i;
eight_one_mux uut(mux_out, mux_data_in, mux_sel);
initial 
  i = 0;

always
begin
  #5 
  i = i + 1;
  {mux_data_in , mux_sel} = i;
end

endmodule