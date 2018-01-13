use BookManagement;
create trigger update_price before insert on OrderBook for each row
begin
declare price int;
declare off float;
declare creaditLevel int;
set price = (select Price from Book where No = new.OrderNo);
set creaditLevel = (select CreaditLevel from User where ID = new.UserID);
if (creaditLevel = 1) then
set off = 0.1;
elseif (creaditLevel = 2 or creaditLevel = 3) then
set off = 0.15;
elseif (creaditLevel = 4) then
set off = 0.2;
elseif (creaditLevel = 5) then
set off = 0.25;
update Order set TotalPrice = TotalPrice + price where new.No = Order.No;
update Order set TotalPriceOff = TotalPrice * off where new.No = Order.No;
end;
