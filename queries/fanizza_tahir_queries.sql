-- Query Set 1 and 5.
-- Fanizza Tahir

-- This deletes old Query 1 rows so the file can run again.

DELETE FROM reservations_rooms
WHERE reservation_id = 99101;

DELETE FROM makes
WHERE reservation_id = 99101;

DELETE FROM reservations
WHERE id = 99101;

DELETE FROM guest
WHERE pid = 99001;

-- This deletes old Query 5 test rows so the file can run again.

DELETE FROM bill
WHERE id IN (99501, 99502);

DELETE FROM reservations_rooms
WHERE reservation_id IN (99501, 99502);

DELETE FROM makes
WHERE reservation_id IN (99501, 99502);

DELETE FROM reservations
WHERE id IN (99501, 99502);

DELETE FROM guest
WHERE pid = 99500;

-- Query 1.
-- This query finds available room types at Hotel Panda from 2026-07-15 to 2026-07-17.
-- This query also calculates the average cost per night for a GOLD guest.

SELECT
    rt.id,
    rt.capacity,
    rt.size,
    ROUND(SUM(hr.price) * (1 - d.discount_amount / 100.0) / 2.0, 2) AS avg_cost_per_night
FROM room_type rt
JOIN rooms r
    ON r.room_type_id = rt.id
JOIN has_rate hr
    ON hr.room_type_id = rt.id
JOIN season s
    ON s.id = hr.season_id
JOIN discount d
    ON d.discount_category = 'GOLD'
WHERE r.hotel_id = 1
    AND s.hotel_id = 1
    AND s.name = 'Summer'
    AND hr.day_of_week IN ('Wed', 'Thu')
    AND r.room_number NOT IN (
        SELECT rr.room_number
        FROM reservations_rooms rr
        JOIN reservations res
            ON res.id = rr.reservation_id
        WHERE rr.hotel_id = 1
            AND res.start_date < '2026-07-17'
            AND res.end_date > '2026-07-15'
    )
GROUP BY rt.id, rt.capacity, rt.size, d.discount_amount
ORDER BY avg_cost_per_night;

-- Query 1: INSERT
-- This insert adds the new guest.

INSERT INTO guest (pid, name, id_number, id_type, address, mobile_phone, home_phone, discount_category)
VALUES (99001, 'Fanizza Tahir', 556677, 'passport', '45 Newbury St, Boston, MA', '617-443-9910', '617-443-0099', 2);

-- This insert adds the reservation.

INSERT INTO reservations (id, start_date, end_date)
VALUES (99101, '2026-07-15', '2026-07-17');

-- This insert connects the guest to the reservation.

INSERT INTO makes (guest_pid, reservation_id)
VALUES (99001, 99101);

-- This insert connects the reservation to the room.

INSERT INTO reservations_rooms (reservation_id, hotel_id, room_number)
VALUES (99101, 1, 201);

-- This setup adds data for Query 5.
-- This setup creates one guest with 2 reservations in 2 different hotels.

INSERT INTO guest (pid, name, id_number, id_type, address, mobile_phone, home_phone, discount_category)
VALUES (99500, 'Query Five Guest', 445566, 'passport', '12 Test Ave, Boston, MA', '555-111-2222', '555-111-3333', 1);

INSERT INTO reservations (id, start_date, end_date)
VALUES (99501, '2026-03-10', '2026-03-12');

INSERT INTO reservations (id, start_date, end_date)
VALUES (99502, '2026-08-20', '2026-08-23');

INSERT INTO makes (guest_pid, reservation_id)
VALUES (99500, 99501);

INSERT INTO makes (guest_pid, reservation_id)
VALUES (99500, 99502);

INSERT INTO reservations_rooms (reservation_id, hotel_id, room_number)
VALUES (99501, 1, 101);

INSERT INTO reservations_rooms (reservation_id, hotel_id, room_number)
VALUES (99502, 2, 201);

INSERT INTO bill (id, total_price, reservation_id, guest_pid)
VALUES (99501, 600, 99501, 99500);

INSERT INTO bill (id, total_price, reservation_id, guest_pid)
VALUES (99502, 900, 99502, 99500);

-- Query 5.
-- This query finds the total amount spent by guests in 2026.
-- This query only includes guests with at least 2 reservations in at least 2 hotels.

SELECT
    g.pid,
    g.name,
    SUM(b.total_price) AS total_spent
FROM guest g
JOIN makes m
    ON m.guest_pid = g.pid
JOIN reservations r
    ON r.id = m.reservation_id
JOIN bill b
    ON b.reservation_id = r.id
JOIN reservations_rooms rr
    ON rr.reservation_id = r.id
WHERE r.start_date >= '2026-01-01'
    AND r.end_date <= '2026-12-31'
GROUP BY g.pid, g.name
HAVING COUNT(DISTINCT r.id) >= 2
    AND COUNT(DISTINCT rr.hotel_id) >= 2;