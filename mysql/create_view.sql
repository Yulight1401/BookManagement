use BookManagement;

create view BookRecord
as
select Book.No, Book.Name, Book.Author1, Book.Author2, Book.Author3, Book.Author4, Book.Press, Book.KeyWords, Book.Price, Book.Quantity, Suppiler.Name
where Book.SuppilerNo = Suppiler.No

create view ShortageRecord
as
select Book.No, Book.Name, Book.Press, Suppiler.Name, Book.Quantity, Shortage.PostTime, Shortage.UserID
where Shortage.BookNo = Book.No and Suppiler.No = Book.SuppilerNo;

create view OrderRecord
as
select Order.No, Book.No, Order.UserID, Book.Name, OrderBook.BookQuantity, Order.PostTime, Order.Status
where OrderBook.OrderNo = Order.No and OrderBook.BookNo = Book.No;

create view SuppilerRecord
as
select Suppiler.Name, Book.Name, SuppilerBook.BookQuantity
where SuppilerBook.SuppilerNo = Suppiler.No and SuppilerBook.BookNo = Book.No;