module piggyBank(clk, reset, penny, nickel, dime, quarter, apple, banana, carrot, date, digOne, digTwo);
input clk, reset, penny, nickel, dime, quarter, apple, banana, carrot, date;
output reg [3:0] digOne, digTwo;

reg [3:0] sumValTwo;
reg [3:0] sumValOne;
reg [3:0] buyValTwo;
reg [3:0] buyValOne;
reg [3:0] carryNum;
reg [3:0] negCarryNum;
always @(posedge clk)
begin
	if(reset)
		{digOne,digTwo} = {4'b0000,4'b0000};
	else
	begin
		carryNum = 0;
		negCarryNum = 0;
		case({penny, nickel, dime, quarter})
		4'b1000 : {sumValTwo, sumValOne} = {4'd0,4'd1};
		4'b0100 : {sumValTwo, sumValOne} = {4'd0,4'd5};
		4'b0010 : {sumValTwo, sumValOne} = {4'd1,4'd0};
		4'b0001 : {sumValTwo, sumValOne} = {4'd2,4'd5};
		default : {sumValTwo, sumValOne} = {4'd0,4'd0};
		endcase
		case({apple, banana, carrot, date})
		4'b1000 : {buyValTwo, buyValOne} = {4'd7,4'd5};
		4'b0100 : {buyValTwo, buyValOne} = {4'd2,4'd0};
		4'b0010 : {buyValTwo, buyValOne} = {4'd3,4'd0};
		4'b0001 : {buyValTwo, buyValOne} = {4'd4,4'd0};
		default : {buyValTwo, buyValOne} = {4'd0,4'd0};
		endcase
		if(sumValOne != 0 | sumValTwo != 0)
		begin
			if(digOne + sumValOne > 9)
			begin
				carryNum = carryNum + 1;
				digOne = digOne + sumValOne - 10;
			end
			else
				digOne = sumValOne + digOne;
			if(digTwo + sumValTwo + carryNum > 9)
				{digTwo, digOne} = {4'd9,4'd9};
			else
				digTwo = digTwo + sumValTwo + carryNum;	
		end
		negCarryNum = 0;
		if(buyValTwo != 0 | buyValOne != 0)
		begin
			if(digOne < buyValOne)
			begin
				digOne = 10 - (buyValOne- digOne);
				negCarryNum = negCarryNum + 1;
			end
			else
				digOne = digOne - buyValOne;
			if(digTwo < buyValTwo + negCarryNum)
				{digTwo, digOne} = {4'd0,4'd0};
			else
				digTwo = digTwo - buyValTwo - negCarryNum;
		end
	end
end

endmodule