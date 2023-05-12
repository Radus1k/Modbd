DROP TABLE IF EXISTS regiune CASCADE;
CREATE TABLE regiune
( id_regiune INT,
nume VARCHAR(50) CONSTRAINT nume_regiune_nn NOT NULL);

ALTER TABLE regiune
ADD CONSTRAINT id_regiune_pk PRIMARY KEY (id_regiune);


DROP TABLE IF EXISTS judet CASCADE;
CREATE TABLE judet
( id_judet INT,
id_regiune INT CONSTRAINT id_regiune_hotel_nn NOT NULL,
nume VARCHAR(50) CONSTRAINT nume_judet_nn NOT NULL);

ALTER TABLE judet
ADD CONSTRAINT id_judet_pk PRIMARY KEY (id_judet);

ALTER TABLE judet
ADD CONSTRAINT regiune_fk_judet FOREIGN KEY(id_regiune) REFERENCES regiune(id_regiune);



DROP TABLE IF EXISTS localitate CASCADE;
CREATE TABLE localitate
( id_localitate INT,
id_judet INT CONSTRAINT id_localitate_hotel_nn NOT NULL,
nume VARCHAR(50) CONSTRAINT nume_localitate_nn NOT NULL);

CREATE UNIQUE INDEX id_localitate_localitate_index
ON localitate (id_localitate);

ALTER TABLE localitate
ADD CONSTRAINT id_localitate_pk PRIMARY KEY (id_localitate);

ALTER TABLE localitate
ADD CONSTRAINT judet_fk_localitate FOREIGN KEY(id_judet) REFERENCES judet(id_judet);



DROP TABLE IF EXISTS hotel CASCADE;
CREATE TABLE hotel
( id_hotel INT,
nume VARCHAR(50) CONSTRAINT nume_hotel_hotel_nn NOT NULL,
nr_stele INT CONSTRAINT nr_stele_nn NOT NULL,
adresa VARCHAR(50) CONSTRAINT adresa_hotel NOT NULL,
id_localitate INT CONSTRAINT id_localitate_hotel_nn NOT NULL);

ALTER TABLE hotel
ADD CONSTRAINT id_hotel_pk PRIMARY KEY (id_hotel);

ALTER TABLE hotel
ADD CONSTRAINT localitate_fk_hotel FOREIGN KEY(id_localitate) REFERENCES localitate(id_localitate);



DROP TABLE IF EXISTS tip_camera CASCADE;
CREATE TABLE tip_camera
( id_tip_camera INT GENERATED ALWAYS as IDENTITY(START WITH 1 INCREMENT BY 1),
nr_paturi_duble SMALLINT CONSTRAINT nr_paturi_duble_tip_camera_nn NOT NULL,
nr_paturi_simple SMALLINT CONSTRAINT nr_paturi_simple_tip_camera_nn NOT NULL);

ALTER TABLE tip_camera
ADD CONSTRAINT id_tip_camera_pk PRIMARY KEY (id_tip_camera);



DROP TABLE IF EXISTS hotel_tip_camera CASCADE;
CREATE TABLE hotel_tip_camera
( id_hotel INT CONSTRAINT id_hotel_hotel_tip_camera_nn NOT NULL,
id_tip_camera INT CONSTRAINT id_tip_camera_hotel_tip_camera_nn NOT NULL,
nr_camere SMALLINT CONSTRAINT nr_camere_hotel_tip_camera_nn NOT NULL,
pret_per_noapte REAL CONSTRAINT pret_per_noapte_hotel_tip_camera_nn NOT NULL);

ALTER TABLE hotel_tip_camera
ADD CONSTRAINT id_hotel_tip_camera_pk PRIMARY KEY (id_hotel,id_tip_camera);

ALTER TABLE hotel_tip_camera
ADD CONSTRAINT hotel_fk_hotel_tip_camera FOREIGN KEY(id_hotel) REFERENCES hotel(id_hotel);
ALTER TABLE hotel_tip_camera
ADD CONSTRAINT tip_camera_fk_hotel_tip_camera FOREIGN KEY (id_tip_camera) REFERENCES tip_camera(id_tip_camera);



-- DROP TABLE IF EXISTS client CASCADE;
-- CREATE TABLE client
-- ( id_client INT GENERATED ALWAYS as IDENTITY(START WITH 1 INCREMENT BY 1),
-- nume_utilizator VARCHAR(30) CONSTRAINT nume_client_nn NOT NULL,
-- hash_parola VARCHAR(25) CONSTRAINT hash_parola_client_nn NOT NULL,
-- nume_complet VARCHAR(30) CONSTRAINT nume_complet_client_nn NOT NULL,
-- telefon CHAR(15) CONSTRAINT telefon_client_nn NOT NULL,
-- email VARCHAR(50) CONSTRAINT email_client_nn NOT NULL,
-- cnp CHAR(13),
-- iban CHAR(34));

-- ALTER TABLE client
-- ADD CONSTRAINT id_client_pk PRIMARY KEY (id_client);



DROP TABLE IF EXISTS rezervare CASCADE;
CREATE TABLE rezervare
( id_rezervare INT,
id_client INT CONSTRAINT id_client_rezervare_nn NOT NULL,
id_hotel INT CONSTRAINT id_hotel_rezervare_nn NOT NULL,
data_efectuarii DATE,
data_inceput DATE CONSTRAINT data_inceput_rezervare_nn NOT NULL,
data_sfarsit DATE CONSTRAINT data_sfarsit_rezervare_nn NOT NULL,
pret_total REAL,
specificatii VARCHAR(2500));

