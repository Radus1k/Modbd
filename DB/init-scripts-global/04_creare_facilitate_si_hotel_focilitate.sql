SET search_path = global_hotels;

DROP TABLE IF EXISTS facilitate CASCADE;
CREATE TABLE facilitate( id_facilitate BIGINT GENERATED ALWAYS AS IDENTITY ( START WITH 1 INCREMENT BY 1),
						nume TEXT CONSTRAINT nume_facilitate_nn NOT NULL );

ALTER TABLE facilitate
ADD CONSTRAINT id_facilitate_pk PRIMARY KEY (id_facilitate);



DROP TABLE IF EXISTS hotel_facilitate CASCADE;
CREATE TABLE hotel_facilitate(id_hotel BIGINT CONSTRAINT id_hotel_hotel_facilitate_nn NOT NULL,
							  id_facilitate BIGINT CONSTRAINT id_facilitate_hotel_facilitate_nn NOT NULL);
ALTER TABLE hotel_facilitate
ADD CONSTRAINT hotel_facilitate_pk PRIMARY KEY (id_hotel,id_facilitate);

ALTER TABLE hotel_facilitate
ADD CONSTRAINT hotel_fk_hotel_facilitate FOREIGN KEY(id_hotel) REFERENCES hotel(id_hotel);

ALTER TABLE hotel_facilitate
ADD CONSTRAINT facilitate_fk_hotel_facilitate FOREIGN KEY(id_facilitate) REFERENCES facilitate(id_facilitate);
