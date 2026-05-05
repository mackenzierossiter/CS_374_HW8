-- Query Set 1 and 5 
-- Fanizza Tahir

------------------------------------------
-- QUERY 1
------------------------------------------

-- cleanup
DELETE FROM reservations_rooms WHERE reservation_id = 99101;
DELETE FROM makes WHERE reservation_id = 99101;
DELETE FROM reservations WHERE id = 99101;
DELETE FROM guest WHERE pid = 99001;

-- guest
INSERT INTO guest (pid, name, id_number, id_type, address, mobile_phone, home_phone, discount_category)
VALUES (99001, 'Fanizza Tahir', 556677, 'passport', '45 Newbury St, Boston, MA', '617-443-9910', '617-443-0099', 2);

-- reservation
INSERT INTO reservations (id, start_date, end_date)
VALUES (99101, '2026-07-15', '2026-07-17');

-- link guest + reservation
INSERT INTO makes (guest_pid, reservation_id)
VALUES (99001, 99101);

-- room booking
INSERT INTO reservations_rooms (reservation_id, hotel_id, room_number)
VALUES (99101, 1, 201);


------------------------------------------
-- QUERY 5
------------------------------------------

-- cleanup
DELETE FROM bill WHERE id IN (99501, 99502);
DELETE FROM reservations_rooms WHERE reservation_id IN (99501, 99502);
DELETE FROM makes WHERE reservation_id IN (99501, 99502);
DELETE FROM reservations WHERE id IN (99501, 99502);
DELETE FROM guest WHERE pid = 99500;

-- guest
INSERT INTO guest (pid, name, id_number, id_type, address, mobile_phone, home_phone, discount_category)
VALUES (99500, 'Query Five Guest', 445566, 'passport', '12 Test Ave, Boston, MA', '555-111-2222', '555-111-3333', 1);

-- reservations
INSERT INTO reservations (id, start_date, end_date)
VALUES (99501, '2026-03-10', '2026-03-12');

INSERT INTO reservations (id, start_date, end_date)
VALUES (99502, '2026-08-20', '2026-08-23');

-- links
INSERT INTO makes (guest_pid, reservation_id)
VALUES (99500, 99501);

INSERT INTO makes (guest_pid, reservation_id)
VALUES (99500, 99502);

-- rooms
INSERT INTO reservations_rooms (reservation_id, hotel_id, room_number)
VALUES (99501, 1, 101);

INSERT INTO reservations_rooms (reservation_id, hotel_id, room_number)
VALUES (99502, 2, 201);

-- bills
INSERT INTO bill (id, total_price, reservation_id, guest_pid)
VALUES (99501, 600, 99501, 99500);

INSERT INTO bill (id, total_price, reservation_id, guest_pid)
VALUES (99502, 900, 99502, 99500);
