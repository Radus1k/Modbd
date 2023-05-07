DROP TABLE IF EXISTS client CASCADE;
CREATE TABLE client
( id_client BIGINT GENERATED ALWAYS as IDENTITY(START WITH 1 INCREMENT BY 1),
nume_client VARCHAR(30) CONSTRAINT nume_client_nn NOT NULL,
hash_parola VARCHAR(25) CONSTRAINT hash_parola_client_nn NOT NULL,
nume_complet VARCHAR(30) CONSTRAINT nume_complet_client_nn NOT NULL,
telefon CHAR(15) CONSTRAINT telefon_client_nn NOT NULL,
email VARCHAR(50) CONSTRAINT email_client_nn NOT NULL,
cnp CHAR(13),
iban CHAR(34));

CREATE UNIQUE INDEX id_client_index
ON client (id_client);

ALTER TABLE client
ADD CONSTRAINT id_client_pk PRIMARY KEY (id_client);

-- Create the REZERVARE table to hold information for reservation of users

DROP TABLE IF EXISTS rezervare CASCADE;
CREATE TABLE rezervare
( id_rezervare BIGINT GENERATED ALWAYS as IDENTITY(START WITH 1 INCREMENT BY 1),
id_client BIGINT CONSTRAINT id_client_rezervare_nn NOT NULL,
id_hotel BIGINT CONSTRAINT id_hotel_rezervare_nn NOT NULL,
data_efectuarii DATE,
data_inceput DATE CONSTRAINT data_inceput_rezervare_nn NOT NULL,
data_sfarsit DATE CONSTRAINT data_sfarsit_rezervare_nn NOT NULL,
pret_total REAL,
specificatii VARCHAR(2500));

CREATE UNIQUE INDEX id_rezervare_index
ON rezervare (id_rezervare);

ALTER TABLE rezervare
ADD CONSTRAINT id_rezervare_pk PRIMARY KEY (id_rezervare);

-- Create the RECENZIE table to hold information for reviews of hotels from clients

DROP TABLE IF EXISTS recenzie CASCADE;
CREATE TABLE recenzie
( id_recenzie BIGINT GENERATED ALWAYS as IDENTITY(START WITH 1 INCREMENT BY 1),
id_client BIGINT CONSTRAINT id_client_recenzie_nn NOT NULL,
id_hotel BIGINT CONSTRAINT id_hotel_recenzie_nn NOT NULL,
scor SMALLINT CONSTRAINT scor_recenzie_nn NOT NULL,
text_recenzie VARCHAR(2500) CONSTRAINT text_recenzie_nn NOT NULL);

CREATE UNIQUE INDEX id_recenzie_index
ON recenzie (id_recenzie);

ALTER TABLE recenzie
ADD CONSTRAINT id_recenzie_pk PRIMARY KEY (id_recenzie);

-- Create the tip_camera table to hold informations about rooms

DROP TABLE IF EXISTS tip_camera CASCADE;
CREATE TABLE tip_camera
( id_tip_camera BIGINT GENERATED ALWAYS as IDENTITY(START WITH 1 INCREMENT BY 1),
nr_paturi_duble SMALLINT CONSTRAINT nr_paturi_duble_tip_camera_nn NOT NULL,
nr_paturi_simple SMALLINT CONSTRAINT nr_paturi_simple_tip_camera_nn NOT NULL);

CREATE UNIQUE INDEX id_tip_camera_index
ON tip_camera (id_tip_camera);

ALTER TABLE tip_camera
ADD CONSTRAINT id_tip_camera_pk PRIMARY KEY (id_tip_camera);

-- Create the rezervare_tip_camera table to hold information about rooms of users


DROP TABLE IF EXISTS rezervare_tip_camera CASCADE;
CREATE TABLE rezervare_tip_camera
( id_rezervare BIGINT CONSTRAINT id_rezervare_rezervare_tip_camera_nn NOT NULL,
id_tip_camera BIGINT CONSTRAINT id_tip_camera_rezervare_tip_camera_nn NOT NULL,
nr_camere SMALLINT CONSTRAINT nr_camere_rezervare_tip_camera_nn NOT NULL,
pret_per_noapte REAL CONSTRAINT pret_per_noapte_rezervare_tip_camera_nn NOT NULL);

DROP TABLE IF EXISTS hotel CASCADE;
CREATE TABLE hotel
( id_hotel BIGINT GENERATED ALWAYS as IDENTITY(START WITH 1 INCREMENT BY 1),
nume VARCHAR(50) CONSTRAINT nume_hotel_hotel_nn NOT NULL,
nr_stele BIGINT CONSTRAINT nr_stele_nn NOT NULL,
adresa VARCHAR(50) CONSTRAINT adresa_hotel NOT NULL,
id_localitate BIGINT CONSTRAINT id_localitate_hotel_nn NOT NULL,
are_mic_dejun_inclus BOOL CONSTRAINT are_mic_dejun_inclus_hotel_nn NOT NULL,
are_piscina BOOL CONSTRAINT are_mic_dejun_inclus_hotel_nn NOT NULL);

CREATE UNIQUE INDEX id_hotel_index
ON hotel (id_hotel);

ALTER TABLE hotel
ADD CONSTRAINT id_hotel_pk PRIMARY KEY (id_hotel);

DROP TABLE IF EXISTS hotel_tip_camera CASCADE;
CREATE TABLE hotel_tip_camera
( id_hotel BIGINT CONSTRAINT id_hotel_hotel_tip_camera_nn NOT NULL,
id_tip_camera BIGINT CONSTRAINT id_tip_camera_hotel_tip_camera_nn NOT NULL,
nr_camere SMALLINT CONSTRAINT nr_camere_hotel_tip_camera_nn NOT NULL,
pret_per_noapte REAL CONSTRAINT pret_per_noapte_hotel_tip_camera_nn NOT NULL);

