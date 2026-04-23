-- Hotel data (Sarah)
INSERT INTO hotel (id, name, address)
VALUES
	(1, 'Hotel Panda', '123 Lazy Bum Ln'),
	(2, 'Hotel Manatee', '456 Barbara Ave'),
	(3, 'Hotel Hippo', '789 Moo Deng St'),
	(4, 'Hotel Platypus', '1011 Danville Ave'),
	(5, 'Hotel Axolotl', '1213 Cool Name Ln');

INSERT INTO season (id, hotel_id, name, start_date, end_date)
VALUES
	(1, 1, 'Winter', '2026-10-15', '2027-3-15'),
	(2, 1, 'Summer', '2026-4-10', '2026-9-10'),
	(3, 2, 'Winter', '2026-10-15', '2027-3-15'),
	(4, 2, 'Summer', '2026-4-10', '2026-9-10'),
	(5, 3, 'Winter', '2026-10-15', '2027-3-15'),
	(6, 3, 'Summer', '2026-4-10', '2026-9-10'),
	(7, 4, 'Winter', '2026-10-15', '2027-3-15'),
	(8, 4, 'Summer', '2026-4-10', '2026-9-10'),
	(9, 5, 'Winter', '2026-10-15', '2027-3-15'),
	(10, 5, 'Summer', '2026-4-10', '2026-9-10');

INSERT INTO discount (id, discount_category, discount_amount)
VALUES
	(1, 'SILVER', 10.00),
	(2, 'GOLD', 20.00);

INSERT INTO room_type (id, capacity, size)
VALUES
	(1, 2, 300),
	(2, 4, 500);

INSERT INTO rooms (room_number, hotel_id, room_type_id, floor)
VALUES
	(101, 1, 1, 1), (102, 1, 1, 1), (103, 1, 1, 1),
	(201, 1, 2, 2), (202, 1, 2, 2), (203, 1, 2, 2),

	(101, 2, 1, 1), (102, 2, 1, 1), (103, 2, 1, 1),
	(201, 2, 2, 2), (202, 2, 2, 2), (203, 2, 2, 2),

	(101, 3, 1, 1), (102, 3, 1, 1), (103, 3, 1, 1),
	(201, 3, 2, 2), (202, 3, 2, 2), (203, 3, 2, 2),

	(101, 4, 1, 1), (102, 4, 1, 1), (103, 4, 1, 1),
	(201, 4, 2, 2), (202, 4, 2, 2), (203, 4, 2, 2),

	(101, 5, 1, 1), (102, 5, 1, 1), (103, 5, 1, 1),
	(201, 5, 2, 2), (202, 5, 2, 2), (203, 5, 2, 2);

INSERT INTO has_rate (season_id, room_type_id, day_of_week, price)
VALUES
	(1, 1, 'Mon', 80), (1, 1, 'Tue', 80), (1, 1, 'Wed', 90), (1, 1, 'Thu', 90), (1, 1, 'Fri', 100), (1, 1, 'Sat', 120), (1, 1, 'Sun', 95),
	(1, 2, 'Mon', 150), (1, 2, 'Tue', 150), (1, 2, 'Wed', 160), (1, 2, 'Thu', 160), (1, 2, 'Fri', 180), (1, 2, 'Sat', 200), (1, 2, 'Sun', 170),

	(2, 1, 'Mon', 100), (2, 1, 'Tue', 100), (2, 1, 'Wed', 110), (2, 1, 'Thu', 110), (2, 1, 'Fri', 130), (2, 1, 'Sat', 150), (2, 1, 'Sun', 120),
	(2, 2, 'Mon', 180), (2, 2, 'Tue', 180), (2, 2, 'Wed', 190), (2, 2, 'Thu', 190), (2, 2, 'Fri', 220), (2, 2, 'Sat', 250), (2, 2, 'Sun', 200);

-- Guest data (Kenzie)
-- delete bill so below runs
delete from bill
	where bill.id = 89079
	OR bill.id = 67854
	OR bill.id = 35532;

-- delete makes so below runs
delete from makes
	where makes.guest_pid = 11111
	OR makes.guest_pid = 12121
	OR makes.guest_pid = 23421
	OR makes.guest_pid = 23452
	OR makes.guest_pid = 56743;

-- delete guest so below runs
delete from guest
	where guest.pid = 11111
		OR guest.pid = 12121
		OR guest.pid = 23421
		OR guest.pid = 23452
		OR guest.pid = 56743;

-- delete reservations so below runs
delete from reservations
	where reservations.id = 12433
	OR reservations.id = 35542
	OR reservations.id = 34245
	OR reservations.id = 23445
	OR reservations.id = 23432
	OR reservations.id = 23556;

-- my 5 guests and their reservations

-- This guest has two reservations
insert into guest(pid, name, id_number, id_type, address, mobile_phone, home_phone)
VALUES (11111, 'Kenzie Rossiter', 123123, 'passport', '1 Happy Lane, Harrisonburg, VA', '521-431-4532', '842-422-4532');

