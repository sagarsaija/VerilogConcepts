module upCountTen_tb;
wire [3:0] count;
reg start;
reg a_reset;
reg clk;

upCountTen uut(clk, a_reset, start, count);
initial
begin
	clk =0;
	start = 0;
	a_reset = 1;// first reset the state
	#25;
	a_reset = 0; //turn off the a_reset before posedge, to make sure its asynchronous
	#100
	start = 1; //start counting, test enabling
	#200
	start = 0; //stop counting, testing disabling
	#150
	start = 1;
	#200
	start = 0;
	#125
	start = 1;
	#406; //by this time the FSM has tested the functionality of reset, the increment, the enable and the wraparound

end
always
	#50 clk = ~clk;
	
endmodule