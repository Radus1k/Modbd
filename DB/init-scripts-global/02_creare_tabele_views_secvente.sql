DROP VIEW IF EXISTS regiune;
CREATE VIEW regiune AS
SELECT * FROM 
dblink(informatii_conectare_bd(1),'SELECT id_regiune,nume FROM regiune;') 
AS j1(id_regiune INT, nume TEXT)
UNION 
SELECT * FROM 
dblink(informatii_conectare_bd(2),'SELECT id_regiune,nume FROM regiune;') 
AS r2(id_regiune INT ,nume TEXT);
SELECT * FROM regiune;



DROP VIEW IF EXISTS judet;
CREATE VIEW judet AS
SELECT * FROM 
dblink(informatii_conectare_bd(1),'SELECT id_judet,nume,id_regiune FROM judet;') 
AS j1(id_judet INT, nume TEXT, id_regiune INT)
UNION 
SELECT * FROM 
dblink(informatii_conectare_bd(2),'SELECT id_judet,nume,id_regiune FROM judet;') 
AS j2(id_judet INT ,nume TEXT, id_regiune INT);
SELECT * FROM judet;

DROP SEQUENCE IF EXISTS judet_serv1_seq;
CREATE SEQUENCE judet_serv1_seq
INCREMENT BY 2
MINVALUE 1
START WITH 1;

DROP SEQUENCE IF EXISTS judet_serv2_seq;
CREATE SEQUENCE judet_serv2_seq
MINVALUE 2
INCREMENT BY 2
START WITH 2;



DROP VIEW IF EXISTS localitate;
CREATE VIEW localitate AS
SELECT * FROM 
dblink(informatii_conectare_bd(1),'SELECT id_localitate,nume,id_judet FROM localitate;') 
AS l1(id_localitate INT, nume TEXT, id_judet INT)
UNION 
SELECT * FROM 
dblink(informatii_conectare_bd(2),'SELECT id_localitate,nume,id_judet FROM localitate;') 
AS l2(id_localitate INT ,nume TEXT, id_judet INT);
SELECT * FROM localitate;



DROP VIEW IF EXISTS hotel;
CREATE VIEW hotel AS
SELECT * FROM 
dblink(informatii_conectare_bd(1),'SELECT id_hotel,nume,nr_stele,adresa,id_localitate FROM hotel;') 
AS h1(id_hotel INT, nume TEXT, nr_stele INT,adresa TEXT, id_localitate INT)
UNION 
SELECT * FROM 
dblink(informatii_conectare_bd(2),'SELECT id_hotel,nume,nr_stele,adresa,id_localitate FROM hotel;') 
AS h2(id_hotel INT, nume TEXT, nr_stele INT,adresa TEXT, id_localitate INT);
SELECT * FROM hotel;

DROP SEQUENCE IF EXISTS hotel_serv1_seq;
CREATE SEQUENCE hotel_serv1_seq
INCREMENT BY 2
START WITH 999;

DROP SEQUENCE IF EXISTS hotel_serv2_seq;
CREATE SEQUENCE hotel_serv2_seq
INCREMENT BY 2
START WITH 1000;



DROP VIEW IF EXISTS rezervare;
CREATE VIEW rezervare AS
SELECT * FROM 
dblink(informatii_conectare_bd(1),'SELECT id_rezervare,id_client,id_hotel,data_efectuarii,data_inceput,data_sfarsit,pret_total,specificatii FROM rezervare;') 
AS r1(id_rezervare INT,id_client INT,id_hotel INT,data_efectuarii DATE,data_inceput DATE,data_sfarsit DATE,pret_total REAL,specificatii TEXT)
UNION 
SELECT * FROM 
dblink(informatii_conectare_bd(2),'SELECT id_rezervare,id_client,id_hotel,data_efectuarii,data_inceput,data_sfarsit,pret_total,specificatii FROM rezervare;') 
AS r2(id_rezervare INT,id_client INT,id_hotel INT,data_efectuarii DATE,data_inceput DATE,data_sfarsit DATE,pret_total REAL,specificatii TEXT);
SELECT * FROM rezervare;

DROP SEQUENCE IF EXISTS rezervare_serv1_seq;
CREATE SEQUENCE rezervare_serv1_seq
INCREMENT BY 2
START WITH 999;

DROP SEQUENCE IF EXISTS rezervare_serv2_seq;
CREATE SEQUENCE rezervare_serv2_seq
INCREMENT BY 2
START WITH 1000;



DROP VIEW IF EXISTS recenzie;
CREATE VIEW recenzie AS
SELECT * FROM 
dblink(informatii_conectare_bd(1),'SELECT id_recenzie,id_client,id_hotel,scor,text_recenzie FROM recenzie;') 
AS r1(id_recenzie INT,id_client INT,id_hotel INT,scor INT,text_recenzie TEXT)
UNION 
SELECT * FROM 
dblink(informatii_conectare_bd(2),'SELECT id_recenzie,id_client,id_hotel,scor,text_recenzie FROM recenzie;') 
AS r2(id_recenzie INT,id_client INT,id_hotel INT,scor INT,text_recenzie TEXT);
SELECT * FROM recenzie;

