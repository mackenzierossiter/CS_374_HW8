-- Query Set 1 and 5 (THE DATA)
-- Fanizza Tahir

------------------------------------------
-- QUERY 1
------------------------------------------

-- Insert guest
INSERT INTO guest (pid, name, id_number, id_type, address, mobile_phone, home_phone, discount_category)
VALUES (99001, 'Fanizza Tahir', 556677, 'passport', '45 Newbury St, Boston, MA', '617-443-9910', '617-443-0099', 2);

DELETE FROM guest
WHERE pid = 99001;

-- Insert reservation
INSERT INTO reservations (id, start_date, end_date)
VALUES (99101, '2026-07-15', '2026-07-17');

DELETE FROM reservations
WHERE id = 99101;

-- Connect guest to reservation
INSERT INTO makes (guest_pid, reservation_id)
VALUES (99001, 99101);

DELETE FROM makes
WHERE reservation_id = 99101;

-- Connect reservation to room
INSERT INTO reservations_rooms (reservation_id, hotel_id, room_number)
VALUES (99101, 1, 201);

DELETE FROM reservations_rooms
WHERE reservation_id = 99101;

------------------------------------------
-- QUERY 5
------------------------------------------

-- Insert guest
INSERT INTO guest (pid, name, id_number, id_type, address, mobile_phone, home_phone, discount_category)
VALUES (99500, 'Query Five Guest', 445566, 'passport', '12 Test Ave, Boston, MA', '555-111-2222', '555-111-3333', 1);

DELETE FROM guest
WHERE pid = 99500;

-- Insert reservations
INSERT INTO reservations (id, start_date, end_date)
VALUES (99501, '2026-03-10', '2026-03-12');

DELETE FROM reservations
WHERE id = 99501;

INSERT INTO reservations (id, start_date, end_date)
VALUES (99502, '2026-08-20', '2026-08-23');

DELETE FROM reservations
WHERE id = 99502;

-- Connect guest to reservations
INSERT INTO makes (guest_pid, reservation_id)
VALUES (99500, 99501);

DELETE FROM makes
WHERE reservation_id = 99501;

INSERT INTO makes (guest_pid, reservation_id)
VALUES (99500, 99502);

DELETE FROM makes
WHERE reservation_id = 99502;

-- Connect reservations to rooms
INSERT INTO reservations_rooms (reservation_id, hotel_id, room_number)
VALUES (99501, 1, 101);

DELETE FROM reservations_rooms
WHERE reservation_id = 99501;

INSERT INTO reservations_rooms (reservation_id, hotel_id, room_number)
VALUES (99502, 2, 201);

DELETE FROM reservations_rooms
WHERE reservation_id = 99502;

-- Insert bills
INSERT INTO bill (id, total_price, reservation_id, guest_pid)
VALUES (99501, 600, 99501, 99500);

DELETE FROM bill
WHERE id = 99501;

INSERT INTO bill (id, total_price, reservation_id, guest_pid)
VALUES (99502, 900, 99502, 99500);

DELETE FROM bill
WHERE id = 99502;
