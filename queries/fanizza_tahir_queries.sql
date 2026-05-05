-- Query Set 1 and 5.
-- Fanizza Tahir

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
