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

INSERT INTO reservations(id, room_type_name, start_date, end_date)
VALUES (85930, 'Double', '04-21-2026', '04-25-2026');

-- filling the room_type table
delete from room_type
WHERE room_type.id = 85204;

INSERT INTO room_type(id, capacity, name, size)
VALUES (85204, 2, 'Double', 2);

-- filling in room_type_has_reservation to connect room_type to res
DELETE from room_type_has_reservations
WHERE room_type_tid = 85204 AND reservations_idreservations = 85930;

INSERT INTO room_type_has_reservations(room_type_tid, room_type_name, reservations_idreservations)
VALUES(85204, 'Double', 85930);


-- start here
-- Create empty Double rooms

-- empty Double Room 1
delete from room_type
WHERE room_type.id = 85204;

INSERT INTO room_type(id, capacity, name, size)
VALUES (85204, 2, 'Double', 2);

-- empty Double Room 2
delete from room_type
WHERE room_type.id = 57930;

INSERT INTO room_type(id, capacity, name, size)
VALUES (57930, 2, 'Double', 2);


-- create empty rooms
delete from rooms 
where rooms.room_number = 491;

INSERT INTO rooms(room_number, hotel_id, room_type_id, floor)
VALUES(491, 89604, 85204, 4);

delete from rooms 
where rooms.room_number = 103;

INSERT INTO rooms(room_number, hotel_id, room_type_id, floor)
VALUES(103, 89604, 57930, 1);



-- Create a filled double room
-- filled room type
delete from room_type
WHERE room_type.id = 48024;

INSERT INTO room_type(id, capacity, name, size)
VALUES (48024, 2, 'Double', 2);

-- filled room
delete from rooms 
where rooms.room_number = 284;

INSERT INTO rooms(room_number, hotel_id, room_type_id, floor)
VALUES(284, 89604, 48024, 2);

-- filled reservation_rooms
delete from reservations_rooms
where reservation_id = 42940;

INSERT into reservations_rooms(reservation_id, hotel_id, room_number)
VALUES(42940, 89604, 284);


-- The select query should list all the room numbers of double rooms that are 
-- currently unoccupied. The insert quer(ies) should assign the room, 
-- assuming Mrs. Smith is the guest who made the reservation, and Mr. Smith 
-- an occupant who was not previously in the database.


SELECT rooms.room_number, room_type.name
FROM room_type
JOIN rooms on room_type.id = rooms.room_type_id
LEFT JOIN reservations_rooms ON rooms.hotel_id = reservations_rooms.hotel_id
		AND rooms.room_number = reservations_rooms.room_number
		WHERE room_type.name = 'Double' 
			AND reservations_rooms.hotel_id IS NULL 
			AND reservations_rooms.room_number IS NULL



				









-- -- fill in the reservations_rooms table
-- delete from reservations_rooms
-- where reservation_id = 85930;

-- INSERT into reservations_rooms(reservation_id, hotel_id, room_number)
-- VALUES(85930, 89604, 438);


-- -- fill the stays table
-- delete from stays 
-- where id = 749584;

-- INSERT into stays(id, guest_pid, hotel_id, room_number, occupant_pid, from_date, to_date)
-- VALUES(749584, 23450, 89604, 438, 65372, '04-21-2026', '04-25-2026');

