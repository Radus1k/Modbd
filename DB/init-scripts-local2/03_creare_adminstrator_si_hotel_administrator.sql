

DROP TABLE IF EXISTS adminstrator CASCADE;
CREATE TABLE administrator (
  id_administrator BIGINT PRIMARY KEY,
  nume_utilizator TEXT NOT NULL UNIQUE,
  hash_parola TEXT NOT NULL,
  nume_complet TEXT NOT NULL,
  telefon CHAR(15) NOT NULL,
  email TEXT NOT NULL UNIQUE,
  cnp CHAR(13) NOT NULL UNIQUE);

DROP TABLE IF EXISTS hotel_adminstrator CASCADE;
CREATE TABLE hotel_administrator (
  id_hotel BIGINT REFERENCES hotel(id_hotel),
  id_administrator BIGINT REFERENCES administrator(id_administrator),
  PRIMARY KEY (id_hotel,id_administrator));