ALTER TABLE rezervare
ADD CONSTRAINT id_rezervare_pk PRIMARY KEY (id_rezervare);

ALTER TABLE rezervare
ADD CONSTRAINT client_fk_rezervare FOREIGN KEY(id_client) REFERENCES client(id_client);
ALTER TABLE rezervare
ADD CONSTRAINT hotel_fk_rezervare FOREIGN KEY(id_hotel) REFERENCES hotel(id_hotel);



DROP TABLE IF EXISTS rezervare_tip_camera CASCADE;
CREATE TABLE rezervare_tip_camera
( id_rezervare INT CONSTRAINT id_rezervare_rezervare_tip_camera_nn NOT NULL,
id_tip_camera INT CONSTRAINT id_tip_camera_rezervare_tip_camera_nn NOT NULL,
nr_camere SMALLINT CONSTRAINT nr_camere_rezervare_tip_camera_nn NOT NULL,
pret_per_noapte REAL CONSTRAINT pret_per_noapte_rezervare_tip_camera_nn NOT NULL);

ALTER TABLE rezervare_tip_camera
ADD CONSTRAINT id_rezervare_tipare_pk PRIMARY KEY (id_rezervare,id_tip_camera);

ALTER TABLE rezervare_tip_camera
ADD CONSTRAINT rezervare_fk_rezervare_tip_camera FOREIGN KEY(id_rezervare) REFERENCES rezervare(id_rezervare);
ALTER TABLE rezervare_tip_camera
ADD CONSTRAINT tip_camera_fk_rezervare_tip_camera FOREIGN KEY (id_tip_camera) REFERENCES tip_camera(id_tip_camera);



DROP TABLE IF EXISTS recenzie CASCADE;
CREATE TABLE recenzie
( id_recenzie INT,
id_client INT CONSTRAINT id_client_recenzie_nn NOT NULL,
id_hotel INT CONSTRAINT id_hotel_recenzie_nn NOT NULL,
scor SMALLINT CONSTRAINT scor_recenzie_nn NOT NULL,
text_recenzie VARCHAR(2500) CONSTRAINT text_recenzie_nn NOT NULL);

ALTER TABLE recenzie
ADD CONSTRAINT id_recenzie_pk PRIMARY KEY (id_recenzie);

ALTER TABLE recenzie
ADD CONSTRAINT client_fk_recenzie FOREIGN KEY(id_client) REFERENCES client(id_client);
ALTER TABLE recenzie
ADD CONSTRAINT hotel_fk_recenzie FOREIGN KEY(id_hotel) REFERENCES hotel(id_hotel);



DROP TABLE IF EXISTS facilitate CASCADE;
CREATE TABLE facilitate( id_facilitate INT GENERATED ALWAYS AS IDENTITY ( START WITH 1 INCREMENT BY 1),
						nume TEXT CONSTRAINT nume_facilitate_nn NOT NULL );

ALTER TABLE facilitate
ADD CONSTRAINT id_facilitate_pk PRIMARY KEY (id_facilitate);



DROP TABLE IF EXISTS hotel_facilitate CASCADE;
CREATE TABLE hotel_facilitate(id_hotel INT CONSTRAINT id_hotel_hotel_facilitate_nn NOT NULL,
							  id_facilitate INT CONSTRAINT id_facilitate_hotel_facilitate_nn NOT NULL);
ALTER TABLE hotel_facilitate
ADD CONSTRAINT hotel_facilitate_pk PRIMARY KEY (id_hotel,id_facilitate);

ALTER TABLE hotel_facilitate
ADD CONSTRAINT hotel_fk_hotel_facilitate FOREIGN KEY(id_hotel) REFERENCES hotel(id_hotel);

ALTER TABLE hotel_facilitate
ADD CONSTRAINT facilitate_fk_hotel_facilitate FOREIGN KEY(id_facilitate) REFERENCES facilitate(id_facilitate);



DROP TABLE IF EXISTS administrator CASCADE;
CREATE TABLE administrator (
  id_administrator INT PRIMARY KEY,
  nume_utilizator TEXT NOT NULL UNIQUE,
  hash_parola TEXT NOT NULL,
  nume_complet TEXT NOT NULL,
  telefon CHAR(15) NOT NULL,
  email TEXT NOT NULL UNIQUE,
  cnp CHAR(13) NOT NULL UNIQUE);



DROP TABLE IF EXISTS hotel_administrator CASCADE;
CREATE TABLE hotel_administrator (
  id_hotel INT REFERENCES hotel(id_hotel),
  id_administrator INT REFERENCES administrator(id_administrator),
  PRIMARY KEY (id_hotel,id_administrator));

CREATE TABLE client (
    id_client INT PRIMARY KEY,
    nume_utilizator VARCHAR(50),
    telefon VARCHAR(50)
);

-- -- Create a trigger function to replicate data
-- CREATE OR REPLACE FUNCTION replicate_to_client_table()
-- RETURNS TRIGGER AS $$
-- BEGIN
--     -- Insert the selected columns into the replica table
--     INSERT INTO client (id_client, nume_utilizator, telefon)
--     VALUES (NEW.id_client, NEW.nume_utilizator, NEW.telefon);
--     RETURN NEW;
-- END;
-- $$ LANGUAGE plpgsql;

-- -- Create a trigger on the client table to invoke the replicate function
-- CREATE TRIGGER replicate_trigger
-- AFTER INSERT OR UPDATE OR DELETE ON client
-- FOR EACH ROW EXECUTE FUNCTION replicate_to_client_table();