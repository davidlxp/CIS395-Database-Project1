use hoteldb;

-- Adding a column named "city" to the guest table --
ALTER TABLE guest
ADD COLUMN city varchar(200);

-- Copy info from "address" column to "city" column --
UPDATE guest set city = address where guestNo < 100;

-- Insert real address into "address" column --
update guest set address = '1 Main St' where guestNo = 1;
update guest set address = '199 Chambers St' where guestNo = 2;   
update guest set address = '27 Charles St' where guestNo = 3;
update guest set address = '10 Burlington St' where guestNo = 4;
update guest set address = '350 W 18th St Apt 3C' where guestNo = 5;   
update guest set address = '203 E 20th St Apt 1A' where guestNo = 6;
update guest set address = '20302 Trafalgar Sq' where guestNo = 7;
update guest set address = '20-33 E 5th St' where guestNo = 8;
update guest set address = '53 E 9th St Apt 22' where guestNo = 9;
update guest set address = '20332 Doheney Drive' where guestNo = 10;
update guest set address = '2010 Abbey Rd Apt 4' where guestNo = 11;   
update guest set address = '2000 Rodeo Drive' where guestNo = 12;
update guest set address = '300 Hollywood Drive' where guestNo = 13;
update guest set address = '3 Circle Drive' where guestNo = 14;   
update guest set address = '2900 River Drive' where guestNo = 15;       
update guest set address = '2304 Riverside Drive' where guestNo = 16;       

