module bcdto7_behav(all_out, d_in);
output reg[6:0] all_out;
input [3:0] d_in;

always @(d_in)
begin
	case (d_in)
	0:all_out <= 7'b1000000;
	1:all_out <= 7'b1111001;
	2:all_out <= 7'b0100100;
	3:all_out <= 7'b0110000;
	4:all_out <= 7'b0011001;
	5:all_out <= 7'b0010010;
	6:all_out <= 7'b0000010;
	7:all_out <= 7'b1111000;
	8:all_out <= 7'b0000000;
	9:all_out <= 7'b0010000;
	10:all_out <= 7'b0001000;
	11:all_out <= 7'b0000011;
	12:all_out <= 7'b1000011;
	13:all_out <= 7'b0100001;
	14:all_out <= 7'b0000110;
	15:all_out <= 7'b0001110;
	endcase
end



endmodule