insert into reservations(id, start_date, end_date)
VALUES (12433, '01-01-2026', '01-04-2026');
insert into reservations(id, start_date, end_date)
VALUES (35542, '01-01-2026', '01-04-2026');

-- match these reservations with the guest
insert into makes(guest_pid, reservation_id)
VALUES(11111, 12433);
insert into makes(guest_pid, reservation_id)
VALUES(11111, 35542);

-- guest 2
insert into guest(pid, name, id_number, id_type, address, mobile_phone, home_phone)
VALUES (12121, 'Shane Rossiter', 253472, 'license', '3 Hype Lane, Pembroke, MA', '574-383-3582', '587-385-38562');

-- their reservation
insert into reservations(id, start_date, end_date)
VALUES (34245, '02-23-2026', '02-28-2026');

-- match this reservation with the guest
insert into makes(guest_pid, reservation_id)
VALUES(12121, 34245);

-- guests who have completed their stay in the past

-- guest 3
insert into guest(pid, name, id_number, id_type, address, mobile_phone, home_phone)
VALUES (23421, 'Paige Rossiter', 35624, 'passport', '4 Sorority Row, Commack, NY', '463-385-7532', '457-357-3875');

-- their reservation
insert into reservations(id, start_date, end_date)
VALUES (23445, '04-13-2001', '05-1-2001');

-- match this reservation with the guest
insert into makes(guest_pid, reservation_id)
VALUES(23421, 23445);

-- their bill
insert into bill(id, total_price, reservation_id, guest_pid)
VALUES(89079, 1000, 23445, 23421);

-- guest 4
insert into guest(pid, name, id_number, id_type, address, mobile_phone, home_phone)
VALUES (23452, 'Joanne Rossiter', 34223, 'license', '3 Doti Ct, Elwood, NY', '453-487-4852', '124-358-9450');

-- their reservation
insert into reservations(id, start_date, end_date)
VALUES (23432, '06-10-2001', '06-15-2001');

-- match this reservation with the guest
insert into makes(guest_pid, reservation_id)
VALUES(23452, 23432);

-- their bill
insert into bill(id, total_price, reservation_id, guest_pid)
VALUES(67854, 2000, 23432, 23452);

-- guest 5
insert into guest(pid, name, id_number, id_type, address, mobile_phone, home_phone)
VALUES (56743, 'Dan Rossiter', 23415, 'license', '5 Cameo Rd, Commack, NY', '453-875-2134', '845-587-1930');

-- their reservation
insert into reservations(id, start_date, end_date)
VALUES (23556, '07-10-2001', '07-15-2001');

-- match this reservation with the guest
insert into makes(guest_pid, reservation_id)
VALUES(56743, 23556);

-- their bill
insert into bill(id, total_price, reservation_id, guest_pid)
VALUES(35532, 5439, 23556, 56743);

-- Guest data (Faz)

DELETE FROM room_service
WHERE charge_to_id IN (5001, 5002);

DELETE FROM charge_to
WHERE bill_id IN (11001, 11002, 11003);

DELETE FROM bill
WHERE id IN (11001, 11002, 11003);

DELETE FROM stays
WHERE guest_pid IN (77001, 77002, 77003, 77004, 77005);

DELETE FROM reservations_rooms
WHERE reservation_id IN (88001, 88002, 88003, 88004, 88005, 88006);

DELETE FROM makes
WHERE guest_pid IN (77001, 77002, 77003, 77004, 77005);

DELETE FROM reservations
WHERE id IN (88001, 88002, 88003, 88004, 88005, 88006);

DELETE FROM guest
WHERE pid IN (77001, 77002, 77003, 77004, 77005);

--
-- Guest 1: Marcus Webb
-- 2 reservations: summer and winter
-- summer res uses 2 rooms of same type at Hotel Panda
--

INSERT INTO guest(pid, name, id_number, id_type, address, mobile_phone, home_phone)
VALUES (77001, 'Marcus Webb', 445521, 'passport', '312 Elmwood Ave, Chicago, IL', '312-554-7734', '312-554-7700');

INSERT INTO reservations(id, start_date, end_date)
VALUES (88001, '2026-07-15', '2026-07-17');

INSERT INTO reservations(id, start_date, end_date)
VALUES (88002, '2026-11-01', '2026-11-04');

INSERT INTO makes(guest_pid, reservation_id)
VALUES (77001, 88001);

INSERT INTO makes(guest_pid, reservation_id)
VALUES (77001, 88002);

INSERT INTO reservations_rooms(reservation_id, hotel_id, room_number)
VALUES (88001, 1, 101);

INSERT INTO reservations_rooms(reservation_id, hotel_id, room_number)
VALUES (88001, 1, 102);

INSERT INTO reservations_rooms(reservation_id, hotel_id, room_number)
VALUES (88002, 1, 201);

