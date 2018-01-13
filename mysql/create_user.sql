use BookManagement;
create user 'user'@'localhost' idendified by 'user1234';
create user 'manager'@'localhost' idendified by 'manager1234'
grant select, insert, update on User to 'user'@'localhost';
grant insert on Shortage to 'user'@'localhost';
grant all on Order to 'user'@'localhost';
grant all on OrderBook to 'user'@'localhost';
grant all on * to 'manager'@'localhost';