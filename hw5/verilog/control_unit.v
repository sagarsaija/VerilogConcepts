module control_unit (clk, data_in, reset, run, shift, update, data_out, z);
parameter INITLZ_MEM = 2'b00; //the defines did not work in modelsim so I used constant parameters instead
parameter ARITH = 2'b01;
parameter LOGIC = 2'b10;
parameter BUFFER = 2'b11;

input clk, data_in;
input reset, run, shift, update; 
output reg data_out; 
output reg[4:0] z;
reg [3:0] mem [3:0];
reg [7:0] shift_reg, shadow_reg;
reg [1:0] address, addressA, addressB;
  
always @(posedge clk)
begin
	if(reset == 1'b1)
	begin
		{mem[0],mem[1], mem[2],mem[3]
		
		,shift_reg,shadow_reg,address,addressA,addressB, data_out} = 39'd0; //Quick one-line way to initialize many variables
	  z = 5'bxxxxx; //In section Amirali told us that when the output is not set by a previous run, it should output dontcares or high impedance
	end
	
	if(shift == 1'b1)
	begin
		data_out = shift_reg[0]; //Data Out
		shift_reg = shift_reg >> 1; //shift by one
		shift_reg[7] = data_in; //Move the new data in
	end
	
	if(update == 1'b1)
		shadow_reg = shift_reg;
		
	if(run == 1'b1) //if run is high
	begin
		if(shadow_reg[7:6] == INITLZ_MEM)
		begin
			address = shadow_reg[5:4];
			mem[address] = shadow_reg[3:0];
			z = 5'bxxxxx; //Amirali told us to set this to the output when run is high and the opcode is the INITLZ_MEM
		end
		
		if(shadow_reg[7:6] == ARITH)
		begin
			{addressA, addressB} = {shadow_reg[1:0],shadow_reg[3:2]};
			if(shadow_reg[5] == 1'b1)
				z = mem[addressA] - mem[addressB]; // Subtraction A -b
			else
				z = mem[addressA] + mem[addressB]; // adition
		end
		
		if(shadow_reg[7:6] == LOGIC)
		begin
			{addressA, addressB} = {shadow_reg[1:0],shadow_reg[3:2]};
			if(shadow_reg[5] == 1'b1)
				z = {1'b0,mem[addressA] | mem[addressB]}; // bitwise or - implementation specific detail, since a bitwise or/and return the size of the operands and 
			else										// the operands are of size x, then the output will be of size x, but this is a 5-bit output the first bit will be 0
				z = {1'b0,mem[addressA] & mem[addressB]};
		end
	 
		if(shadow_reg[7:6] == BUFFER)
			z = shadow_reg[4:0];
	end
end


endmodule