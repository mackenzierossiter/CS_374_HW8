ALTER TABLE bill
ADD CONSTRAINT fk_bill_reservation
FOREIGN KEY (reservation_id) REFERENCES reservations(id);

ALTER TABLE bill
ADD CONSTRAINT fk_bill_guest
FOREIGN KEY (guest_pid) REFERENCES guest(pid);

ALTER TABLE charge_to
ADD CONSTRAINT fk_charge_bill
FOREIGN KEY (bill_id) REFERENCES bill(id);

ALTER TABLE room_service
ADD CONSTRAINT fk_service_charge
FOREIGN KEY (charge_to_id) REFERENCES charge_to(id);

ALTER TABLE phone_number
ADD CONSTRAINT fk_phone_hotel
FOREIGN KEY (hotel_id) REFERENCES hotel(id);

ALTER TABLE guests_in_hotel
ADD CONSTRAINT fk_gih_hotel
FOREIGN KEY (hotel_id) REFERENCES hotel(id);

ALTER TABLE guests_in_hotel
ADD CONSTRAINT fk_gih_guest
FOREIGN KEY (guest_pid) REFERENCES guest(pid);

ALTER TABLE season
ADD CONSTRAINT fk_season_hotel
FOREIGN KEY (hotel_id) REFERENCES hotel(id);

ALTER TABLE has_rate
ADD CONSTRAINT fk_rate_season
FOREIGN KEY (season_id) REFERENCES season(id);

ALTER TABLE has_rate
ADD CONSTRAINT fk_rate_roomtype
FOREIGN KEY (room_type_id) REFERENCES room_type(id);

ALTER TABLE makes
ADD CONSTRAINT fk_makes_guest
FOREIGN KEY (guest_pid) REFERENCES guest(pid);

ALTER TABLE makes
ADD CONSTRAINT fk_makes_reservation
FOREIGN KEY (reservation_id) REFERENCES reservations(id);

ALTER TABLE rooms
ADD CONSTRAINT fk_rooms_hotel
FOREIGN KEY (hotel_id) REFERENCES hotel(id);

ALTER TABLE rooms
ADD CONSTRAINT fk_rooms_type
FOREIGN KEY (room_type_id) REFERENCES room_type(id);

ALTER TABLE features
ADD CONSTRAINT fk_features_type
FOREIGN KEY (room_type_id) REFERENCES room_type(id);

ALTER TABLE reservations_rooms
ADD CONSTRAINT fk_rr_res
FOREIGN KEY (reservation_id) REFERENCES reservations(id);

ALTER TABLE reservations_rooms
ADD CONSTRAINT fk_rr_room
FOREIGN KEY (hotel_id, room_number) REFERENCES rooms(hotel_id, room_number);

ALTER TABLE stays
ADD CONSTRAINT fk_stays_guest
FOREIGN KEY (guest_pid) REFERENCES guest(pid);

ALTER TABLE stays
ADD CONSTRAINT fk_stays_room
FOREIGN KEY (hotel_id, room_number) REFERENCES rooms(hotel_id, room_number);

ALTER TABLE stays
ADD CONSTRAINT fk_stays_occupant
FOREIGN KEY (occupant_pid) REFERENCES occupant(pid);

ALTER TABLE guest
ADD CONSTRAINT fk_guest_discount
FOREIGN KEY (discount_category) REFERENCES discount(id);


ALTER TABLE room_type_has_reservations
ADD CONSTRAINT room_type_reservations_room_type_tid
FOREIGN KEY (room_type_tid) REFERENCES room_type(id);


ALTER TABLE room_type_has_reservations
ADD CONSTRAINT room_type_reservations_reservationsId
FOREIGN KEY (reservations_idReservations) REFERENCES reservations(id);
