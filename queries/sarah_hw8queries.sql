-- Sarah Gerhart
-- Query 4
-- added occupant and stays
SELECT g.name AS Reserver, o.name AS Occupant, s.room_number
FROM occupant o
	JOIN stays s ON o.pid = s.occupant_pid
	JOIN guest g ON s.guest_pid = g.pid
WHERE s.room_number = 101 
	AND '2026-05-13' BETWEEN s.from_date AND s.to_date;
