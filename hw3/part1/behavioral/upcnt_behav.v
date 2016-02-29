module upcnt_behav(count, start, a_reset, s_reset, clk);
output reg [3:0] count;
input start;
input a_reset;
input s_reset;
input clk;

always@(posedge clk or negedge a_reset)
begin
	if(~a_reset || ~s_reset)
		count = 4'b0000;
	else
		if(start)
			count = count + 1;
end




endmodule