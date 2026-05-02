-- Sarah Gerhart
-- Query 4
SELECT g.name AS Reserver, o.name AS Occupant, s.room_number
FROM occupant o
	JOIN stays s ON o.pid = s.occupant_pid
	JOIN guest g ON s.guest_pid = g.pid
WHERE s.room_number = 101 
	AND '2026-05-13' BETWEEN s.from_date AND s.to_date;

-- Query 3
-- add a special charge
INSERT INTO charge_to(id, bill_id, date_charged, quantity)
VALUES (9, 02458, '04-27-2026', 1);

INSERT INTO room_service(id, charge_to_id, name, unit_price, description)
VALUES (1, 9, 'Dinner', 15, 'Pasta');

-- generate price
SELECT s.from_date AS start_date, s.to_date AS end_date, rt.name AS room_type, extras.extra_service, 
	SUM(hr.price * (1 - (d.discount_amount / 100.0))) 
		+ extras.extra_total AS total
FROM stays s
	JOIN rooms r ON s.room_number = r.room_number
		AND s.hotel_id = r.hotel_id
	JOIN room_type rt ON r.room_type_id = rt.id
	JOIN generate_series(s.from_date, s.to_date - INTERVAL '1 day', INTERVAL '1 day') AS dte(stay_date)
		ON TRUE
	JOIN season se ON se.hotel_id = s.hotel_id
		AND dte.stay_date BETWEEN se.start_date AND se.end_date
	JOIN has_rate hr ON hr.room_type_id = rt.id
		AND hr.day_of_week = TO_CHAR(dte.stay_date, 'Dy')
		AND hr.season_id = se.id
	JOIN guest g ON s.guest_pid = g.pid
	JOIN discount d ON g.discount_category = d.id
	JOIN (
		SELECT b.guest_pid, STRING_AGG(rs.name, ', ') AS extra_service,
			SUM(rs.unit_price * ct.quantity) AS extra_total
		FROM bill b
			JOIN charge_to ct ON ct.bill_id = b.id
			JOIN room_service rs ON rs.charge_to_id = ct.id
		GROUP BY b.guest_pid
		) AS extras ON extras.guest_pid = g.pid
WHERE g.pid = 09238
GROUP BY s.from_date, s.to_date, rt.name, extras.extra_service, extras.extra_total;

-- update stay time out to check out
UPDATE stays
SET to_date = '04-28-2026 10:00:00'
WHERE guest_pid = 09238;

-- remove guest from current guests to check out
DELETE FROM guests_in_hotel
WHERE guest_pid = 09238 AND hotel_id = 2;

-- Update their bill
UPDATE bill
SET total_price = 357.00
WHERE guest_pid = 09238;



