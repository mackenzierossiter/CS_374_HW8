ALTER TABLE bill DROP CONSTRAINT IF EXISTS fk_bill_reservation;
ALTER TABLE bill DROP CONSTRAINT IF EXISTS fk_bill_guest;

ALTER TABLE charge_to DROP CONSTRAINT IF EXISTS fk_charge_bill;

ALTER TABLE room_service DROP CONSTRAINT IF EXISTS fk_service_charge;

ALTER TABLE phone_number DROP CONSTRAINT IF EXISTS fk_phone_hotel;

ALTER TABLE guests_in_hotel DROP CONSTRAINT IF EXISTS fk_gih_hotel;
ALTER TABLE guests_in_hotel DROP CONSTRAINT IF EXISTS fk_gih_guest;

ALTER TABLE season DROP CONSTRAINT IF EXISTS fk_season_hotel;

ALTER TABLE has_rate DROP CONSTRAINT IF EXISTS fk_rate_season;
ALTER TABLE has_rate DROP CONSTRAINT IF EXISTS fk_rate_roomtype;

ALTER TABLE makes DROP CONSTRAINT IF EXISTS fk_makes_guest;
ALTER TABLE makes DROP CONSTRAINT IF EXISTS fk_makes_reservation;

ALTER TABLE rooms DROP CONSTRAINT IF EXISTS fk_rooms_hotel;
ALTER TABLE rooms DROP CONSTRAINT IF EXISTS fk_rooms_type;

ALTER TABLE features DROP CONSTRAINT IF EXISTS fk_features_type;

ALTER TABLE reservations_rooms DROP CONSTRAINT IF EXISTS fk_rr_res;
ALTER TABLE reservations_rooms DROP CONSTRAINT IF EXISTS fk_rr_room;

ALTER TABLE stays DROP CONSTRAINT IF EXISTS fk_stays_guest;
ALTER TABLE stays DROP CONSTRAINT IF EXISTS fk_stays_room;
ALTER TABLE stays DROP CONSTRAINT IF EXISTS fk_stays_occupant;

ALTER TABLE guest DROP CONSTRAINT IF EXISTS fk_guest_discount;

ALTER TABLE room_type_has_reservations DROP CONSTRAINT IF EXISTS room_type_reservations_room_type_tid;
ALTER TABLE room_type_has_reservations DROP CONSTRAINT IF EXISTS room_type_reservations_reservationsId;