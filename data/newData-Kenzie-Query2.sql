-- HW 8 query2 - Kenzie

-- all delete queries are used so I can run this file multiple times without errors

-- adding a guest named Mrs. Smith
delete from guest 
WHERE guest.pid = 23450;

INSERT INTO guest(pid, name, id_number, id_type, address, mobile_phone, home_phone)
VALUES (23450, 'Mrs. Smith', 45678, 'liscense', '7 Sweet Lane HBurg, VA', '3479473284', '589095483');


-- adding an occupant named Mr. Smith
delete from occupant
WHERE occupant.pid = 65372;

INSERT INTO occupant(pid, name, is_adult)
VALUES (65372, 'Mr. Smith', TRUE);


-- Add in a hotel named 'Hotel B'
delete from hotel
WHERE hotel.id = 89604;

INSERT INTO hotel(id, name, address)
VALUES (89604, 'Hotel B', '84 Fun Rd Miami, Fl');




-- Have Mrs. Smith make the reservation
delete from makes
WHERE guest_pid = 23450;

INSERT INTO makes(guest_pid, reservation_id)
VALUES(23450, 85930);

-- create Mr. and Mrs. Smith's reservation
delete from reservations
where reservations.id = 85930;

INSERT INTO reservations(id, start_date, end_date)
VALUES (85930, '04-21-2026', '04-25-2026');

-- filling the room_type table
delete from room_type
WHERE room_type.id = 85204;

INSERT INTO room_type(id, capacity, name, size)
VALUES (85204, 2, 'Double', 2);

-- filling in room_type_has_reservation to connect room_type to res

-- below I do using INSERT


-- create the room they are staying in
delete from rooms 
where rooms.room_number = 438;

INSERT INTO rooms(room_number, hotel_id, room_type_id, floor)
VALUES(438, 89604, 85204, 4);

-- fill in the reservations_rooms table
delete from reservations_rooms
where reservation_id = 85930;

INSERT into reservations_rooms(reservation_id, hotel_id, room_number)
VALUES(85930, 89604, 438);


-- fill the stays table
delete from stays 
where id = 749584;

INSERT into stays(id, guest_pid, hotel_id, room_number, occupant_pid, from_date, to_date)
VALUES(749584, 23450, 89604, 438, 65372, '04-21-2026', '04-25-2026');


SELECT * from stays