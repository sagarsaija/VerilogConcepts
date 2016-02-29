module purchaseMngr(clk, buy, product, digOne, digTwo, apple, banana, carrot, date, error);
input clk, buy;
input [1:0] product;
input [3:0] digOne, digTwo;
output reg apple, banana, carrot, date, error;
reg [7:0] credit;
reg [7:0] cost;

always @(posedge clk)
begin
	credit = 10* digOne + digTwo;
	case(product)
	2'b00: cost = 75;
	2'b01: cost = 20;
	2'b10: cost = 30;
	2'b11: cost = 40;
	endcase
	if(buy)
	begin
		if(cost > credit)
			{apple, banana, carrot, date, error} = 5'b00001;
		else
			begin
			case(product)
			2'b00: {apple, banana, carrot, date, error} = 5'b10000;
			2'b01: {apple, banana, carrot, date, error} = 5'b01000;
			2'b10: {apple, banana, carrot, date, error} = 5'b00100;
			2'b11: {apple, banana, carrot, date, error} = 5'b00010;
			endcase
			end
	end
	else
		{apple, banana, carrot, date, error} = 5'b00000;
end

endmodule