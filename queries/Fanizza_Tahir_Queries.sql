-- HW8 Query Set 1 and 5
-- Fanizza Tahir

-- Query 1: Reservations
-- Finds room types available at Hotel A for July 15-17.
-- Calculates the average cost per night for a gold customer (id=2).

SELECT 
    rt.tid, 
    rt.capacity, 
    rt.size, 
    ROUND(SUM(rate.price) * (1 - d.discount_amount) / 2.0, 2) AS avg_cost_per_night
FROM room_type rt
JOIN rooms r 
    ON r.room_type_id = rt.tid 
    AND r.hotel_id = 1
JOIN season s 
    ON s.hotel_id = 1
JOIN has_rate rate 
    ON rate.room_type_id = rt.tid 
    AND rate.season_id = s.sid
JOIN discount d 
    ON d.id = 2
WHERE s.name = 'summer'
    AND rate.day_of_week_day_name IN ('wednesday', 'thursday')
    AND rt.tid NOT IN (
        SELECT r2.room_type_id
        FROM rooms r2
        JOIN reservations_rooms rr 
            ON rr.rooms_room_number = r2.room_number 
            AND rr.hotel_id = r2.hotel_id
        JOIN reservations res 
            ON res.idReservations = rr.reservations_idReservations
        WHERE r2.hotel_id = 1
            AND res.start = '2026-07-15'
            AND res."end" = '2026-07-17'
        GROUP BY r2.room_type_id
    )
GROUP BY rt.tid, rt.capacity, rt.size, d.discount_amount
ORDER BY avg_cost_per_night;

-- Query 1 insert
-- Adds guest and creates reservation.

INSERT INTO guest (pid, id_number, id_type, address, mobile_phone, home_phone, discount_category, name)
VALUES (99001, 556677, 'passport', '45 Newbury St, Boston, MA', '617-443-9910', '617-443-0099', 2, 'Fanizza Tahir');

INSERT INTO reservations (idReservations, start, "end")
VALUES (99101, '2026-07-15', '2026-07-17');

INSERT INTO makes (guest_pid, reservations_idReservations)
VALUES (99001, 99101);

INSERT INTO reservations_rooms (reservations_idReservations, rooms_room_number, rooms_room_type_id, hotel_id)
VALUES (99101, 201, 2, 1);

-- Query 5: Total spending over a year
-- Totals guest spending in a one-year period.
-- Requires >= 2 reservations in >= 2 different hotels.

SELECT 
    g.pid, 
    g.name, 
    SUM(b.total_price) AS total_spent
FROM guest g
JOIN makes m 
    ON m.guest_pid = g.pid
JOIN reservations r 
    ON r.idReservations = m.reservations_idReservations
JOIN bill b 
    ON b.reservations_idReservations = r.idReservations
JOIN reservations_rooms rr 
    ON rr.reservations_idReservations = r.idReservations
WHERE r.start >= '2026-01-01'
    AND r."end" <= '2026-12-31'
GROUP BY g.pid, g.name
HAVING COUNT(DISTINCT r.idReservations) >= 2
    AND COUNT(DISTINCT rr.hotel_id) >= 2;