CREATE UNIQUE INDEX id_hotel_tip_camera_index
ON hotel_tip_camera (id_hotel,id_tip_camera);

ALTER TABLE hotel_tip_camera
ADD CONSTRAINT id_hotel_tip_camera_pk PRIMARY KEY (id_hotel,id_tip_camera);

DROP TABLE IF EXISTS localitate CASCADE;
CREATE TABLE localitate
( id_localitate BIGINT GENERATED ALWAYS as IDENTITY(START WITH 1 INCREMENT BY 1),
id_judet BIGINT CONSTRAINT id_localitate_hotel_nn NOT NULL,
nume VARCHAR(50) CONSTRAINT nume_localitate_nn NOT NULL);

CREATE UNIQUE INDEX id_localitate_localitate_index
ON localitate (id_localitate);

ALTER TABLE localitate
ADD CONSTRAINT id_localitate_pk PRIMARY KEY (id_localitate);

DROP TABLE IF EXISTS judet CASCADE;
CREATE TABLE judet
( id_judet BIGINT GENERATED ALWAYS as IDENTITY(START WITH 1 INCREMENT BY 1),
id_regiune BIGINT CONSTRAINT id_regiune_hotel_nn NOT NULL,
nume VARCHAR(50) CONSTRAINT nume_judet_nn NOT NULL);

CREATE UNIQUE INDEX id_judet_judet_index
ON judet (id_judet);

ALTER TABLE judet
ADD CONSTRAINT id_judet_pk PRIMARY KEY (id_judet);

DROP TABLE IF EXISTS regiune CASCADE;
CREATE TABLE regiune
( id_regiune BIGINT GENERATED ALWAYS as IDENTITY(START WITH 1 INCREMENT BY 1),
nume VARCHAR(50) CONSTRAINT nume_regiune_nn NOT NULL);

CREATE UNIQUE INDEX id_regiune_regiune_index
ON regiune (id_regiune);

ALTER TABLE regiune
ADD CONSTRAINT id_regiune_pk PRIMARY KEY (id_regiune);








--REM *********Introducerea de FK tabelului**** REZERVARE****************

--Prompt ******  Creating FK Constraints on table REZERVARE ....

ALTER TABLE rezervare
add constraint client_fk_rezervare FOREIGN KEY(id_client) REFERENCES client(id_client);
ALTER TABLE rezervare
add constraint hotel_fk_rezervare FOREIGN KEY(id_hotel) REFERENCES hotel(id_hotel);



--REM *********Introducerea de FK tabelului**** REZERVARE****************

--Prompt ******  Creating FK Constraints on table REZERVARE ....

ALTER TABLE recenzie
add constraint client_fk_recenzie FOREIGN KEY(id_client) REFERENCES client(id_client);
ALTER TABLE recenzie
add constraint hotel_fk_recenzie FOREIGN KEY(id_hotel) REFERENCES hotel(id_hotel);



--REM *********Introducerea de FK tabelului**** HOTEL****************

--Prompt ******  Creating FK Constraints on table HOTEL ....

ALTER TABLE hotel
add constraint localitate_fk_hotel FOREIGN KEY(id_localitate) REFERENCES localitate(id_localitate);



--REM *********Introducerea de FK tabelului**** LOCALITATE****************

--Prompt ******  Creating FK Constraints on table LOCALITATE ....

ALTER TABLE localitate
add constraint judet_fk_localitate FOREIGN KEY(id_judet) REFERENCES judet(id_judet);



--REM *********Introducerea de FK tabelului**** ****************

--Prompt ******  Creating FK Constraints on table JUDET ....
ALTER TABLE judet
add constraint regiune_fk_judet FOREIGN KEY(id_regiune) REFERENCES regiune(id_regiune);



--REM *********Introducerea de FK tabelului**** REZERVARE_TIP_CAMERA****************
--Prompt ******  Creating FK Constraints on table REZERVARE_TIP_CAMERA ....
ALTER TABLE rezervare_tip_camera
ADD CONSTRAINT rezervare_fk_rezervare_tip_camera FOREIGN KEY(id_rezervare) REFERENCES rezervare(id_rezervare);
ALTER TABLE rezervare_tip_camera
ADD CONSTRAINT tip_camera_fk_rezervare_tip_camera FOREIGN KEY (id_tip_camera) REFERENCES tip_camera(id_tip_camera);



--REM *********Introducerea de FK tabelului**** HOTEL_TIP_CAMERA****************
--Prompt ******  Creating FK Constraints on table HOTEL_TIP_CAMERA ....
ALTER TABLE hotel_tip_camera
ADD CONSTRAINT hotel_fk_hotel_tip_camera FOREIGN KEY(id_hotel) REFERENCES hotel(id_hotel);
ALTER TABLE hotel_tip_camera
ADD CONSTRAINT tip_camera_fk_hotel_tip_camera FOREIGN KEY (id_tip_camera) REFERENCES tip_camera(id_tip_camera);

COMMIT;


DROP SEQUENCE IF EXISTS hotel_serv1_seq;
CREATE SEQUENCE hotel_serv1_seq
INCREMENT BY 2
START WITH 1001;

DROP SEQUENCE IF EXISTS hotel_serv2_seq;
CREATE SEQUENCE hotel_serv2_seq
INCREMENT BY 2
START WITH 1000;


DROP SEQUENCE IF EXISTS localitate_serv1_seq;
CREATE SEQUENCE localitate_serv1_seq
INCREMENT BY 2
START WITH 1;

DROP SEQUENCE IF EXISTS localitate_serv2_seq;
CREATE SEQUENCE localitate_serv2_seq
INCREMENT BY 2
START WITH 2;