DROP SEQUENCE IF EXISTS recenzie_serv1_seq;
CREATE SEQUENCE recenzie_serv1_seq
INCREMENT BY 2
START WITH 999;

DROP SEQUENCE IF EXISTS recenzie_serv2_seq;
CREATE SEQUENCE recenzie_serv2_seq
INCREMENT BY 2
START WITH 1000;


DROP SEQUENCE IF EXISTS localitate_serv1_seq;
CREATE SEQUENCE localitate_serv1_seq
INCREMENT BY 2
START WITH 999;

DROP SEQUENCE IF EXISTS localitate_serv2_seq;
CREATE SEQUENCE localitate_serv2_seq
INCREMENT BY 2
START WITH 1000;


DROP TABLE IF EXISTS tip_camera CASCADE;
CREATE TABLE tip_camera
( id_tip_camera BIGINT GENERATED ALWAYS as IDENTITY(START WITH 1 INCREMENT BY 1),
nr_paturi_duble SMALLINT CONSTRAINT nr_paturi_duble_tip_camera_nn NOT NULL,
nr_paturi_simple SMALLINT CONSTRAINT nr_paturi_simple_tip_camera_nn NOT NULL);

ALTER TABLE tip_camera
ADD CONSTRAINT id_tip_camera_pk PRIMARY KEY (id_tip_camera);



DROP VIEW IF EXISTS hotel_tip_camera;
CREATE VIEW hotel_tip_camera AS
SELECT * FROM 
dblink(informatii_conectare_bd(1),'SELECT id_hotel,id_tip_camera,nr_camere,pret_per_noapte FROM hotel_tip_camera;') 
AS ht1(id_hotel INT, id_tip_camera INT,nr_camere INT, pret_per_noapte REAL) 
UNION 
SELECT * FROM 
dblink(informatii_conectare_bd(2),'SELECT id_hotel,id_tip_camera,nr_camere,pret_per_noapte FROM hotel_tip_camera;') 
AS ht2(id_hotel INT, id_tip_camera INT,nr_camere INT, pret_per_noapte REAL);
SELECT * FROM hotel_tip_camera;



DROP VIEW IF EXISTS rezervare_tip_camera;
CREATE VIEW rezervare_tip_camera AS
SELECT * FROM 
dblink(informatii_conectare_bd(1),'SELECT id_rezervare,id_tip_camera,nr_camere,pret_per_noapte FROM rezervare_tip_camera;') 
AS ht1(id_rezervare INT, id_tip_camera INT,nr_camere INT, pret_per_noapte REAL) 
UNION 
SELECT * FROM 
dblink(informatii_conectare_bd(2),'SELECT id_rezervare,id_tip_camera,nr_camere,pret_per_noapte FROM rezervare_tip_camera;') 
AS ht2(id_rezervare INT, id_tip_camera INT,nr_camere INT, pret_per_noapte REAL);
SELECT * FROM rezervare_tip_camera;



DROP TABLE IF EXISTS client CASCADE;
CREATE TABLE client
( id_client BIGINT GENERATED ALWAYS as IDENTITY(START WITH 1 INCREMENT BY 1),
nume_utilizator VARCHAR(30) CONSTRAINT nume_client_nn NOT NULL,
hash_parola VARCHAR(25) CONSTRAINT hash_parola_client_nn NOT NULL,
nume_complet VARCHAR(30) CONSTRAINT nume_complet_client_nn NOT NULL,
telefon CHAR(15) CONSTRAINT telefon_client_nn NOT NULL,
email VARCHAR(50) CONSTRAINT email_client_nn NOT NULL,
cnp CHAR(13),
iban CHAR(34));

ALTER TABLE client
ADD CONSTRAINT id_client_pk PRIMARY KEY (id_client);


DROP TABLE IF EXISTS facilitate CASCADE;
CREATE TABLE facilitate( id_facilitate BIGINT GENERATED ALWAYS AS IDENTITY ( START WITH 1 INCREMENT BY 1),
						nume TEXT CONSTRAINT nume_facilitate_nn NOT NULL );

ALTER TABLE facilitate
ADD CONSTRAINT id_facilitate_pk PRIMARY KEY (id_facilitate);




DROP TABLE IF EXISTS administrator CASCADE;
CREATE TABLE administrator (
  id_administrator BIGINT PRIMARY KEY,
  nume_utilizator TEXT NOT NULL UNIQUE,
  hash_parola TEXT NOT NULL,
  nume_complet TEXT NOT NULL,
  telefon CHAR(15) NOT NULL,
  email TEXT NOT NULL UNIQUE,
  cnp CHAR(13) NOT NULL UNIQUE);