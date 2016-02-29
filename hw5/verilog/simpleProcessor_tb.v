module simpleProcessor_tb;
reg clk, clock, x, rs, data_in;
wire reset, shift, update, run, data_out;
wire [4:0] z;

fsm uut1(clock, x, rs, reset, shift, update, run);
control_unit uut2(clk, data_in, reset, run, shift, update, data_out, z);

initial 
begin
	x = 0;
	rs = 1;
	@(posedge clk);
	rs = 0;
	@(posedge clk);
	x = 1;
  //at shift
  fillShift(8'b00001000); //init mem0
  execute();
  fillShift(8'b00010100); //init mem1
  execute();
  fillShift(8'b00100011); //init mem2
  execute();
  fillShift(8'b00110001); //init mem3
  execute();
  fillShift(8'b01000001); //mem0 + mem1
  execute();
  fillShift(8'b01100001); //mem1 - mem0
  execute();
  fillShift(8'b10001110); //mem2 & mem3
  execute();
  fillShift(8'b10101110); //mem2 | mem3
  execute();
  fillShift(8'b11111110); //test the buffer opcode
  execute();
end

initial //two clocks one offset by one nanosecond such that race conditions are avoided 
begin
clk = 0;
#1;
forever
  #50 clk = ~clk;
end

initial 
begin
clock = 0;
forever
  #50 clock = ~clock; 
end

task execute; // Updates the FSM and then run
begin
  x = 0;
  @(posedge clk);
  @(posedge clk);
  x = 1;
end
endtask

task fillShift; //task written to abstract-out the filling of the shift registers 
input [7:0] val;
begin
  data_in = val[0];
  @(posedge clk);
  data_in = val[1];
  @(posedge clk);
  data_in = val[2];
  @(posedge clk);
  data_in = val[3];
  @(posedge clk);
  data_in = val[4];
  @(posedge clk);
  data_in = val[5];
  @(posedge clk);
  data_in = val[6];
  @(posedge clk);
  data_in = val[7];
  @(posedge clk);
end
endtask


endmodule