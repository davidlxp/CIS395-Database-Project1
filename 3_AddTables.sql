use hoteldb;

CREATE TABLE hotel
( hotelNo int not null auto_increment primary key
, name    varchar(40)
, address varchar(40)
, city    varchar(200)
, state   varchar(200)
, country varchar(200)
, zipcode varchar(20)
);

CREATE TABLE room
( roomId int not null auto_increment primary key
, roomNo  int
, hotelNo int
, type    varchar(20)
, price   dec(9,2)
, foreign key (hotelNo) References hotel(hotelNo)
);

CREATE TABLE guest
( guestNo int not null auto_increment primary key
, name    varchar(40)
, address varchar(40)
, city	  varchar(200)
, state   varchar(200)
, country varchar(200)
, zipcode varchar(20)
);

CREATE TABLE booking
( bookingNo int not null auto_increment primary key
, hotelNo int
, guestNo int
, dateFrom date NOT NULL
, dateTo   date
, roomNo int
, timestamp_updated timestamp not null default current_timestamp
, foreign key (hotelNo) REFERENCES hotel(hotelNo)
, foreign key (guestNo) REFERENCES guest(guestNo)
);