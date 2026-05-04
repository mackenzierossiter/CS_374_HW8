-- HW 8 query2 - Kenzie

-- all delete queries are used so I can run this file multiple times without errors

-- Please run the newData-Kenzie-Query2.sql file for data needed
-- to run this query

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
			AND reservations_rooms.room_number IS NULL;


-- Create Mrs. Smith's reservation
DELETE from reservations_rooms
WHERE reservation_id = 85930 AND room_number = 491;

INSERT INTO reservations_rooms(reservation_id, hotel_id, room_number)
VALUES (85930, 89604, 491);

-- Create Mrs. Smith's stay
DELETE FROM stays
WHERE id = 28424;

INSERT INTO stays(id, guest_pid, hotel_id, room_number, occupant_pid, from_date, to_date)
VALUES(28424, 23450, 89604, 491, 65372, '04-21-2026', '04-25-2026');


