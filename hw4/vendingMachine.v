module vendingMachine(clock, reset, serialIn, buy, product, digit1, digit0);
input clock, reset, serialIn, buy;
input [1:0] product;
output [6:0] digit1, digit0;


wire penny, nickel, dime, quarter;
wire apple, banana, carrot, date, error;
wire [3:0] digOne, digTwo;
coinSensor c0(clock, reset, serialIn, penny, nickel, dime, quarter);
piggyBank p0(clock, reset, penny, nickel, dime, quarter, apple, banana, carrot, date, digOne, digTwo);
purchaseMngr p1(clock, buy, product, digOne, digTwo, apple, banana, carrot, date, error);
sevenSegDispMngr p2(clock, reset, apple, banana, carrot, date, error, digTwo, digOne, digit1, digit0);


endmodule