-- Sarah Gerhart
-- Query 4
SELECT g.name AS Reserver, o.name AS Occupant, s.room_number
FROM occupant o
	JOIN stays s ON o.pid = s.occupant_pid
	JOIN guest g ON s.guest_pid = g.pid
WHERE s.room_number = 101 
	AND '2026-05-13' BETWEEN s.from_date AND s.to_date;

-- Query 3
INSERT INTO charge_to(id, bill_id, date_charged, quantity)
VALUES (9, 02458, '04-27-2026', 1);

INSERT INTO room_service(id, charge_to_id, name, unit_price, description)
VALUES (1, 9, 'Dinner', 15, 'Pasta');

SELECT s.from_date AS start, s.to_date AS end, room_type, extra_features, total
FROM stay s
JOIN(
	SELECT 
)
-- join something to get room type name