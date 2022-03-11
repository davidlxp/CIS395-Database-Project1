use hoteldb;

-- Change unique key for booking table --
alter table booking
add UNIQUE index IDX_BK2(hotelNo, roomNo, guestNo, dateFrom, dateTo);

-- Change unique key for guest table --
alter table guest
add UNIQUE index IDX_GUEST(name, address, city, stateCd, countryCd, zipCd);

-- Change unique key for hotel table --
alter table hotel
add UNIQUE index IDX_HOTEL(name, address, city, stateCd, countryCd, zipCd);

-- Change unique key for room table --
alter table room
add UNIQUE index IDX_ROOM(roomNo, hotelNo)
