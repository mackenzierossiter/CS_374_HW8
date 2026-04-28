DROP TABLE IF EXISTS stays;
DROP TABLE IF EXISTS reservations_rooms;
DROP TABLE IF EXISTS features;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS makes;
DROP TABLE IF EXISTS has_rate;
DROP TABLE IF EXISTS room_type_has_reservations;
DROP TABLE IF EXISTS room_type;
DROP TABLE IF EXISTS season;
DROP TABLE IF EXISTS occupant;
DROP TABLE IF EXISTS guests_in_hotel;
DROP TABLE IF EXISTS phone_number;
DROP TABLE IF EXISTS hotel;
DROP TABLE IF EXISTS room_service;
DROP TABLE IF EXISTS charge_to;
DROP TABLE IF EXISTS bill;
DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS guest;
DROP TABLE IF EXISTS discount;



CREATE TABLE discount (
  id INT PRIMARY KEY,
  discount_category VARCHAR(45) NOT NULL,
  discount_amount DECIMAL(5,2) NOT NULL
);

CREATE TABLE guest (
  pid INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  id_number INT NOT NULL,
  id_type VARCHAR(45) NOT NULL,
  address VARCHAR(255) NOT NULL,
  mobile_phone VARCHAR(15),
  home_phone VARCHAR(15),
  discount_category INT
);

CREATE TABLE reservations (
  id INT PRIMARY KEY,
  room_type_name VARCHAR(45),
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

CREATE TABLE bill (
  id INT PRIMARY KEY,
  reservation_id INT NOT NULL,
  guest_pid INT NOT NULL,
  total_price INT NOT NULL
);

CREATE TABLE charge_to (
  id INT PRIMARY KEY,
  bill_id INT NOT NULL,
  date_charged TIMESTAMP NOT NULL,
  quantity INT NOT NULL
);

CREATE TABLE room_service (
  id INT PRIMARY KEY,
  charge_to_id INT NOT NULL,
  name VARCHAR(100),
  unit_price INT,
  description VARCHAR(255)
);

CREATE TABLE hotel (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  address VARCHAR(255),
  features TEXT
);

CREATE TABLE phone_number (
  id SERIAL PRIMARY KEY,
  hotel_id INT,
  phone_number VARCHAR(15)
);

CREATE TABLE guests_in_hotel (
  hotel_id INT,
  guest_pid INT,
  PRIMARY KEY (hotel_id, guest_pid)
);

CREATE TABLE occupant (
  pid INT PRIMARY KEY,
  name VARCHAR(100),
  is_adult BOOLEAN
);

CREATE TABLE season (
  id INT PRIMARY KEY,
  hotel_id INT,
  name VARCHAR(45),
  start_date DATE,
  end_date DATE
);

CREATE TABLE room_type (
  id INT PRIMARY KEY,
  capacity INT,
  name VARCHAR(45),
  size INT
);

CREATE TABLE has_rate (
  id SERIAL PRIMARY KEY,
  season_id INT,
  room_type_id INT,
  day_of_week VARCHAR(10),
  price INT
);

CREATE TABLE makes (
  guest_pid INT,
  reservation_id INT,
  PRIMARY KEY (guest_pid, reservation_id)
);

CREATE TABLE rooms (
  room_number INT,
  hotel_id INT,
  room_type_id INT,
  floor INT,
  PRIMARY KEY (hotel_id, room_number)
);

CREATE TABLE features (
  id SERIAL PRIMARY KEY,
  room_type_id INT,
  feature_name VARCHAR(100)
);

CREATE TABLE reservations_rooms (
  reservation_id INT,
  hotel_id INT,
  room_number INT,
  PRIMARY KEY (reservation_id, hotel_id, room_number)
);

CREATE TABLE stays (
  id SERIAL PRIMARY KEY,
  guest_pid INT,
  hotel_id INT,
  room_number INT,
  occupant_pid INT,
  from_date TIMESTAMP,
  to_date TIMESTAMP
);


CREATE TABLE room_type_has_reservations (
  room_type_tid INT,
  room_type_name VARCHAR(45),
  reservations_idReservations INT,
  PRIMARY KEY(room_type_tid, reservations_idReservations)
);