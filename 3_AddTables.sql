use hoteldb;

CREATE TABLE hotel
( hotelNo numeric primary key
, name    varchar(40)
, address varchar(40)
, city    varchar(200)
);

CREATE TABLE room
( roomNo  numeric Primary Key
, hotelNo numeric References HOTEL
, type    varchar(20)
, price   dec(9,2)
);

CREATE TABLE guest
( guestNo numeric primary key
, name    varchar(40)
, address varchar(40)
);

CREATE TABLE booking
( hotelNo numeric REFERENCES Hotel
, guestNo numeric REFERENCES Guest
, dateFrom date NOT NULL
, dateTo   date
, roomNo  numeric REFERENCES ROOM
);