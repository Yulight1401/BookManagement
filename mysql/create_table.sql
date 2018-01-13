create database BookManagement default character set utf8 collate utf8_general_ci;
use BookManagement;
create table Book (
    No int not null auto_increment unique,
    Name char (32) not null,
    Author1 char (32) not null,
    Author2 char (32) ,
    Author3 char (32) ,
    Author4 char (32) ,
    Press char (32) not null,
    KeyWords char (64),
    Price float (10, 2) not null,
    Quantity int default 0,
    LimitQuantity int default 0,
    SuppilerNo int not null,
    primary key (No),
    foreign key (SuppilerNo) references Suppiler(No) on delete set null on update cascade
) engine = innodb default charset = utf8 auto_increment = 1;

create table BookChild (
    FatherNo int not null,
    ChildNo int not null,
    ChildOrder int not null,
    primary key(FatherNo, ChildNo),
    foreign key (FatherNo) references Book(No) on delete cascade on update cascade,
    foreign key (ChildNo) references Book(No) on delete cascade on update cascade
) engine = innodb default charset = utf8;

create table Shortage (
    BookNo int not null unique,
    PostTime timestamp not null default CURRENT_TIMESTAMP,
    UserID int default null,
    primary key (BookNo),
    foreign key (BookNo) references Book(No) on delete cascade on update cascade,
    foreign key (UserID) references User(ID) on delete set null on update cascade
) engine = innodb default charset = utf8;

create table User (
    ID int not null auto_increment unique,
    Name char (32) not null unique,
    Email char (32) not null,
    Password char (32) not null,
    Address char (32),
    Money float (12, 2) default 0,
    CreaditLevel int default 1,
    OverDraft int default 0,
    primary key (ID)
) engine = innodb default charset = utf8 auto_increment = 1;

create table Order(
    No int not null auto_increment unique,
    PostTime timestamp not null default CURRENT_TIMESTAMP,
    Status enum('未支付', '待发货', '运输中', '已完成') default '未支付',
    TotalPrice float(20, 2) not null default 0,
    TotalPriceOff float(20, 2) int not null default 0,
    PostAddress char (64) not null,
    PostStatus char (250),
    UserID int not null,
    primary key (No),
    foreign key (UserID) references User(ID) on update cascade
) engine = innodb default charset = utf8 auto_increment = 1;

create table OrderBook(
    OrderNo int not null,
    BookNo int not null,
    UserID int not null,
    BookQuantity int not null default 1,
    primary key (OrderNo, BookNo, UserID),
    foreign key (UserID) references User(ID) on update cascade,
    foreign key (OrderNo) references Order(No) on delete cascade,
    foreign key (BookNo) references Book(No) on update cascade
) engine = innodb default charset = utf8;

create table Suppiler(
    No int not null auto_increment unique,
    Name char (32) not null unique,
    primary key (No)
) engine = innodb default charset = utf8 auto_increment = 1;

create table SuppilerBook(
    SuppilerNo int not null,
    BookNo int not null,
    BookQuantity int not null default 0,
    primary key (Sno, BookNo),
    foreign key SupplierNo references Suppiler(No) on delete cascade,
    foreign key BookNo references Book(No) on delete cascade
) engine = innodb default charset = utf8;