--
-- Guest 2: Sofia Reyes
-- Future reservation, no past stay
-- uses 2 different room types at Hotel Manatee
--

INSERT INTO guest(pid, name, id_number, id_type, address, mobile_phone, home_phone)
VALUES (77002, 'Sofia Reyes', 338812, 'license', '88 Sunset Blvd, Los Angeles, CA', '213-884-2291', '213-884-0011');

INSERT INTO reservations(id, start_date, end_date)
VALUES (88003, '2026-08-05', '2026-08-08');

INSERT INTO makes(guest_pid, reservation_id)
VALUES (77002, 88003);

INSERT INTO reservations_rooms(reservation_id, hotel_id, room_number)
VALUES (88003, 2, 101);

INSERT INTO reservations_rooms(reservation_id, hotel_id, room_number)
VALUES (88003, 2, 201);

--
-- Guest 3: James Okafor
-- Completed past stay, has a bill
--

INSERT INTO guest(pid, name, id_number, id_type, address, mobile_phone, home_phone)
VALUES (77003, 'James Okafor', 229043, 'passport', '5 Birchwood Dr, Atlanta, GA', '404-667-4423', '404-667-0099');

INSERT INTO occupant(pid, name, is_adult)
VALUES (77003, 'James Okafor', TRUE);

INSERT INTO occupant(pid, name, is_adult)
VALUES (77013, 'Jack Okafor', FALSE);

INSERT INTO reservations(id, start_date, end_date)
VALUES (88004, '2026-05-10', '2026-05-14');

INSERT INTO makes(guest_pid, reservation_id)
VALUES (77003, 88004);

INSERT INTO reservations_rooms(reservation_id, hotel_id, room_number)
VALUES (88004, 3, 101);

INSERT INTO stays(guest_pid, hotel_id, room_number, occupant_pid, from_date, to_date)
VALUES (77003, 3, 101, 77003, '2026-05-10 14:00:00', '2026-05-14 11:00:00');

INSERT INTO stays(guest_pid, hotel_id, room_number, occupant_pid, from_date, to_date)
VALUES (77003, 3, 101, 77013, '2026-05-10 14:00:00', '2026-05-14 11:00:00');

INSERT INTO bill(id, total_price, reservation_id, guest_pid)
VALUES (11001, 1200, 88004, 77003);

--
-- Guest 4: Claire Nguyen
-- Completed past stay, has a bill + room service charge
--

INSERT INTO guest(pid, name, id_number, id_type, address, mobile_phone, home_phone)
VALUES (77004, 'Claire Nguyen', 119934, 'license', '20 Maple St, Houston, TX', '713-552-8810', '713-552-0044');

INSERT INTO occupant(pid, name, is_adult)
VALUES (77004, 'Claire Nguyen', TRUE);

INSERT INTO reservations(id, start_date, end_date)
VALUES (88005, '2026-11-10', '2026-11-14');

INSERT INTO makes(guest_pid, reservation_id)
VALUES (77004, 88005);

INSERT INTO reservations_rooms(reservation_id, hotel_id, room_number)
VALUES (88005, 4, 201);

INSERT INTO stays(guest_pid, hotel_id, room_number, occupant_pid, from_date, to_date)
VALUES (77004, 4, 201, 77004, '2026-11-10 14:00:00', '2026-11-14 11:00:00');

INSERT INTO bill(id, total_price, reservation_id, guest_pid)
VALUES (11002, 2750, 88005, 77004);

INSERT INTO charge_to(id, bill_id, date_charged, quantity)
VALUES (5001, 11002, '2026-11-12 08:30:00', 2);

INSERT INTO room_service(id, charge_to_id, name, unit_price, description)
VALUES (9001, 5001, 'Continental Breakfast', 35, 'Pastries, fruit, and coffee for two');

--
-- Guest 5: Daniel Park
-- Completed past stay, has a bill
--

INSERT INTO guest(pid, name, id_number, id_type, address, mobile_phone, home_phone)
VALUES (77005, 'Daniel Park', 774412, 'license', '9 Lakeview Rd, Seattle, WA', '206-774-5500', '206-774-0022');

INSERT INTO occupant(pid, name, is_adult)
VALUES (77005, 'Daniel Park', TRUE);

INSERT INTO reservations(id, start_date, end_date)
VALUES (88006, '2026-06-20', '2026-06-22');

INSERT INTO makes(guest_pid, reservation_id)
VALUES (77005, 88006);

INSERT INTO reservations_rooms(reservation_id, hotel_id, room_number)
VALUES (88006, 5, 103);

INSERT INTO stays(guest_pid, hotel_id, room_number, occupant_pid, from_date, to_date)
VALUES (77005, 5, 103, 77005, '2026-06-20 14:00:00', '2026-06-22 11:00:00');

INSERT INTO bill(id, total_price, reservation_id, guest_pid)
VALUES (11003, 890, 88006, 77005);
