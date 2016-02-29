module upCountTen(clk, a_reset, enable, count);
input clk, a_reset, enable;
output reg [3:0] count;

always @(posedge clk or posedge a_reset)
begin
	if(a_reset == 1'b1) //if a_reset is high, then reset the state (which is also the output)
		count = 4'b0000; //during verification a '#1' (RHS) was added to all the assignments to remove glitches
	else if(enable)		//as suggested by the TA: Wei when I asked him about the glitches
	begin				// those delay
		if(count == 4'b1010)
			count = 4'b0000; //this is for handling the wraparound from 10 to 0.
		else
			count = count + 1; //else increment
	end
end

endmodule