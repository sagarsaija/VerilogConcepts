module sevenSegDispMngr(clk, reset, apple, banana, carrot, date, error, digTwo, digOne, digit1, digit0);
input clk, reset, apple, banana, carrot, date, error;
input [3:0] digTwo, digOne;
output [6:0] digit1, digit0;
reg [2:0] state;
reg [3:0] d1in, d0in;
bcdto7 b0(digit1, d1in);
bcdto7 b1(digit0, d0in);


always @(posedge clk)
begin
	if(reset)
	begin
		d1in = digTwo;
		d0in = digOne;
		state = 3'b000;
	end
	else
	begin
		if(state == 0)
			case({apple, banana, carrot, date, error})
			5'b10000 :{d1in,d0in,state} = {4'ha,4'ha, 3'd5};
			5'b01000 :{d1in,d0in,state} = {4'hb,4'hb, 3'd5};
			5'b00100 :{d1in,d0in,state} = {4'hc,4'hc, 3'd5};
			5'b00010 :{d1in,d0in,state} = {4'hd,4'hd, 3'd5};
			5'b00001 :{d1in,d0in,state} = {4'he,4'he, 3'd5};
			default : {d1in, d0in, state} = {digTwo, digOne, 3'd0};
			endcase
		else
			state = state - 1;
	end
end

endmodule