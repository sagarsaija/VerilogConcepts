module fsm (clk, x, rs, reset, shift, update, run);
parameter RS = 4'b0001; // Reset state
parameter RI = 4'b0010; // Run/Idle state
parameter SH = 4'b0100; // Shift state
parameter UP = 4'b1000; // Update state
input clk;
input x;
input rs;
output reset, shift, update, run;
reg [3:0] state;

always @(posedge clk)
begin
	casex({rs,x,state}) //custom bus selector using dont cares
	6'b1xxxxx: state = RS; //for handling the resets
	6'b010001: state = RS; //transitions from the state diagram
	6'b000001: state = RI;
	6'b010010: state = SH;
	6'b000010: state = RI;
	6'b010100: state = SH;
	6'b000100: state = UP;
	6'b011000: state = RS;
	6'b001000: state = RI;
	default: state = RS;
	endcase
end

assign reset = state[0]; //assigning outputs
assign run = state[1];
assign shift = state[2];
assign update = state[3];



endmodule