use BookManagement;
DELIMITER |
DROP PROCEDURE IF EXISTS book_shortage_check |
CREATE PROCEDURE book_shortage_check()
    BEGIN
    declare BookNo int;
    declare BookQua int;
    declare BookQuaLim int;
    declare done int default 0;
    declare cu cursor for select No from Book;
    declare continue handler for not found set done = 1;
    open cu;
    fetch cu into BookNo;
    while done <> 1 do
    set BookQua = (select BookQuantity from Book where No = BookNo);
    set BookQuaLim = (select LimitBookQuantity from Book where No = BookNo);
    if (BookQua < BookQuaLim) then
    insert into Shortage values (BookNo);
    fetch cu into BookNo;
    end while;
    END |
DELIMITER ;
CREATE EVENT IF NOT EXISTS event_book_shortage_check 
ON SCHEDULE EVERY 1 MINUTE 
ON COMPLETION PRESERVE   
DO CALL book_shortage_check();