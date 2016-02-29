module machine_x_state(z, clk, in, reset);
output z;
input clk, in, reset;
reg [3:0] state;
reg [3:0] state_next;

always@(posedge clk or negedge reset)
begin
	if(~reset)
		state <= 4'b0000;
	else
		state <= state_next;
end

always @(state,in)
begin
	case({in, state})
	5'b10000 : state_next <= 4'b0000;
	5'b00000 : state_next <= 4'b0001;
	5'b10001 : state_next <= 4'b0010;
	5'b00001 : state_next <= 4'b0101;
	5'b10010 : state_next <= 4'b0000;
	5'b00010 : state_next <= 4'b0011;
	5'b10011 : state_next <= 4'b0010;
	5'b00011 : state_next <= 4'b0100;	
	5'b10100 : state_next <= 4'b0110;
	5'b00100 : state_next <= 4'b1000;	
	5'b10100 : state_next <= 4'b0110;
	5'b00100 : state_next <= 4'b1000;
	5'b10101 : state_next <= 4'b0110;
	5'b00101 : state_next <= 4'b0101;
	5'b10110 : state_next <= 4'b0000;
	5'b00110 : state_next <= 4'b0111;
	5'b10111 : state_next <= 4'b0010;
	5'b00111 : state_next <= 4'b0100;
	5'b11000 : state_next <= 4'b0110;
	5'b01000 : state_next <= 4'b0101;
	endcase
end

assign z = ~state[3]&state[2]&state[1]&state[0] | state[3]&~state[2]&~state[1]&~state[0];


endmodule 