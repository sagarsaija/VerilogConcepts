module coinSensor(clk, reset, serialIn, penny, nickel, dime, quarter);
input clk, reset, serialIn;
output reg penny, nickel, dime, quarter;
reg [4:0] shift;
 
always @(posedge clk)
begin
	if(reset)
		shift = 5'b11111;
	else
		shift = shift << 1;
		shift[0] = serialIn;
end

always @(posedge clk)
	casex(shift)
	5'bx0010 :{penny, nickel, dime, quarter, shift} = 9'b100011111; 
	5'b01000 :{penny, nickel, dime, quarter, shift} = 9'b010011111;
	5'b01110 :{penny, nickel, dime, quarter, shift} = 9'b001011111;
	5'b01010: {penny, nickel, dime, quarter, shift} = 9'b000111111;
	default: {penny, nickel, dime, quarter} = 4'b0000;
	endcase


endmodule