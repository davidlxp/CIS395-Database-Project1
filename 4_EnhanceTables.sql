use hoteldb;

-- Enhancing the Tables --

alter table hotel										-- updating the hotel table 
modify column hotelNo int auto_increment,				-- alter hotelNo and make it to be auto generated 
add column stateCd char(2),								-- add column to record state code
add column countryCd varchar(20),						-- add column to record country code
add column zipCd varchar(20);							-- add column to record zipcode

alter table room										-- updating the room table
add column roomId int auto_increment,					-- add auto unique ID for room table
drop primary key,										-- drop the old primary key
add primary key (roomId);								-- set a new primary key

alter table guest
modify column guestNo int auto_increment,
add column city varchar(200),
add column stateCd char(2),
add column countryCd varchar(20),	
add column zipCd varchar(20);	

alter table booking
add column bookingId int auto_increment,
add primary key (bookingId),
add timestamp_updated timestamp not null default current_timestamp;








